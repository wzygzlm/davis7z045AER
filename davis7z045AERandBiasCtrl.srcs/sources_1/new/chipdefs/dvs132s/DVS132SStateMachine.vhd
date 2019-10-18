library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Functions.SizeCountNTimes;
use work.Functions.BooleanToStdLogic;
use work.EventCodes.all;
use work.FIFORecords.all;
use work.ShiftRegisterModes.all;
use work.DVS132SConfigRecords.all;
use work.DVS132S.DVS_BUS_SIZE;
use work.DVS132S.DVS_ADDR_SIZE;
use work.DVS132S.DVS_YEND;
use work.DVS132S.DVS_XEND;
use work.DVS132S.ARRAY_PIXEL_GROUP_SIZE;
use work.DVS132S.ARRAY_CFG_REG_LENGTH;
use work.Settings.LOGIC_CLOCK_FREQ;
use work.Settings.CHIP_DVS_SIZE_COLUMNS;
use work.Settings.CHIP_DVS_SIZE_ROWS;
use work.Settings.CHIP_DVS_ORIGIN_POINT;

-- Axis/readout inversion and adjustment is done in the memory map of the decoder!
entity DVS132SStateMachine is
	generic(
		ENABLE_STATISTICS : boolean := false;
		ENABLE_DEBUG      : boolean := false);
	port(
		Clock_CI                : in  std_logic;
		Reset_RI                : in  std_logic;

		-- Fifo output (to Multiplexer)
		OutFifoControl_SI       : in  tFromFifoWriteSide;
		OutFifoControl_SO       : out tToFifoWriteSide;
		OutFifoData_DO          : out std_logic_vector(EVENT_WIDTH - 1 downto 0);

		DVSArrayConfigData_DO   : out std_logic;
		DVSArrayConfigClock_CO  : out std_logic;
		DVSArraySample_SO       : out std_logic;
		DVSArrayRestart_SO      : out std_logic;
		DVSArraySenseY_SO       : out std_logic;
		DVSXYSelect_SO          : out std_logic; -- '1' is X, '0' is Y address.
		DVSXReset_SBO           : out std_logic;
		DVSXClock_CO            : out std_logic;
		DVSYReset_SBO           : out std_logic;
		DVSYClock_CO            : out std_logic;
		DVSXYAddress_AI         : in  std_logic_vector(DVS_BUS_SIZE - 1 downto 0);
		DVSOnPolarity_AI        : in  std_logic_vector(ARRAY_PIXEL_GROUP_SIZE - 1 downto 0);
		DVSOffPolarity_AI       : in  std_logic_vector(ARRAY_PIXEL_GROUP_SIZE - 1 downto 0);

		-- Configuration input and output
		DVS132SConfig_DI        : in  tDVS132SConfig;
		DVS132SConfigInfoOut_DO : out tDVS132SConfigInfoOut);
end DVS132SStateMachine;

architecture Behavioral of DVS132SStateMachine is
	component dvs132sDecoder is
		port(
			Address    : in  std_logic_vector(DVS_BUS_SIZE - 1 downto 0);
			OutClock   : in  std_logic;
			OutClockEn : in  std_logic;
			Reset      : in  std_logic;
			Q          : out std_logic_vector(DVS_ADDR_SIZE downto 0)); -- +1 length due to error bit.
	end component dvs132sDecoder;

	attribute syn_enum_encoding : string;

	-- Decoder ROM IO.
	signal DVSDecoderROMInput_D  : std_logic_vector(DVS_BUS_SIZE - 1 downto 0);
	signal DVSDecoderROMOutput_D : std_logic_vector(DVS_ADDR_SIZE downto 0); -- +1 length due to error bit.

	type tACfgState is (stIdle, stLoadSR, stSendCfg, stDelay, stCheckArrayReadoutInProgress);
	attribute syn_enum_encoding of tACfgState : type is "onehot";

	signal ACfgState_DP, ACfgState_DN : tACfgState;

	-- Array configuration clock frequency in MHz.
	constant ARRAY_CFG_CLOCK_FREQ : real := 1.0;

	-- Calculated values in cycles.
	constant ARRAY_CFG_CLOCK_CYCLES : integer := integer(LOGIC_CLOCK_FREQ / ARRAY_CFG_CLOCK_FREQ);

	-- Calcualted length of cycles counter.
	constant ARRAY_CFG_CLOCK_COUNTER_SIZE : integer := SizeCountNTimes(ARRAY_CFG_CLOCK_CYCLES);

	-- Counts number of sent bits.
	constant ARRAY_CFG_BITS_COUNTER_SIZE : integer := SizeCountNTimes(ARRAY_CFG_REG_LENGTH);

	-- Configuration change notification for array config reg.
	signal ACfg_D          : std_logic_vector(ARRAY_CFG_REG_LENGTH - 1 downto 0);
	signal ACfgChangeDet_S : std_logic;
	signal ACfgChangeAck_S : std_logic;

	-- Data shift registers for output.
	signal ACfgSRMode_S   : std_logic_vector(SHIFTREGISTER_MODE_SIZE - 1 downto 0);
	signal ACfgSROutput_D : std_logic_vector(ARRAY_CFG_REG_LENGTH - 1 downto 0);

	-- Counter to introduce delays between operations, and generate the clock.
	signal ACfgClockCounterClear_S, ACfgClockCounterEnable_S : std_logic;
	signal ACfgClockCounterData_D                            : unsigned(ARRAY_CFG_CLOCK_COUNTER_SIZE - 1 downto 0);

	-- Counter for keeping track of output bits.
	signal ACfgBitsCounterClear_S, ACfgBitsCounterEnable_S : std_logic;
	signal ACfgBitsCounterData_D                           : unsigned(ARRAY_CFG_BITS_COUNTER_SIZE - 1 downto 0);

	-- DVS global readout SM.
	type tACtrlState is (stIdle, stSample, stSenseDelay, stSense, stRestartDelay, stRestart, stNextCaptureDelay, stDoneRead, stDoneTime);
	attribute syn_enum_encoding of tACtrlState : type is "onehot";

	-- present and next state
	signal ACtrlState_DP, ACtrlState_DN : tACtrlState;

	-- DVS global readout time counters.
	signal RestartTimeClear_S     : std_logic;
	signal RestartTimeDone_S      : std_logic;
	signal CaptureIntervalClear_S : std_logic;
	signal CaptureIntervalDone_S  : std_logic;

	-- DVS readout SM.
	type tAReadState is (stIdle, stResetYClock, stResetYWait, stResetYDone, stClockYStart, stClockYWait, stAddrYRead, stAddrYInterpret, stDone, stResetXClock, stResetXWait, stResetXDone, stClockXStart, stClockXWait, stAddrXRead, stAddrXInterpret, stClockYWait2, stClockXWait2);
	attribute syn_enum_encoding of tAReadState : type is "onehot";

	-- present and next state
	signal AReadState_DP, AReadState_DN : tAReadState;

	-- DVS readout SM communication.
	signal ArrayConfigInProgress_SP, ArrayConfigInProgress_SN             : std_logic;
	signal ArrayReadoutInProgress_SP, ArrayReadoutInProgress_SN           : std_logic;
	signal RowReadoutInProgress_SP, RowReadoutStart_SN, RowReadoutDone_SN : std_logic;

	-- External readout halt.
	signal ReadyForMoreData_S : std_logic;

	-- Data from DVS chip (raw readout).
	signal ChipReadXYValueRegEnable_S  : std_logic;
	signal ChipReadXYValueReg_D        : std_logic_vector(DVS_BUS_SIZE - 1 downto 0);
	signal ChipReadOnValueRegEnable_S  : std_logic;
	signal ChipReadOnValueReg_D        : std_logic_vector(ARRAY_PIXEL_GROUP_SIZE - 1 downto 0);
	signal ChipReadOffValueRegEnable_S : std_logic;
	signal ChipReadOffValueReg_D       : std_logic_vector(ARRAY_PIXEL_GROUP_SIZE - 1 downto 0);

	-- Data from DVS, after readout and then decoding.
	constant DVS_TYPE_NOTHING   : std_logic_vector(1 downto 0) := "00";
	constant DVS_TYPE_ADDRESS_Y : std_logic_vector(1 downto 0) := "01";
	constant DVS_TYPE_ADDRESS_X : std_logic_vector(1 downto 0) := "10";
	constant DVS_TYPE_POLARITY  : std_logic_vector(1 downto 0) := "11";

	constant DVS_POLARITIES_SIZE : integer := 2 * ARRAY_PIXEL_GROUP_SIZE;
	constant DVS_DATA_SIZE       : integer := maximum(DVS_POLARITIES_SIZE, DVS_ADDR_SIZE);

	signal DVSRawTypeIn_D, DVSRawTypeOut_D : std_logic_vector(1 downto 0);
	signal DVSRawDataIn_D, DVSRawDataOut_D : std_logic_vector(DVS_BUS_SIZE - 1 downto 0);

	signal DVSDecoderTypeIn_D, DVSDecoderTypeOut_D : std_logic_vector(1 downto 0);
	signal DVSDecoderDataIn_D, DVSDecoderDataOut_D : std_logic_vector(DVS_POLARITIES_SIZE - 1 downto 0);

	signal DVSErrorDetectTypeIn_D, DVSErrorDetectTypeOut_D : std_logic_vector(1 downto 0);
	signal DVSErrorDetectDataIn_D, DVSErrorDetectDataOut_D : std_logic_vector(DVS_DATA_SIZE - 1 downto 0);

	signal DVSPresAddrTypeIn_D, DVSPresAddrTypeOut_D : std_logic_vector(1 downto 0);
	signal DVSPresAddrDataIn_D, DVSPresAddrDataOut_D : std_logic_vector(DVS_DATA_SIZE - 1 downto 0);

	-- Register outputs to DVS.
	signal ACfgDataReg_D                            : std_logic;
	signal ACfgClockReg_C                           : std_logic;
	signal ACtrlSampleReg_S                         : std_logic;
	signal ACtrlRestartReg_S                        : std_logic;
	signal ACtrlSenseYReg_S                         : std_logic;
	signal AReadXYSelectReg_SP, AReadXYSelectReg_SN : std_logic; -- '1' is X, '0' is Y address.
	signal AReadXResetReg_SP, AReadXResetReg_SN     : std_logic;
	signal AReadXClockReg_C                         : std_logic;
	signal AReadYResetReg_SP, AReadYResetReg_SN     : std_logic;
	signal AReadYClockReg_C                         : std_logic;

	constant SELECT_Y : std_logic := '0';
	constant SELECT_X : std_logic := '1';

	-- Register configuration input and output.
	signal DVS132SConfigReg_D : tDVS132SConfig;

	-- Statistics support.
	signal StatisticsTransactionsSuccess_SN : std_logic;
	signal StatisticsTransactionsSkipped_SN : std_logic;
	signal StatisticsTransactionsErrored_SN : std_logic;

	-- Debug support.
	signal DebugErrorTooManyZeroes_SN  : std_logic;
	signal DebugErrorTooManyOnes_SN    : std_logic;
	signal DebugErrorInvalidAddress_SN : std_logic;
	signal DebugErrorPolaritiesZero_SN : std_logic;
	signal DebugErrorPolaritiesBoth_SN : std_logic;
begin
	ACfg_D <= DVS132SConfigReg_D.ColumnEnable51To32_S & DVS132SConfigReg_D.ColumnEnable31To0_S & DVS132SConfigReg_D.FilterAtLeast2Signed_S & DVS132SConfigReg_D.FilterNotAll4Signed_S & DVS132SConfigReg_D.FilterNotAll4Unsigned_S & DVS132SConfigReg_D.FilterAtLeast2Unsigned_S & DVS132SConfigReg_D.RowEnable65To64_S & DVS132SConfigReg_D.RowEnable63To32_S & DVS132SConfigReg_D.RowEnable31To0_S & BooleanToStdLogic(ENABLE_DEBUG);

	aCfgChangeDetector : entity work.ChangeDetector
		generic map(
			SIZE => ARRAY_CFG_REG_LENGTH)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => ACfg_D,
			ChangeDetected_SO     => ACfgChangeDet_S,
			ChangeAcknowledged_SI => ACfgChangeAck_S);

	aCfgClockCounter : entity work.Counter
		generic map(
			SIZE => ARRAY_CFG_CLOCK_COUNTER_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Clear_SI  => ACfgClockCounterClear_S,
			Enable_SI => ACfgClockCounterEnable_S,
			Data_DO   => ACfgClockCounterData_D);

	aCfgBitsCounter : entity work.Counter
		generic map(
			SIZE => ARRAY_CFG_BITS_COUNTER_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Clear_SI  => ACfgBitsCounterClear_S,
			Enable_SI => ACfgBitsCounterEnable_S,
			Data_DO   => ACfgBitsCounterData_D);

	aCfgSR : entity work.ShiftRegister
		generic map(
			SIZE => ARRAY_CFG_REG_LENGTH)
		port map(
			Clock_CI         => Clock_CI,
			Reset_RI         => Reset_RI,
			Mode_SI          => ACfgSRMode_S,
			DataIn_DI        => '0',
			ParallelWrite_DI => ACfg_D,
			ParallelRead_DO  => ACfgSROutput_D);

	aCfgSM : process(ACfgState_DP, ACfgBitsCounterData_D, ACfgChangeDet_S, ACfgClockCounterData_D, ACfgSROutput_D, ArrayConfigInProgress_SP, ArrayReadoutInProgress_SP)
	begin
		-- Keep state by default.
		ACfgState_DN <= ACfgState_DP;

		ArrayConfigInProgress_SN <= ArrayConfigInProgress_SP;

		-- Default state for outputs.
		ACfgClockReg_C <= '0';
		ACfgDataReg_D  <= '0';

		ACfgSRMode_S <= SHIFTREGISTER_MODE_DO_NOTHING;

		ACfgChangeAck_S <= '0';

		ACfgClockCounterClear_S  <= '0';
		ACfgClockCounterEnable_S <= '0';

		ACfgBitsCounterClear_S  <= '0';
		ACfgBitsCounterEnable_S <= '0';

		case ACfgState_DP is
			when stIdle =>
				if ACfgChangeDet_S and not ArrayReadoutInProgress_SP then
					ACfgState_DN <= stCheckArrayReadoutInProgress;

					ArrayConfigInProgress_SN <= '1';
				end if;

			when stCheckArrayReadoutInProgress =>
				-- If both SMs try to start at the same time, they would both see the other
				-- not running and start, clashing, which we want to avoid. So we give priority
				-- to the readout, which always runs, while the configuration does a second
				-- check to see if the readout is still not running, if yes it can continue,
				-- sure that the readout will see its own ConfigInProgress state. If on the
				-- other hand the readout did start (signal ReadoutInProgress), then we just
				-- go back to stIdle and wait for it to finish.
				if not ArrayReadoutInProgress_SP then
					ACfgState_DN <= stLoadSR;
				else
					ACfgState_DN <= stIdle;

					ArrayConfigInProgress_SN <= '0';
				end if;

			when stLoadSR =>
				ACfgChangeAck_S <= '1';

				ACfgSRMode_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				ACfgState_DN <= stSendCfg;

			when stSendCfg =>
				-- Shift it out, slowly, over the bias ports.
				ACfgDataReg_D <= ACfgSROutput_D(0);

				-- Wait for one full clock cycle, then switch to the next bit.
				ACfgClockCounterEnable_S <= '1';

				if ACfgClockCounterData_D = (ARRAY_CFG_CLOCK_CYCLES - 1) then
					ACfgClockCounterEnable_S <= '0';
					ACfgClockCounterClear_S  <= '1';

					-- Move to next bit.
					ACfgSRMode_S <= SHIFTREGISTER_MODE_SHIFT_RIGHT;

					-- Count up one, this bit is done!
					ACfgBitsCounterEnable_S <= '1';

					if ACfgBitsCounterData_D = (ARRAY_CFG_REG_LENGTH - 1) then
						ACfgBitsCounterEnable_S <= '0';
						ACfgBitsCounterClear_S  <= '1';

						-- Move to next state, this SR is fully shifted out now.
						ACfgState_DN <= stDelay;
					end if;
				end if;

				-- Clock data. Clock is active high, data is latched on negative edge.
				if ACfgClockCounterData_D < (ARRAY_CFG_CLOCK_CYCLES / 2) then
					ACfgClockReg_C <= '1';
				end if;

			when stDelay =>
				-- Delay by one cycle to ensure no back-to-back updates can happen.
				ACfgClockCounterEnable_S <= '1';

				if ACfgClockCounterData_D = (ARRAY_CFG_CLOCK_CYCLES - 1) then
					ACfgClockCounterEnable_S <= '0';
					ACfgClockCounterClear_S  <= '1';

					ACfgState_DN <= stIdle;

					ArrayConfigInProgress_SN <= '0';
				end if;

			when others => null;
		end case;
	end process aCfgSM;

	dvsRestartTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE              => DVS_RESTART_TIME_WIDTH,
			RESET_ON_OVERFLOW => false,
			GENERATE_OVERFLOW => true)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => RestartTimeClear_S,
			Enable_SI    => '1',
			DataLimit_DI => DVS132SConfigReg_D.RestartTime_D,
			Overflow_SO  => RestartTimeDone_S,
			Data_DO      => open);

	dvsCaptureIntervalCounter : entity work.ContinuousCounter
		generic map(
			SIZE              => DVS_CAPTURE_TIME_WIDTH,
			RESET_ON_OVERFLOW => false,
			GENERATE_OVERFLOW => true)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => CaptureIntervalClear_S,
			Enable_SI    => '1',
			DataLimit_DI => DVS132SConfigReg_D.CaptureInterval_D,
			Overflow_SO  => CaptureIntervalDone_S,
			Data_DO      => open);

	dvsControlLogic : process(ACtrlState_DP, DVS132SConfigReg_D, CaptureIntervalDone_S, RowReadoutInProgress_SP, ArrayReadoutInProgress_SP, ArrayConfigInProgress_SP, RestartTimeDone_S)
	begin
		ACtrlState_DN <= ACtrlState_DP; -- Keep current state by default.

		ArrayReadoutInProgress_SN <= ArrayReadoutInProgress_SP;

		RowReadoutStart_SN <= '0';

		RestartTimeClear_S     <= '0';
		CaptureIntervalClear_S <= '0';

		-- Default state for outputs.
		ACtrlSampleReg_S  <= '0';
		ACtrlRestartReg_S <= '0';
		ACtrlSenseYReg_S  <= '0';

		case ACtrlState_DP is
			when stIdle =>
				-- Reset main frame interval counter, so next capture happens on time.
				CaptureIntervalClear_S <= '1';

				if DVS132SConfigReg_D.Run_S and not ArrayConfigInProgress_SP then
					ACtrlState_DN <= stSample;

					ArrayReadoutInProgress_SN <= '1';
				end if;

			when stSample =>
				ACtrlSampleReg_S <= '1';

				ACtrlState_DN <= stSenseDelay;

			when stSenseDelay =>
				ACtrlState_DN <= stSense;

			when stSense =>
				ACtrlSenseYReg_S <= '1';

				-- Start readout SM.
				RowReadoutStart_SN <= '1';

				ACtrlState_DN <= stRestartDelay;

			when stRestartDelay =>
				-- Clear restart time counter for next state.
				RestartTimeClear_S <= '1';

				ACtrlState_DN <= stRestart;

			when stRestart =>
				ACtrlRestartReg_S <= '1';

				if RestartTimeDone_S then
					ACtrlState_DN <= stNextCaptureDelay;
				end if;

			when stNextCaptureDelay =>
				ACtrlState_DN <= stDoneRead;

			when stDoneRead =>
				if not RowReadoutInProgress_SP then
					ACtrlState_DN <= stDoneTime;

					ArrayReadoutInProgress_SN <= '0';
				end if;

			when stDoneTime =>
				-- Separate time check to add one additional clock cycle at end of readout,
				-- so that array configuration has time to see ReadoutInProgress = 0 and
				-- send the array configuration register chain out.
				if CaptureIntervalDone_S then
					ACtrlState_DN <= stIdle;
				end if;

			when others => null;
		end case;
	end process dvsControlLogic;

	dvsReadoutLogic : process(AReadState_DP, AReadXResetReg_SP, AReadXYSelectReg_SP, AReadYResetReg_SP, RowReadoutInProgress_SP, ChipReadXYValueReg_D, ChipReadOffValueReg_D, ChipReadOnValueReg_D, DVS132SConfigReg_D.WaitOnTransferStall_S, DVSRawTypeOut_D, ReadyForMoreData_S)
	begin
		AReadState_DN <= AReadState_DP; -- Keep current state by default.

		RowReadoutDone_SN <= '0';

		DVSRawTypeIn_D <= DVS_TYPE_NOTHING;
		DVSRawDataIn_D <= (others => '0');

		-- Default state for outputs.
		AReadXYSelectReg_SN <= AReadXYSelectReg_SP; -- '1' is X, '0' is Y address.
		AReadXResetReg_SN   <= AReadXResetReg_SP;
		AReadXClockReg_C    <= '0';
		AReadYResetReg_SN   <= AReadYResetReg_SP;
		AReadYClockReg_C    <= '0';

		ChipReadXYValueRegEnable_S  <= '0';
		ChipReadOnValueRegEnable_S  <= '0';
		ChipReadOffValueRegEnable_S <= '0';

		StatisticsTransactionsSuccess_SN <= '0';
		StatisticsTransactionsSkipped_SN <= '0';

		case AReadState_DP is
			when stIdle =>
				if RowReadoutInProgress_SP then
					AReadState_DN <= stResetYClock;
				end if;

			when stResetYClock =>
				AReadYClockReg_C <= '1';

				AReadState_DN <= stResetYWait;

			when stResetYWait =>
				AReadState_DN <= stResetYDone;

			when stResetYDone =>
				AReadYResetReg_SN <= '0'; -- Take Y chain out of reset.

				AReadState_DN <= stClockYStart;

			when stClockYStart =>
				AReadYClockReg_C <= '1';

				AReadState_DN <= stClockYWait;

			when stClockYWait =>
				AReadState_DN <= stClockYWait2;

			when stClockYWait2 =>
				AReadState_DN <= stAddrYRead;

			when stAddrYRead =>
				-- Read back value on next tick.
				ChipReadXYValueRegEnable_S <= '1';

				AReadState_DN <= stAddrYInterpret;

			when stAddrYInterpret =>
				-- Analyze value just read.
				if unsigned(ChipReadXYValueReg_D) = 0 then
					-- Value is ZERO: continue clocking.
					AReadYClockReg_C <= '1';

					AReadState_DN <= stClockYWait;
				elsif ChipReadXYValueReg_D = DVS_YEND then
					-- Value is YEND: reached end of scan chain, exit.
					AReadState_DN <= stDone;

					AReadYResetReg_SN <= '1'; -- Put Y chain in reset.
				elsif ReadyForMoreData_S then
					-- Value is something: send out, enter X scan chain.
					AReadState_DN <= stResetXClock;

					DVSRawTypeIn_D <= DVS_TYPE_ADDRESS_Y;
					DVSRawDataIn_D <= ChipReadXYValueReg_D;

					AReadXYSelectReg_SN <= SELECT_X; -- Select X addresses.
				end if;

			when stDone =>
				RowReadoutDone_SN <= '1';

				AReadState_DN <= stIdle;

			when stResetXClock =>
				AReadXClockReg_C <= '1';

				AReadState_DN <= stResetXWait;

			when stResetXWait =>
				AReadState_DN <= stResetXDone;

			when stResetXDone =>
				AReadXResetReg_SN <= '0'; -- Take X chain out of reset.

				AReadState_DN <= stClockXStart;

			when stClockXStart =>
				AReadXClockReg_C <= '1';

				AReadState_DN <= stClockXWait;

			when stClockXWait =>
				AReadState_DN <= stClockXWait2;

			when stClockXWait2 =>
				-- Send out second part of DVS info, the polarities.
				if DVSRawTypeOut_D = DVS_TYPE_ADDRESS_X then
					DVSRawTypeIn_D                                   <= DVS_TYPE_POLARITY;
					DVSRawDataIn_D(DVS_POLARITIES_SIZE - 1 downto 0) <= ChipReadOnValueReg_D & ChipReadOffValueReg_D;

					-- Statistics support.
					StatisticsTransactionsSuccess_SN <= '1';
				end if;

				AReadState_DN <= stAddrXRead;

			when stAddrXRead =>
				AReadXClockReg_C <= '1';

				-- Read back all values on next tick.
				ChipReadXYValueRegEnable_S  <= '1';
				ChipReadOnValueRegEnable_S  <= '1';
				ChipReadOffValueRegEnable_S <= '1';

				AReadState_DN <= stAddrXInterpret;

			when stAddrXInterpret =>
				-- Analyze value just read.
				if unsigned(ChipReadXYValueReg_D) = 0 then
					-- Value is ZERO: continue clocking.
					AReadState_DN <= stClockXWait2;
				elsif ChipReadXYValueReg_D = DVS_XEND then
					-- Value is XEND: reached end of scan chain, exit.
					AReadState_DN <= stClockYStart;

					AReadXResetReg_SN   <= '1'; -- Put X chain in reset.
					AReadXYSelectReg_SN <= SELECT_Y; -- Select Y addresses.
				elsif ReadyForMoreData_S or not DVS132SConfigReg_D.WaitOnTransferStall_S then
					-- Value is something: send out, continue clocking.
					AReadState_DN <= stClockXWait2;

					DVSRawTypeIn_D <= DVS_TYPE_ADDRESS_X when (ReadyForMoreData_S) else DVS_TYPE_NOTHING;
					DVSRawDataIn_D <= ChipReadXYValueReg_D;

					-- Statistics support.
					StatisticsTransactionsSkipped_SN <= not ReadyForMoreData_S;
				end if;

			when others => null;
		end case;
	end process dvsReadoutLogic;

	chipReadXYValueReg : entity work.SimpleRegister
		generic map(
			SIZE => DVS_BUS_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => ChipReadXYValueRegEnable_S,
			Input_SI  => DVSXYAddress_AI,
			Output_SO => ChipReadXYValueReg_D);

	chipReadOnValueReg : entity work.SimpleRegister
		generic map(
			SIZE => ARRAY_PIXEL_GROUP_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => ChipReadOnValueRegEnable_S,
			Input_SI  => DVSOnPolarity_AI,
			Output_SO => ChipReadOnValueReg_D);

	chipReadOffValueReg : entity work.SimpleRegister
		generic map(
			SIZE => ARRAY_PIXEL_GROUP_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => ChipReadOffValueRegEnable_S,
			Input_SI  => DVSOffPolarity_AI,
			Output_SO => ChipReadOffValueReg_D);

	-- Change state on clock edge (synchronous).
	dvsRegisterUpdate : process(Clock_CI, Reset_RI)
	begin
		if Reset_RI then                -- asynchronous reset (active-high for FPGAs)
			ACfgState_DP  <= stIdle;
			ACtrlState_DP <= stIdle;
			AReadState_DP <= stIdle;

			ArrayConfigInProgress_SP  <= '0';
			ArrayReadoutInProgress_SP <= '0';

			RowReadoutInProgress_SP <= '0';

			DVSArrayConfigData_DO  <= '0';
			DVSArrayConfigClock_CO <= '0';
			DVSArraySample_SO      <= '0';
			DVSArrayRestart_SO     <= '0';
			DVSArraySenseY_SO      <= '0';
			AReadXYSelectReg_SP    <= '0';
			AReadXResetReg_SP      <= '1';
			DVSXClock_CO           <= '0';
			AReadYResetReg_SP      <= '1';
			DVSYClock_CO           <= '0';

			DVS132SConfigReg_D <= tDVSConfigDefault;
		elsif rising_edge(Clock_CI) then
			ACfgState_DP  <= ACfgState_DN;
			ACtrlState_DP <= ACtrlState_DN;
			AReadState_DP <= AReadState_DN;

			ArrayConfigInProgress_SP  <= ArrayConfigInProgress_SN;
			ArrayReadoutInProgress_SP <= ArrayReadoutInProgress_SN;

			RowReadoutInProgress_SP <= RowReadoutInProgress_SP xor (RowReadoutStart_SN or RowReadoutDone_SN);

			DVSArrayConfigData_DO  <= ACfgDataReg_D;
			DVSArrayConfigClock_CO <= ACfgClockReg_C;
			DVSArraySample_SO      <= ACtrlSampleReg_S;
			DVSArrayRestart_SO     <= ACtrlRestartReg_S;
			DVSArraySenseY_SO      <= ACtrlSenseYReg_S;
			AReadXYSelectReg_SP    <= AReadXYSelectReg_SN;
			AReadXResetReg_SP      <= AReadXResetReg_SN;
			DVSXClock_CO           <= AReadXClockReg_C;
			AReadYResetReg_SP      <= AReadYResetReg_SN;
			DVSYClock_CO           <= AReadYClockReg_C;

			DVS132SConfigReg_D <= DVS132SConfig_DI;
		end if;
	end process dvsRegisterUpdate;

	DVSXYSelect_SO <= AReadXYSelectReg_SP;
	DVSXReset_SBO  <= not AReadXResetReg_SP;
	DVSYReset_SBO  <= not AReadYResetReg_SP;

	dvsRawTypeRegister : entity work.SimpleRegister
		generic map(
			SIZE => 2)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => '1',
			Input_SI  => DVSRawTypeIn_D,
			Output_SO => DVSRawTypeOut_D);

	dvsRawDataRegister : entity work.SimpleRegister
		generic map(
			SIZE => DVS_BUS_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => '1',
			Input_SI  => DVSRawDataIn_D,
			Output_SO => DVSRawDataOut_D);

	-- Copy all raw data to an intermediate register, to hold it, to save the additional
	-- data like validity and type and polarities, and to provide one clock cycle delay
	-- to compensate for the lookup in the DVS decoder memory.
	process(DVSRawTypeOut_D, DVSRawDataOut_D)
	begin
		DVSDecoderTypeIn_D <= DVSRawTypeOut_D;
		DVSDecoderDataIn_D <= (others => '0');

		DVSDecoderROMInput_D <= DVSRawDataOut_D;

		case DVSRawTypeOut_D is
			when DVS_TYPE_POLARITY =>
				-- Polarity comes in groups of four. Shuffle them to conform to ordering as
				-- needed for the host to calculate addresses in a straightforward manner
				-- based on top-left corner being the origin.
				if CHIP_DVS_ORIGIN_POINT = "11" then
					DVSDecoderDataIn_D(ARRAY_PIXEL_GROUP_SIZE - 1 downto 0)                   <= DVSRawDataOut_D(1) & DVSRawDataOut_D(3) & DVSRawDataOut_D(0) & DVSRawDataOut_D(2);
					DVSDecoderDataIn_D(DVS_POLARITIES_SIZE - 1 downto ARRAY_PIXEL_GROUP_SIZE) <= DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 1) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 3) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 0) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 2);
				elsif CHIP_DVS_ORIGIN_POINT = "01" then
					DVSDecoderDataIn_D(ARRAY_PIXEL_GROUP_SIZE - 1 downto 0)                   <= DVSRawDataOut_D(3) & DVSRawDataOut_D(1) & DVSRawDataOut_D(2) & DVSRawDataOut_D(0);
					DVSDecoderDataIn_D(DVS_POLARITIES_SIZE - 1 downto ARRAY_PIXEL_GROUP_SIZE) <= DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 3) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 1) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 2) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 0);
				elsif CHIP_DVS_ORIGIN_POINT = "10" then
					DVSDecoderDataIn_D(ARRAY_PIXEL_GROUP_SIZE - 1 downto 0)                   <= DVSRawDataOut_D(0) & DVSRawDataOut_D(2) & DVSRawDataOut_D(1) & DVSRawDataOut_D(3);
					DVSDecoderDataIn_D(DVS_POLARITIES_SIZE - 1 downto ARRAY_PIXEL_GROUP_SIZE) <= DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 0) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 2) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 1) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 3);
				else
					-- CHIP_DVS_ORIGIN_POINT = "00"
					DVSDecoderDataIn_D(ARRAY_PIXEL_GROUP_SIZE - 1 downto 0)                   <= DVSRawDataOut_D(2) & DVSRawDataOut_D(0) & DVSRawDataOut_D(3) & DVSRawDataOut_D(1);
					DVSDecoderDataIn_D(DVS_POLARITIES_SIZE - 1 downto ARRAY_PIXEL_GROUP_SIZE) <= DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 2) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 0) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 3) & DVSRawDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 1);
				end if;

			-- X/Y addresses are just sent to the ROM decoder.
			when others => null;
		end case;
	end process;

	dvsDecoderROM : dvs132sDecoder
		port map(
			Address    => DVSDecoderROMInput_D,
			OutClock   => Clock_CI,
			OutClockEn => '1',
			Reset      => Reset_RI,
			Q          => DVSDecoderROMOutput_D);

	dvsDecoderTypeRegister : entity work.SimpleRegister
		generic map(
			SIZE => 2)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => '1',
			Input_SI  => DVSDecoderTypeIn_D,
			Output_SO => DVSDecoderTypeOut_D);

	dvsDecoderDataRegister : entity work.SimpleRegister
		generic map(
			SIZE => DVS_POLARITIES_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => '1',
			Input_SI  => DVSDecoderDataIn_D,
			Output_SO => DVSDecoderDataOut_D);

	process(DVSDecoderTypeOut_D, DVSDecoderDataOut_D, DVSDecoderROMOutput_D)
	begin
		DVSErrorDetectTypeIn_D <= DVSDecoderTypeOut_D;
		DVSErrorDetectDataIn_D <= (others => '0');

		StatisticsTransactionsErrored_SN <= '0';
		DebugErrorTooManyZeroes_SN       <= '0';
		DebugErrorTooManyOnes_SN         <= '0';
		DebugErrorInvalidAddress_SN      <= '0';
		DebugErrorPolaritiesZero_SN      <= '0';
		DebugErrorPolaritiesBoth_SN      <= '0';

		case DVSDecoderTypeOut_D is
			when DVS_TYPE_ADDRESS_Y | DVS_TYPE_ADDRESS_X =>
				-- Get new address from ROM decoder.
				DVSErrorDetectDataIn_D <= DVSDecoderROMOutput_D(DVS_ADDR_SIZE - 1 downto 0);

				-- Find errors in addresses, all invalid addresses have error bit set.
				if DVSDecoderROMOutput_D(DVS_ADDR_SIZE) then
					DVSErrorDetectTypeIn_D <= DVS_TYPE_NOTHING;

					StatisticsTransactionsErrored_SN <= '1';

					if ENABLE_DEBUG then
						if unsigned(DVSDecoderROMOutput_D(DVS_ADDR_SIZE - 1 downto 0)) = 0 then
							DebugErrorTooManyZeroes_SN <= '1';
						end if;

						if unsigned(DVSDecoderROMOutput_D(DVS_ADDR_SIZE - 1 downto 0)) = 1 then
							DebugErrorTooManyOnes_SN <= '1';
						end if;

						if unsigned(DVSDecoderROMOutput_D(DVS_ADDR_SIZE - 1 downto 0)) = 2 then
							DebugErrorInvalidAddress_SN <= '1';
						end if;
					end if;
				end if;

			when DVS_TYPE_POLARITY =>
				-- Find errors in polarities: either all zeros (no polarities at all), or
				-- both polarities for the same pixel.
				DVSErrorDetectDataIn_D(DVS_POLARITIES_SIZE - 1 downto 0) <= DVSDecoderDataOut_D;

				if (unsigned(DVSDecoderDataOut_D) = 0) then
					-- Error: all polarities are zero.
					DVSErrorDetectTypeIn_D <= DVS_TYPE_NOTHING;

					StatisticsTransactionsErrored_SN <= '1';

					if ENABLE_DEBUG then
						DebugErrorPolaritiesZero_SN <= '1';
					end if;
				end if;

				if (DVSDecoderDataOut_D(0) and DVSDecoderDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 0))
				or (DVSDecoderDataOut_D(1) and DVSDecoderDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 1))
				or (DVSDecoderDataOut_D(2) and DVSDecoderDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 2))
				or (DVSDecoderDataOut_D(3) and DVSDecoderDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 3)) then
					-- Error: both polarities active for a pixel.
					DVSErrorDetectTypeIn_D <= DVS_TYPE_NOTHING;

					StatisticsTransactionsErrored_SN <= '1';

					if ENABLE_DEBUG then
						DebugErrorPolaritiesBoth_SN <= '1';
					end if;
				end if;

			when others => null;
		end case;
	end process;

	dvsErrorDetectTypeRegister : entity work.SimpleRegister
		generic map(
			SIZE => 2)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => '1',
			Input_SI  => DVSErrorDetectTypeIn_D,
			Output_SO => DVSErrorDetectTypeOut_D);

	dvsErrorDetectDataRegister : entity work.SimpleRegister
		generic map(
			SIZE => DVS_DATA_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => '1',
			Input_SI  => DVSErrorDetectDataIn_D,
			Output_SO => DVSErrorDetectDataOut_D);

	process(DVSErrorDetectTypeOut_D, DVSErrorDetectDataOut_D)
	begin
		DVSPresAddrTypeIn_D <= DVSErrorDetectTypeOut_D;
		DVSPresAddrDataIn_D <= (others => '0');

		case DVSErrorDetectTypeOut_D is
			when DVS_TYPE_ADDRESS_Y =>
				-- Invert Y address if needed due to chip orientation (host expects
				-- addresses related to top-left corner).
				if CHIP_DVS_ORIGIN_POINT(0) then
					DVSPresAddrDataIn_D <= std_logic_vector(resize(CHIP_DVS_SIZE_ROWS, DVS_DATA_SIZE) - 2 - unsigned(DVSErrorDetectDataOut_D));
				else
					DVSPresAddrDataIn_D <= DVSErrorDetectDataOut_D;
				end if;

			when DVS_TYPE_ADDRESS_X =>
				-- Invert X address if needed due to chip orientation (host expects
				-- addresses related to top-left corner).
				if CHIP_DVS_ORIGIN_POINT(1) then
					DVSPresAddrDataIn_D <= std_logic_vector(resize(CHIP_DVS_SIZE_COLUMNS, DVS_DATA_SIZE) - 2 - unsigned(DVSErrorDetectDataOut_D));
				else
					DVSPresAddrDataIn_D <= DVSErrorDetectDataOut_D;
				end if;

			when DVS_TYPE_POLARITY =>
				-- Change encoding to show presence and absolute polarity value.
				-- Resulting in four bits to indicate if an event exists, and another
				-- four to indicate ON/OFF polarity (1=ON, 0=OFF).
				DVSPresAddrDataIn_D(ARRAY_PIXEL_GROUP_SIZE + 0) <= DVSErrorDetectDataOut_D(0) or DVSErrorDetectDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 0);
				DVSPresAddrDataIn_D(ARRAY_PIXEL_GROUP_SIZE + 1) <= DVSErrorDetectDataOut_D(1) or DVSErrorDetectDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 1);
				DVSPresAddrDataIn_D(ARRAY_PIXEL_GROUP_SIZE + 2) <= DVSErrorDetectDataOut_D(2) or DVSErrorDetectDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 2);
				DVSPresAddrDataIn_D(ARRAY_PIXEL_GROUP_SIZE + 3) <= DVSErrorDetectDataOut_D(3) or DVSErrorDetectDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 3);
				DVSPresAddrDataIn_D(0)                          <= DVSErrorDetectDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 0);
				DVSPresAddrDataIn_D(1)                          <= DVSErrorDetectDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 1);
				DVSPresAddrDataIn_D(2)                          <= DVSErrorDetectDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 2);
				DVSPresAddrDataIn_D(3)                          <= DVSErrorDetectDataOut_D(ARRAY_PIXEL_GROUP_SIZE + 3);

			when others => null;
		end case;
	end process;

	dvsPresAddrTypeRegister : entity work.SimpleRegister
		generic map(
			SIZE => 2)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => '1',
			Input_SI  => DVSPresAddrTypeIn_D,
			Output_SO => DVSPresAddrTypeOut_D);

	dvsPresAddrDataRegister : entity work.SimpleRegister
		generic map(
			SIZE => DVS_DATA_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => '1',
			Input_SI  => DVSPresAddrDataIn_D,
			Output_SO => DVSPresAddrDataOut_D);

	ReadyForMoreData_S        <= not OutFifoControl_SI.AlmostFull_S;
	OutFifoData_DO            <= '0' & DVSPresAddrTypeOut_D & "0000" & DVSPresAddrDataOut_D;
	OutFifoControl_SO.Write_S <= BooleanToStdLogic(DVSPresAddrTypeOut_D /= DVS_TYPE_NOTHING);

	statisticsSupport : if ENABLE_STATISTICS generate
		signal StatisticsTransactionsSuccess_SP : std_logic;
		signal StatisticsTransactionsSkipped_SP : std_logic;
		signal StatisticsTransactionsErrored_SP : std_logic;
	begin
		StatisticsTransactionsSuccessReg : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => StatisticsTransactionsSuccess_SN,
				Output_SO(0) => StatisticsTransactionsSuccess_SP);

		StatisticsTransactionsSuccessCounter : entity work.Counter
			generic map(
				SIZE => TRANSACTION_COUNTER_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Clear_SI  => not DVS132SConfigReg_D.Run_S,
				Enable_SI => StatisticsTransactionsSuccess_SP,
				Data_DO   => DVS132SConfigInfoOut_DO.StatisticsTransactionsSuccess_D);

		StatisticsTransactionsSkippedReg : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => StatisticsTransactionsSkipped_SN,
				Output_SO(0) => StatisticsTransactionsSkipped_SP);

		StatisticsTransactionsSkippedCounter : entity work.Counter
			generic map(
				SIZE => TRANSACTION_COUNTER_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Clear_SI  => not DVS132SConfigReg_D.Run_S,
				Enable_SI => StatisticsTransactionsSkipped_SP,
				Data_DO   => DVS132SConfigInfoOut_DO.StatisticsTransactionsSkipped_D);

		StatisticsTransactionsErroredReg : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => StatisticsTransactionsErrored_SN,
				Output_SO(0) => StatisticsTransactionsErrored_SP);

		StatisticsTransactionsErroredCounter : entity work.Counter
			generic map(
				SIZE => DEBUG_COUNTER_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Clear_SI  => not DVS132SConfigReg_D.Run_S,
				Enable_SI => StatisticsTransactionsErrored_SP,
				Data_DO   => DVS132SConfigInfoOut_DO.StatisticsTransactionsErrored_D);

		debugSupport : if ENABLE_DEBUG generate
			signal DebugErrorTooManyZeroes_SP  : std_logic;
			signal DebugErrorTooManyOnes_SP    : std_logic;
			signal DebugErrorInvalidAddress_SP : std_logic;
			signal DebugErrorPolaritiesZero_SP : std_logic;
			signal DebugErrorPolaritiesBoth_SP : std_logic;
		begin
			DebugErrorTooManyZeroesReg : entity work.SimpleRegister
				generic map(
					SIZE => 1)
				port map(
					Clock_CI     => Clock_CI,
					Reset_RI     => Reset_RI,
					Enable_SI    => '1',
					Input_SI(0)  => DebugErrorTooManyZeroes_SN,
					Output_SO(0) => DebugErrorTooManyZeroes_SP);

			DebugErrorTooManyZeroesCounter : entity work.Counter
				generic map(
					SIZE => DEBUG_COUNTER_WIDTH)
				port map(
					Clock_CI  => Clock_CI,
					Reset_RI  => Reset_RI,
					Clear_SI  => not DVS132SConfigReg_D.Run_S,
					Enable_SI => DebugErrorTooManyZeroes_SP,
					Data_DO   => DVS132SConfigInfoOut_DO.DebugErrorTooManyZeroes_D);

			DebugErrorTooManyOnesReg : entity work.SimpleRegister
				generic map(
					SIZE => 1)
				port map(
					Clock_CI     => Clock_CI,
					Reset_RI     => Reset_RI,
					Enable_SI    => '1',
					Input_SI(0)  => DebugErrorTooManyOnes_SN,
					Output_SO(0) => DebugErrorTooManyOnes_SP);

			DebugErrorTooManyOnesCounter : entity work.Counter
				generic map(
					SIZE => DEBUG_COUNTER_WIDTH)
				port map(
					Clock_CI  => Clock_CI,
					Reset_RI  => Reset_RI,
					Clear_SI  => not DVS132SConfigReg_D.Run_S,
					Enable_SI => DebugErrorTooManyOnes_SP,
					Data_DO   => DVS132SConfigInfoOut_DO.DebugErrorTooManyOnes_D);

			DebugErrorInvalidAddressReg : entity work.SimpleRegister
				generic map(
					SIZE => 1)
				port map(
					Clock_CI     => Clock_CI,
					Reset_RI     => Reset_RI,
					Enable_SI    => '1',
					Input_SI(0)  => DebugErrorInvalidAddress_SN,
					Output_SO(0) => DebugErrorInvalidAddress_SP);

			DebugErrorInvalidAddressCounter : entity work.Counter
				generic map(
					SIZE => DEBUG_COUNTER_WIDTH)
				port map(
					Clock_CI  => Clock_CI,
					Reset_RI  => Reset_RI,
					Clear_SI  => not DVS132SConfigReg_D.Run_S,
					Enable_SI => DebugErrorInvalidAddress_SP,
					Data_DO   => DVS132SConfigInfoOut_DO.DebugErrorInvalidAddress_D);

			DebugErrorPolaritiesZeroReg : entity work.SimpleRegister
				generic map(
					SIZE => 1)
				port map(
					Clock_CI     => Clock_CI,
					Reset_RI     => Reset_RI,
					Enable_SI    => '1',
					Input_SI(0)  => DebugErrorPolaritiesZero_SN,
					Output_SO(0) => DebugErrorPolaritiesZero_SP);

			DebugErrorPolaritiesZeroCounter : entity work.Counter
				generic map(
					SIZE => DEBUG_COUNTER_WIDTH)
				port map(
					Clock_CI  => Clock_CI,
					Reset_RI  => Reset_RI,
					Clear_SI  => not DVS132SConfigReg_D.Run_S,
					Enable_SI => DebugErrorPolaritiesZero_SP,
					Data_DO   => DVS132SConfigInfoOut_DO.DebugErrorPolaritiesZero_D);

			DebugErrorPolaritiesBothReg : entity work.SimpleRegister
				generic map(
					SIZE => 1)
				port map(
					Clock_CI     => Clock_CI,
					Reset_RI     => Reset_RI,
					Enable_SI    => '1',
					Input_SI(0)  => DebugErrorPolaritiesBoth_SN,
					Output_SO(0) => DebugErrorPolaritiesBoth_SP);

			DebugErrorPolaritiesBothCounter : entity work.Counter
				generic map(
					SIZE => DEBUG_COUNTER_WIDTH)
				port map(
					Clock_CI  => Clock_CI,
					Reset_RI  => Reset_RI,
					Clear_SI  => not DVS132SConfigReg_D.Run_S,
					Enable_SI => DebugErrorPolaritiesBoth_SP,
					Data_DO   => DVS132SConfigInfoOut_DO.DebugErrorPolaritiesBoth_D);
		end generate debugSupport;

		noDebugStatistics : if not ENABLE_DEBUG generate
		begin
			DVS132SConfigInfoOut_DO.DebugErrorTooManyZeroes_D  <= (others => '0');
			DVS132SConfigInfoOut_DO.DebugErrorTooManyOnes_D    <= (others => '0');
			DVS132SConfigInfoOut_DO.DebugErrorInvalidAddress_D <= (others => '0');
			DVS132SConfigInfoOut_DO.DebugErrorPolaritiesZero_D <= (others => '0');
			DVS132SConfigInfoOut_DO.DebugErrorPolaritiesBoth_D <= (others => '0');
		end generate noDebugStatistics;
	end generate statisticsSupport;

	noStatistics : if not ENABLE_STATISTICS generate
		DVS132SConfigInfoOut_DO <= tDVSConfigInfoOutDefault;
	end generate noStatistics;
end Behavioral;
