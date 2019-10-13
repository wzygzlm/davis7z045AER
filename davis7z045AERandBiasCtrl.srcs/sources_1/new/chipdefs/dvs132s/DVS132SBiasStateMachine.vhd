library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Functions.SizeCountNTimes;
use work.Functions.SizeCountUpToN;
use work.ShiftRegisterModes.all;
use work.Settings.LOGIC_CLOCK_FREQ;
use work.DVS132SBiasConfigRecords.all;
use work.DVS132S.BIAS_REG_LENGTH;

-- This is a minimal bias state machine for DVS132S chips to be used in
-- highly resource constrained applications.
entity DVS132SBiasStateMachine is
	port(
		Clock_CI               : in  std_logic;
		Reset_RI               : in  std_logic;

		-- Bias configuration outputs (to chip)
		BiasClock_CO           : out std_logic;
		BiasData_DO            : out std_logic;
		BiasUpdate_SO          : out std_logic;
		
		-- Bias enable control.
		BiasDrive_SO           : out std_logic;
		BiasTie_SBO            : out std_logic;
		BiasEnable_SO          : out std_logic;

		-- SPI configuration inputs and outputs.
		ConfigBiasEnable_SI    : in  std_logic;
		ConfigModuleAddress_DI : in  unsigned(6 downto 0);
		ConfigParamAddress_DI  : in  unsigned(7 downto 0);
		ConfigParamInput_DI    : in  std_logic_vector(31 downto 0);
		ConfigLatchInput_SI    : in  std_logic);
end entity DVS132SBiasStateMachine;

architecture Behavioral of DVS132SBiasStateMachine is
	attribute syn_enum_encoding : string;

	type tBiasState is (stIdle, stSendBias, stLatchBias, stDelay, stLoadBias);
	attribute syn_enum_encoding of tBiasState : type is "onehot";

	signal BiasState_DP, BiasState_DN : tBiasState;

	-- Bias clock frequency in MHz.
	constant BIAS_CLOCK_FREQ : real := 1.0;

	-- How long the latch should be asserted, based on bias clock frequency.
	constant LATCH_LENGTH : integer := 10;

	-- Calculated values in cycles.
	constant BIAS_CLOCK_CYCLES : integer := integer(LOGIC_CLOCK_FREQ / BIAS_CLOCK_FREQ);
	constant LATCH_CYCLES      : integer := BIAS_CLOCK_CYCLES * LATCH_LENGTH;

	-- Calcualted length of cycles counter. Based on latch cycles, since biggest value.
	constant WAIT_CYCLES_COUNTER_SIZE : integer := SizeCountNTimes(LATCH_CYCLES);

	-- Counts number of sent bits.
	constant SENT_BITS_COUNTER_SIZE : integer := SizeCountNTimes(BIAS_REG_LENGTH);

	-- Data shift registers for output.
	signal BiasSRMode_S   : std_logic_vector(SHIFTREGISTER_MODE_SIZE - 1 downto 0);
	signal BiasSROutput_D : std_logic_vector(BIAS_REG_LENGTH - 1 downto 0);

	-- Counter for keeping track of output bits.
	signal SentBitsCounterClear_S, SentBitsCounterEnable_S : std_logic;
	signal SentBitsCounterData_D                           : unsigned(SENT_BITS_COUNTER_SIZE - 1 downto 0);

	-- Counter to introduce delays between operations, and generate the clock.
	signal WaitCyclesCounterClear_S, WaitCyclesCounterEnable_S : std_logic;
	signal WaitCyclesCounterData_D                             : unsigned(WAIT_CYCLES_COUNTER_SIZE - 1 downto 0);

	-- Register configuration inputs.
	signal LatchConfigReg_S                           : std_logic;
	signal ChipBiasConfigReg_DP, ChipBiasConfigReg_DN : tDVS132SBiasConfig;
	signal ChipBiasConfig_D                           : tDVS132SBiasConfig;

	signal BiasWriteOut_S : std_logic;

	-- Chip bias enable control.
	type tChipState is (stIdle, stBiasEnable, stBiasUntie, stBiasDrive, stBiasHold, stBiasTie, stBiasDisable);
	attribute syn_enum_encoding of tChipState : type is "onehot";

	signal ChipState_DP, ChipState_DN : tChipState;

	signal RunChipChanged_S, RunChipHandled_S : std_logic;

	constant CHIP_TIME_COUNTER_SIZE                        : integer := SizeCountUpToN(100.0 * 1000.0 * LOGIC_CLOCK_FREQ);
	signal ChipTimeCounterEnable_S, ChipTimeCounterClear_S : std_logic;
	signal ChipTimeCounter_D                               : unsigned(CHIP_TIME_COUNTER_SIZE - 1 downto 0);

	-- Register all outputs.
	signal BiasClockReg_C  : std_logic;
	signal BiasDataReg_D   : std_logic;
	signal BiasUpdateReg_S : std_logic;

	signal BiasDriveReg_SP, BiasDriveReg_SN   : std_logic;
	signal BiasTieReg_SPB, BiasTieReg_SNB     : std_logic;
	signal BiasEnableReg_SP, BiasEnableReg_SN : std_logic;
begin
	biasSM : process(BiasState_DP, BiasSROutput_D, SentBitsCounterData_D, WaitCyclesCounterData_D, BiasWriteOut_S)
	begin
		-- Keep state by default.
		BiasState_DN <= BiasState_DP;

		-- Default state for bias config outputs.
		BiasClockReg_C  <= '0';
		BiasDataReg_D   <= '0';
		BiasUpdateReg_S <= '0';

		BiasSRMode_S <= SHIFTREGISTER_MODE_DO_NOTHING;

		WaitCyclesCounterClear_S  <= '0';
		WaitCyclesCounterEnable_S <= '0';

		SentBitsCounterClear_S  <= '0';
		SentBitsCounterEnable_S <= '0';

		case BiasState_DP is
			when stIdle =>
				if BiasWriteOut_S then
					BiasState_DN <= stLoadBias;
				end if;

			when stLoadBias =>
				BiasSRMode_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				BiasState_DN <= stSendBias;

			when stSendBias =>
				-- Shift it out, slowly, over the bias ports.
				BiasDataReg_D <= BiasSROutput_D(0);

				-- Wait for one full clock cycle, then switch to the next bit.
				WaitCyclesCounterEnable_S <= '1';

				if WaitCyclesCounterData_D = (BIAS_CLOCK_CYCLES - 1) then
					WaitCyclesCounterEnable_S <= '0';
					WaitCyclesCounterClear_S  <= '1';

					-- Move to next bit.
					BiasSRMode_S <= SHIFTREGISTER_MODE_SHIFT_RIGHT;

					-- Count up one, this bit is done!
					SentBitsCounterEnable_S <= '1';

					if SentBitsCounterData_D = (BIAS_REG_LENGTH - 1) then
						SentBitsCounterEnable_S <= '0';
						SentBitsCounterClear_S  <= '1';

						-- Move to next state, this SR is fully shifted out now.
						BiasState_DN <= stLatchBias;
					end if;
				end if;

				-- Clock data. Clock is active high, data is latched on negative edge.
				if WaitCyclesCounterData_D < (BIAS_CLOCK_CYCLES / 2) then
					BiasClockReg_C <= '1';
				end if;

			when stLatchBias =>
				-- Latch new config.
				BiasUpdateReg_S <= '1';

				-- Keep latch active for a few cycles.
				WaitCyclesCounterEnable_S <= '1';

				if WaitCyclesCounterData_D = (LATCH_CYCLES - 1) then
					WaitCyclesCounterEnable_S <= '0';
					WaitCyclesCounterClear_S  <= '1';

					BiasState_DN <= stDelay;
				end if;

			when stDelay =>
				-- Delay by one cycle to ensure no back-to-back updates can happen.
				WaitCyclesCounterEnable_S <= '1';

				if WaitCyclesCounterData_D = (BIAS_CLOCK_CYCLES - 1) then
					WaitCyclesCounterEnable_S <= '0';
					WaitCyclesCounterClear_S  <= '1';

					BiasState_DN <= stIdle;
				end if;

			when others => null;
		end case;
	end process biasSM;

	LatchConfigReg_S <= '1' when (ConfigModuleAddress_DI = BIAS_CONFIG_MODULE_ADDRESS and ConfigLatchInput_SI = '1') else '0';

	configIO : process(ConfigParamAddress_DI, ConfigParamInput_DI, ChipBiasConfigReg_DP)
	begin
		ChipBiasConfigReg_DN <= ChipBiasConfigReg_DP;

		case ConfigParamAddress_DI is
			when DVS132S_BIAS_CONFIG_PARAM_ADDRESSES.Bias_D =>
				ChipBiasConfigReg_DN.Bias_D <= ConfigParamInput_DI(tDVS132SBiasConfig.Bias_D'range);

			when DVS132S_BIAS_CONFIG_PARAM_ADDRESSES.BiasWrite_S =>
				ChipBiasConfigReg_DN.BiasWrite_S <= ConfigParamInput_DI(0);

			when others => null;
		end case;
	end process configIO;

	waitCyclesCounter : entity work.Counter
		generic map(
			SIZE => WAIT_CYCLES_COUNTER_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Clear_SI  => WaitCyclesCounterClear_S,
			Enable_SI => WaitCyclesCounterEnable_S,
			Data_DO   => WaitCyclesCounterData_D);

	sentBitsCounter : entity work.Counter
		generic map(
			SIZE => SENT_BITS_COUNTER_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Clear_SI  => SentBitsCounterClear_S,
			Enable_SI => SentBitsCounterEnable_S,
			Data_DO   => SentBitsCounterData_D);

	biasSR : entity work.ShiftRegister
		generic map(
			SIZE => BIAS_REG_LENGTH)
		port map(
			Clock_CI         => Clock_CI,
			Reset_RI         => Reset_RI,
			Mode_SI          => BiasSRMode_S,
			DataIn_DI        => '0',
			ParallelWrite_DI => ChipBiasConfig_D.Bias_D,
			ParallelRead_DO  => BiasSROutput_D);

	biasWriteCommand : entity work.EdgeDetector
		port map(
			Clock_CI               => Clock_CI,
			Reset_RI               => Reset_RI,
			InputSignal_SI         => ChipBiasConfig_D.BiasWrite_S,
			RisingEdgeDetected_SO  => open,
			FallingEdgeDetected_SO => BiasWriteOut_S);

	regUpdate : process(Clock_CI, Reset_RI) is
	begin
		if Reset_RI then
			BiasState_DP <= stIdle;
			ChipState_DP <= stIdle;

			ChipBiasConfigReg_DP <= tDVS132SBiasConfigDefault;
			ChipBiasConfig_D     <= tDVS132SBiasConfigDefault;

			BiasClock_CO     <= '0';
			BiasData_DO      <= '0';
			BiasUpdate_SO    <= '0';
			BiasDriveReg_SP  <= '0';
			BiasTieReg_SPB   <= '0';
			BiasEnableReg_SP <= '0';
		elsif rising_edge(Clock_CI) then
			BiasState_DP <= BiasState_DN;
			ChipState_DP <= ChipState_DN;

			if LatchConfigReg_S then
				ChipBiasConfigReg_DP <= ChipBiasConfigReg_DN;
			end if;
			ChipBiasConfig_D <= ChipBiasConfigReg_DP;

			BiasClock_CO     <= BiasClockReg_C;
			BiasData_DO      <= BiasDataReg_D;
			BiasUpdate_SO    <= BiasUpdateReg_S;
			BiasDriveReg_SP  <= BiasDriveReg_SN;
			BiasTieReg_SPB   <= BiasTieReg_SNB;
			BiasEnableReg_SP <= BiasEnableReg_SN;
		end if;
	end process regUpdate;

	BiasDrive_SO  <= BiasDriveReg_SP;
	BiasTie_SBO   <= BiasTieReg_SPB;
	BiasEnable_SO <= BiasEnableReg_SP;

	runChipDetector : entity work.ChangeDetector
		generic map(
			SIZE => 1)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI(0)       => ConfigBiasEnable_SI,
			ChangeDetected_SO     => RunChipChanged_S,
			ChangeAcknowledged_SI => RunChipHandled_S);

	runChipTimeCounter : entity work.Counter
		generic map(
			SIZE => CHIP_TIME_COUNTER_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Clear_SI  => ChipTimeCounterClear_S,
			Enable_SI => ChipTimeCounterEnable_S,
			Data_DO   => ChipTimeCounter_D);

	chipSM : process(ChipState_DP, RunChipChanged_S, ConfigBiasEnable_SI, BiasDriveReg_SP, BiasEnableReg_SP, BiasTieReg_SPB, ChipTimeCounter_D)
	begin
		-- Keep state by default.
		ChipState_DN <= ChipState_DP;

		-- Default state for bias config outputs.
		BiasDriveReg_SN  <= BiasDriveReg_SP;
		BiasTieReg_SNB   <= BiasTieReg_SPB;
		BiasEnableReg_SN <= BiasEnableReg_SP;

		RunChipHandled_S <= '0';

		ChipTimeCounterEnable_S <= '0';
		ChipTimeCounterClear_S  <= '0';

		case ChipState_DP is
			when stIdle =>
				ChipTimeCounterClear_S <= '1';

				if RunChipChanged_S then
					RunChipHandled_S <= '1';

					if ConfigBiasEnable_SI then
						ChipState_DN <= stBiasEnable;
					else
						ChipState_DN <= stBiasHold;
					end if;
				end if;

			when stBiasEnable =>
				BiasEnableReg_SN <= '1';

				-- Wait 100 ms.
				ChipTimeCounterEnable_S <= '1';

				if ChipTimeCounter_D = integer(100.0 * 1000.0 * LOGIC_CLOCK_FREQ) then
					ChipTimeCounterClear_S <= '1';

					ChipState_DN <= stBiasUntie;
				end if;

			when stBiasUntie =>
				BiasTieReg_SNB <= '1';

				-- Wait 1 us.
				ChipTimeCounterEnable_S <= '1';

				if ChipTimeCounter_D = integer(1.0 * LOGIC_CLOCK_FREQ) then
					ChipTimeCounterClear_S <= '1';

					ChipState_DN <= stBiasDrive;
				end if;

			when stBiasDrive =>
				BiasDriveReg_SN <= '1';

				-- Wait 1 us.
				ChipTimeCounterEnable_S <= '1';

				if ChipTimeCounter_D = integer(1.0 * LOGIC_CLOCK_FREQ) then
					ChipTimeCounterClear_S <= '1';

					ChipState_DN <= stIdle;
				end if;

			when stBiasHold =>
				BiasDriveReg_SN <= '0';

				-- Wait 1 us.
				ChipTimeCounterEnable_S <= '1';

				if ChipTimeCounter_D = integer(1.0 * LOGIC_CLOCK_FREQ) then
					ChipTimeCounterClear_S <= '1';

					ChipState_DN <= stBiasTie;
				end if;

			when stBiasTie =>
				BiasTieReg_SNB <= '0';

				-- Wait 1 us.
				ChipTimeCounterEnable_S <= '1';

				if ChipTimeCounter_D = integer(1.0 * LOGIC_CLOCK_FREQ) then
					ChipTimeCounterClear_S <= '1';

					ChipState_DN <= stBiasDisable;
				end if;

			when stBiasDisable =>
				BiasEnableReg_SN <= '0';

				-- Wait 1 us.
				ChipTimeCounterEnable_S <= '1';

				if ChipTimeCounter_D = integer(1.0 * LOGIC_CLOCK_FREQ) then
					ChipTimeCounterClear_S <= '1';

					ChipState_DN <= stIdle;
				end if;

			when others => null;
		end case;
	end process chipSM;
end architecture Behavioral;
