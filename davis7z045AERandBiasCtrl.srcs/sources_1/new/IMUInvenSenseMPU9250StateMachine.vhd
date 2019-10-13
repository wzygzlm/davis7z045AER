library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Functions.SizeCountNTimes;
use work.Functions.SizeCountUpToN;
use work.EventCodes.all;
use work.Settings.LOGIC_CLOCK_FREQ;
use work.FIFORecords.all;
use work.ShiftRegisterModes.all;
use work.IMUInvenSenseMPU9250ConfigRecords.all;

entity IMUInvenSenseMPU9250StateMachine is
	port(
		Clock_CI              : in  std_logic;
		Reset_RI              : in  std_logic;

		-- Fifo output (to Multiplexer)
		OutFifoControl_SI     : in  tFromFifoWriteSide;
		OutFifoControl_SO     : out tToFifoWriteSide;
		OutFifoData_DO        : out std_logic_vector(EVENT_WIDTH - 1 downto 0);

		IMUSPISlaveSelect_SBO : out std_logic;
		IMUSPIClock_CO        : out std_logic;
		IMUSPIMOSI_DO         : out std_logic;
		IMUSPIMISO_SI         : in  std_logic;
		IMUInterrupt_SI       : in  std_logic;

		-- Configuration input
		IMUConfig_DI          : in  tIMUConfig);
end entity IMUInvenSenseMPU9250StateMachine;

architecture Behavioral of IMUInvenSenseMPU9250StateMachine is
	attribute syn_enum_encoding : string;

	type tState is (stIdle, stAckAndLoadSampleRateDivider, stAckAndLoadAccelFullScale, stAckAndLoadGyroFullScale, stWriteConfigRegister, stPrepareReadDataRegister, stReadDataRegister, stWriteEventStart, stWriteEventA0, stWriteEventA1, stWriteEventA2, stWriteEventA3, stWriteEventA4, stWriteEventA5, stWriteEventT0, stWriteEventT1, stWriteEventG0, stWriteEventG1, stWriteEventG2, stWriteEventG3, stWriteEventG4, stWriteEventG5, stWriteEventEnd, stDoneAcknowledge, stWriteEventInfo, stAckAndLoadPowerManagement1, stAckAndLoadAccelDLPF, stAckAndLoadGyroDLPF, stStartup0, stStartup1, stStartup2, stStartup3, stManageStartup, stAckAndLoadPowerManagement2);
	attribute syn_enum_encoding of tState : type is "onehot";

	-- present and next state
	signal State_DP, State_DN : tState;

	type tSPIState is (stSPIIdle, stSPICSSetup, stSPIWriteRegisterAddress, stSPIWriteRegisterData, stSPIReadIMUData, stSPIAlignIMUDataPrepare, stSPIAlignIMUData, stSPICSHold);
	attribute syn_enum_encoding of tSPIState : type is "onehot";

	-- present and next state
	signal SPIState_DP, SPIState_DN : tSPIState;

	-- SPI frequency is 600 KHz.
	constant SPI_CYCLES              : integer := integer((LOGIC_CLOCK_FREQ * 10.0) / 6.0);
	constant SPI_CYCLES_COUNTER_SIZE : integer := SizeCountNTimes(SPI_CYCLES);
	constant SPI_WRITE_SIZE          : integer := 1; -- write 1 byte data
	constant SPI_READ_SIZE           : integer := 14; -- read 14 bytes of data
	constant SPI_MAX_SIZE            : integer := maximum(SPI_WRITE_SIZE, SPI_READ_SIZE) + 1; -- +1: write 1 byte address always
	constant SPI_BIT_COUNTER_SIZE    : integer := SizeCountNTimes(SPI_MAX_SIZE * 8);

	constant SPI_READ  : std_logic := '1';
	constant SPI_WRITE : std_logic := '0';

	signal SPIStartTransaction_SP, SPIStartTransaction_SN : std_logic;
	signal SPIReadTransaction_SP, SPIReadTransaction_SN   : std_logic;
	signal SPIReadSize_DP, SPIReadSize_DN                 : unsigned(3 downto 0);
	signal SPIReadShift_DP, SPIReadShift_DN               : unsigned(3 downto 0);
	signal SPIDone_SP, SPIDone_SN                         : std_logic;

	signal SPISRMode_S      : std_logic_vector(SHIFTREGISTER_MODE_SIZE - 1 downto 0);
	signal SPISRModeExt_S   : std_logic_vector(SHIFTREGISTER_MODE_SIZE - 1 downto 0);
	signal SPISRInput_D     : std_logic;
	signal SPISRParInput_D  : std_logic_vector((SPI_MAX_SIZE * 8) - 1 downto 0);
	signal SPISRParOutput_D : std_logic_vector((SPI_MAX_SIZE * 8) - 1 downto 0);

	signal SPIBitCounterClear_S, SPIBitCounterEnable_S : std_logic;
	signal SPIBitCounterData_D                         : unsigned(SPI_BIT_COUNTER_SIZE - 1 downto 0);

	signal IMUSPISlaveSelect_SPB, IMUSPISlaveSelect_SNB : std_logic;
	signal IMUSPIClock_CP, IMUSPIClock_CN               : std_logic;
	signal IMUSPIMOSI_DP, IMUSPIMOSI_DN                 : std_logic;

	-- Counter to introduce delays between operations, and generate the clock.
	signal SPICyclesCounterClear_S, SPICyclesCounterEnable_S : std_logic;
	signal SPICyclesCounterData_D                            : unsigned(SPI_CYCLES_COUNTER_SIZE - 1 downto 0);

	-- Register scale information for sending after read done.
	signal ScaleRegEnable_S         : std_logic;
	signal ScaleReg_DP, ScaleReg_DN : std_logic_vector(3 downto 0);

	-- Register outputs to FIFO.
	signal OutFifoWriteReg_S : std_logic;
	signal OutFifoDataReg_D  : std_logic_vector(EVENT_WIDTH - 1 downto 0);

	-- Register configuration inputs.
	signal IMUConfigReg_D : tIMUConfig;

	-- Track system startup.
	signal StartupPhase_DP, StartupPhase_DN : unsigned(2 downto 0);

	signal RunChip_S                         : std_logic;
	signal RunAccelChanged_S, RunAccelSent_S : std_logic;
	signal RunGyroChanged_S, RunGyroSent_S   : std_logic;
	signal RunTempChanged_S, RunTempSent_S   : std_logic;

	signal SampleRateDividerChanged_S, SampleRateDividerSent_S : std_logic;
	signal AccelDLPFChanged_S, AccelDLPFSent_S                 : std_logic;
	signal GyroDLPFChanged_S, GyroDLPFSent_S                   : std_logic;
	signal AccelFullScaleChanged_S, AccelFullScaleSent_S       : std_logic;
	signal GyroFullScaleChanged_S, GyroFullScaleSent_S         : std_logic;

	-- IMU Run Status: bit 0 accelerometer, bit 1 gyroscope, bit 2 temperature.
	constant IMU_RUN_STATUS_NONE      : std_logic_vector(3 downto 0) := "0000";
	constant IMU_RUN_STATUS_CHIP      : integer                      := 3;
	constant IMU_RUN_STATUS_ACCEL     : integer                      := 2;
	constant IMU_RUN_STATUS_GYRO      : integer                      := 1;
	constant IMU_RUN_STATUS_TEMP      : integer                      := 0;
	signal RunStatus_SP, RunStatus_SN : std_logic_vector(3 downto 0);
begin
	-- SPI SM internal connections:
	-- IN: SPIStartTransaction_SP
	-- IN: SPIReadTransaction_SP
	-- IN: SPISRModeExt_S
	-- IN: SPISRParInput_D
	-- OUT: SPIDone_SP
	-- OUT: SPISRParOutput_D

	-- Input to the SPI shift registers comes always from outside.
	-- The read SR from the SPI bus directly, the write SR from the IMU StateMachine.
	SPISRInput_D <= IMUSPIMISO_SI;

	IMUSPISlaveSelect_SBO <= IMUSPISlaveSelect_SPB;
	IMUSPIClock_CO        <= IMUSPIClock_CP;
	IMUSPIMOSI_DO         <= IMUSPIMOSI_DP;

	spiRegisterUpdate : process(Clock_CI, Reset_RI) is
	begin
		if Reset_RI then
			SPIState_DP <= stSPIIdle;

			SPIStartTransaction_SP <= '0';
			SPIReadTransaction_SP  <= '0';
			SPIReadSize_DP         <= (others => '0');
			SPIReadShift_DP        <= (others => '0');
			SPIDone_SP             <= '0';

			IMUSPISlaveSelect_SPB <= '1';
			IMUSPIClock_CP        <= '1';
			IMUSPIMOSI_DP         <= '0';
		elsif rising_edge(Clock_CI) then
			SPIState_DP <= SPIState_DN;

			SPIStartTransaction_SP <= SPIStartTransaction_SN;
			SPIReadTransaction_SP  <= SPIReadTransaction_SN;
			SPIReadSize_DP         <= SPIReadSize_DN;
			SPIReadShift_DP        <= SPIReadShift_DN;
			SPIDone_SP             <= SPIDone_SN;

			IMUSPISlaveSelect_SPB <= IMUSPISlaveSelect_SNB;
			IMUSPIClock_CP        <= IMUSPIClock_CN;
			IMUSPIMOSI_DP         <= IMUSPIMOSI_DN;
		end if;
	end process spiRegisterUpdate;

	spiShiftRegister : entity work.ShiftRegister
		generic map(
			SIZE => (SPI_MAX_SIZE * 8))
		port map(
			Clock_CI         => Clock_CI,
			Reset_RI         => Reset_RI,
			Mode_SI          => SPISRMode_S or SPISRModeExt_S,
			DataIn_DI        => SPISRInput_D,
			ParallelWrite_DI => SPISRParInput_D,
			ParallelRead_DO  => SPISRParOutput_D);

	spiBitCounter : entity work.Counter
		generic map(
			SIZE => SPI_BIT_COUNTER_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Clear_SI  => SPIBitCounterClear_S,
			Enable_SI => SPIBitCounterEnable_S,
			Data_DO   => SPIBitCounterData_D);

	spiCyclesCounter : entity work.Counter
		generic map(
			SIZE => SPI_CYCLES_COUNTER_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Clear_SI  => SPICyclesCounterClear_S,
			Enable_SI => SPICyclesCounterEnable_S,
			Data_DO   => SPICyclesCounterData_D);

	spiData : process(SPIState_DP, SPIStartTransaction_SP, SPIReadTransaction_SP, SPIBitCounterData_D, SPICyclesCounterData_D, SPISRParOutput_D, SPIReadSize_DP, SPIReadShift_DP)
	begin
		SPIState_DN <= SPIState_DP;

		SPIDone_SN <= '0';

		SPISRMode_S <= SHIFTREGISTER_MODE_DO_NOTHING;

		SPIBitCounterClear_S  <= '0';
		SPIBitCounterEnable_S <= '0';

		SPICyclesCounterClear_S  <= '0';
		SPICyclesCounterEnable_S <= '0';

		IMUSPISlaveSelect_SNB <= '1';
		IMUSPIClock_CN        <= '1';
		IMUSPIMOSI_DN         <= '0';

		case SPIState_DP is
			when stSPIIdle =>
				if SPIStartTransaction_SP then
					SPIState_DN <= stSPICSSetup;
				end if;

				-- Ensure all counters are reset.
				SPIBitCounterClear_S    <= '1';
				SPICyclesCounterClear_S <= '1';

			when stSPICSSetup =>
				-- Select IMU a few cycles early, to meet CS setup time.
				IMUSPISlaveSelect_SNB <= '0';

				SPICyclesCounterEnable_S <= '1';

				if SPICyclesCounterData_D = (SPI_CYCLES / 4) then
					SPICyclesCounterEnable_S <= '0';
					SPICyclesCounterClear_S  <= '1';

					SPIState_DN <= stSPIWriteRegisterAddress;
				end if;

			when stSPIWriteRegisterAddress =>
				-- Select IMU.
				IMUSPISlaveSelect_SNB <= '0';

				-- Output data (write).
				IMUSPIMOSI_DN <= SPISRParOutput_D((SPI_MAX_SIZE * 8) - 1);

				-- Wait for one full clock cycle, then switch to the next bit.
				SPICyclesCounterEnable_S <= '1';

				if SPICyclesCounterData_D = (SPI_CYCLES - 1) then
					SPICyclesCounterEnable_S <= '0';
					SPICyclesCounterClear_S  <= '1';

					-- Move to next bit.
					SPISRMode_S <= SHIFTREGISTER_MODE_SHIFT_LEFT;

					-- Count up one, this bit is done!
					SPIBitCounterEnable_S <= '1';

					if SPIBitCounterData_D = 7 then
						-- Move to next state, the address is fully shifted out now.
						if SPIReadTransaction_SP then
							SPIState_DN <= stSPIReadIMUData;
						else
							SPIState_DN <= stSPIWriteRegisterData;
						end if;
					end if;
				end if;

				-- Clock data. Default clock is HIGH, so we pull it LOW.
				if SPICyclesCounterData_D < (SPI_CYCLES / 2) then
					IMUSPIClock_CN <= '0';
				end if;

			when stSPIWriteRegisterData =>
				-- Select IMU.
				IMUSPISlaveSelect_SNB <= '0';

				-- Output data (write).
				IMUSPIMOSI_DN <= SPISRParOutput_D((SPI_MAX_SIZE * 8) - 1);

				-- Wait for one full clock cycle, then switch to the next bit.
				SPICyclesCounterEnable_S <= '1';

				if SPICyclesCounterData_D = (SPI_CYCLES - 1) then
					SPICyclesCounterEnable_S <= '0';
					SPICyclesCounterClear_S  <= '1';

					-- Move to next bit.
					SPISRMode_S <= SHIFTREGISTER_MODE_SHIFT_LEFT;

					-- Count up one, this bit is done!
					SPIBitCounterEnable_S <= '1';

					if SPIBitCounterData_D = ((SPI_WRITE_SIZE * 8) + 7) then
						-- Move to end state, the data is fully shifted out now.
						SPIState_DN <= stSPICSHold;
					end if;
				end if;

				-- Clock data. Default clock is HIGH, so we pull it LOW.
				if SPICyclesCounterData_D < (SPI_CYCLES / 2) then
					IMUSPIClock_CN <= '0';
				end if;

			when stSPIReadIMUData =>
				-- Select IMU.
				IMUSPISlaveSelect_SNB <= '0';

				-- Wait for one full clock cycle, then switch to the next bit.
				SPICyclesCounterEnable_S <= '1';

				if SPICyclesCounterData_D = (SPI_CYCLES - 1) then
					SPICyclesCounterEnable_S <= '0';
					SPICyclesCounterClear_S  <= '1';

					-- Count up one, this bit is done!
					SPIBitCounterEnable_S <= '1';

					if SPIBitCounterData_D = ((SPIReadSize_DP & "000") + 7) then
						-- Move to end state, the data is fully shifted out now.
						SPIState_DN <= stSPIAlignIMUDataPrepare;
					end if;
				end if;

				-- Capture data from IMU on rising clock edge.
				if SPICyclesCounterData_D = (SPI_CYCLES / 2) then
					SPISRMode_S <= SHIFTREGISTER_MODE_SHIFT_LEFT;
				end if;

				-- Clock data. Default clock is HIGH, so we pull it LOW.
				if SPICyclesCounterData_D < (SPI_CYCLES / 2) then
					IMUSPIClock_CN <= '0';
				end if;

			when stSPIAlignIMUDataPrepare =>
				-- Select IMU.
				IMUSPISlaveSelect_SNB <= '0';

				SPIBitCounterClear_S <= '1';

				if SPIReadShift_DP = 0 then
					-- No alignment shift to be done.
					SPIState_DN <= stSPICSHold;
				else
					SPIState_DN <= stSPIAlignIMUData;
				end if;

			when stSPIAlignIMUData =>
				-- Select IMU.
				IMUSPISlaveSelect_SNB <= '0';

				-- Shift IMU data left to compensate for shorter reads when not all
				-- sensors are enabled. By doing this, the position of data after a
				-- read is always the same for all sensors, simplifying further
				-- processing and sending out of it.
				SPISRMode_S <= SHIFTREGISTER_MODE_SHIFT_LEFT;

				SPIBitCounterEnable_S <= '1';

				if SPIBitCounterData_D = ((SPIReadShift_DP & "000") - 1) then
					SPIState_DN <= stSPICSHold;
				end if;

			when stSPICSHold =>
				-- Notify completion to main state machine.
				SPIDone_SN <= '1';

				-- Done with transaction. SlaveSelect hold time is 500ns, so half a clock cycle.
				-- We just keep in this state for a little longer than that to avoid races.
				if SPICyclesCounterData_D < ((SPI_CYCLES / 4) * 3) then
					-- Select IMU.
					IMUSPISlaveSelect_SNB <= '0';
				end if;

				SPICyclesCounterEnable_S <= '1';

				if SPICyclesCounterData_D = (SPI_CYCLES - 1) then
					-- No enable/clear, stIdle will clear.
					SPIState_DN <= stSPIIdle;
				end if;

			when others => null;
		end case;
	end process spiData;

	imuLogic : process(State_DP, OutFifoControl_SI, IMUConfigReg_D, IMUInterrupt_SI, SPIDone_SP, SPISRParOutput_D, AccelFullScaleChanged_S, GyroFullScaleChanged_S, SampleRateDividerChanged_S, ScaleReg_DP, AccelDLPFChanged_S, GyroDLPFChanged_S, StartupPhase_DP, SPIReadSize_DP, RunAccelChanged_S, RunChip_S, RunGyroChanged_S, RunStatus_SP, RunTempChanged_S, SPIReadShift_DP)
	begin
		State_DN <= State_DP;           -- Keep current state by default.

		StartupPhase_DN <= StartupPhase_DP;

		RunStatus_SN <= RunStatus_SP;

		OutFifoWriteReg_S <= '0';
		OutFifoDataReg_D  <= (others => '0');

		SPIStartTransaction_SN <= '0';
		SPIReadTransaction_SN  <= '0';
		SPIReadSize_DN         <= SPIReadSize_DP;
		SPIReadShift_DN        <= SPIReadShift_DP;

		SPISRParInput_D <= (others => '0');
		SPISRModeExt_S  <= SHIFTREGISTER_MODE_DO_NOTHING;

		ScaleRegEnable_S <= '0';
		ScaleReg_DN      <= ScaleReg_DP;

		RunAccelSent_S <= '0';
		RunGyroSent_S  <= '0';
		RunTempSent_S  <= '0';

		SampleRateDividerSent_S <= '0';
		AccelDLPFSent_S         <= '0';
		GyroDLPFSent_S          <= '0';
		AccelFullScaleSent_S    <= '0';
		GyroFullScaleSent_S     <= '0';

		case State_DP is
			when stStartup0 =>
				-- Disable I2C, SPI only mode.
				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.UserConfig);
				SPISRParInput_D(108)            <= '1'; -- SPI-only mode (I2C disabled).

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(0, StartupPhase_DN'length);

			when stStartup1 =>
				-- Put IMU to sleep, select stable PLL.
				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.PowerManagement1);
				SPISRParInput_D(110)            <= '1'; -- Sleep.
				SPISRParInput_D(107)            <= '1'; -- Power down PTAT (temperature sensor).
				SPISRParInput_D(106 downto 104) <= "001"; -- Enable clock (PLL with X axis gyro reference).

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(1, StartupPhase_DN'length);

			when stStartup2 =>
				-- Load interrupt config.
				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.InterruptConfig);
				SPISRParInput_D(109)            <= '1'; -- Latch interrupt until cleared.
				SPISRParInput_D(108)            <= '1'; -- Clear interrupt on any read operation.

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(2, StartupPhase_DN'length);

			when stStartup3 =>
				-- Load interrupt enable config.
				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.InterruptEnable);
				SPISRParInput_D(104)            <= '1'; -- Interrupt on raw data ready for read.

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(3, StartupPhase_DN'length);

			when stIdle =>
				-- When the Run signals change, we need to configure the IMU appropriately.
				-- Else, if anything is in fact turned on, we wait on the interrupt to signal
				-- us to get new data, or we send off configuration changes. Else we idle.
				if (RunChip_S and not RunStatus_SP(IMU_RUN_STATUS_CHIP)) or (not RunChip_S and RunStatus_SP(IMU_RUN_STATUS_CHIP)) then
					-- First priority, start or stop the IMU chip as appropriate.
					State_DN <= stAckAndLoadPowerManagement1;
				elsif RunTempChanged_S then
					State_DN <= stAckAndLoadPowerManagement1;
				elsif RunAccelChanged_S or RunGyroChanged_S then
					State_DN <= stAckAndLoadPowerManagement2;
				elsif RunStatus_SP /= IMU_RUN_STATUS_NONE then
					if IMUInterrupt_SI and not OutFifoControl_SI.AlmostFull_S then
						State_DN <= stPrepareReadDataRegister;
					end if;

					if SampleRateDividerChanged_S then
						State_DN <= stAckAndLoadSampleRateDivider;
					end if;
					if AccelDLPFChanged_S then
						State_DN <= stAckAndLoadAccelDLPF;
					end if;
					if GyroDLPFChanged_S then
						State_DN <= stAckAndLoadGyroDLPF;
					end if;
					if AccelFullScaleChanged_S then
						State_DN <= stAckAndLoadAccelFullScale;
					end if;
					if GyroFullScaleChanged_S then
						State_DN <= stAckAndLoadGyroFullScale;
					end if;
				end if;

			when stAckAndLoadPowerManagement1 =>
				RunTempSent_S <= '1';

				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.PowerManagement1);
				SPISRParInput_D(110)            <= not RunChip_S; -- Sleep.
				SPISRParInput_D(107)            <= not IMUConfigReg_D.RunTemp_S; -- Power down PTAT (temperature sensor).
				SPISRParInput_D(106 downto 104) <= "001"; -- Enable clock (PLL with X axis gyro reference).

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				RunStatus_SN(IMU_RUN_STATUS_CHIP) <= RunChip_S;
				RunStatus_SN(IMU_RUN_STATUS_TEMP) <= IMUConfigReg_D.RunTemp_S;

				State_DN <= stWriteConfigRegister;

				-- Ensure interrupts are reconfigured every time.
				StartupPhase_DN <= to_unsigned(1, StartupPhase_DN'length);

			when stAckAndLoadPowerManagement2 =>
				RunAccelSent_S <= '1';
				RunGyroSent_S  <= '1';

				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.PowerManagement2);
				SPISRParInput_D(109)            <= not IMUConfigReg_D.RunAccel_S; -- Disable accelerometer axis X.
				SPISRParInput_D(108)            <= not IMUConfigReg_D.RunAccel_S; -- Disable accelerometer axis Y.
				SPISRParInput_D(107)            <= not IMUConfigReg_D.RunAccel_S; -- Disable accelerometer axis Z.
				SPISRParInput_D(106)            <= '0'; -- Enable gyroscope axis X always due to gyro PLL.
				SPISRParInput_D(105)            <= not IMUConfigReg_D.RunGyro_S; -- Disable gyroscope axis Y.
				SPISRParInput_D(104)            <= not IMUConfigReg_D.RunGyro_S; -- Disable gyroscope axis Z.

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				RunStatus_SN(IMU_RUN_STATUS_ACCEL) <= IMUConfigReg_D.RunAccel_S;
				RunStatus_SN(IMU_RUN_STATUS_GYRO)  <= IMUConfigReg_D.RunGyro_S;

				State_DN <= stWriteConfigRegister;

			when stAckAndLoadSampleRateDivider =>
				SampleRateDividerSent_S <= '1';

				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.SampleRateDivider);
				SPISRParInput_D(111 downto 104) <= std_logic_vector(IMUConfigReg_D.SampleRateDivider_D);

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

			when stAckAndLoadAccelDLPF =>
				AccelDLPFSent_S <= '1';

				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.AccelDLPFConfig);
				SPISRParInput_D(106 downto 104) <= std_logic_vector(IMUConfigReg_D.AccelDLPF_D);

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

			when stAckAndLoadGyroDLPF =>
				GyroDLPFSent_S <= '1';

				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.GyroDLPFConfig);
				SPISRParInput_D(106 downto 104) <= std_logic_vector(IMUConfigReg_D.GyroDLPF_D);

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

			when stAckAndLoadAccelFullScale =>
				AccelFullScaleSent_S <= '1';

				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.AccelConfig);
				SPISRParInput_D(108 downto 107) <= std_logic_vector(IMUConfigReg_D.AccelFullScale_D);

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				ScaleRegEnable_S        <= '1';
				ScaleReg_DN(3 downto 2) <= std_logic_vector(IMUConfigReg_D.AccelFullScale_D);

				State_DN <= stWriteConfigRegister;

			when stAckAndLoadGyroFullScale =>
				GyroFullScaleSent_S <= '1';

				SPISRParInput_D(119)            <= SPI_WRITE;
				SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.GyroConfig);
				SPISRParInput_D(108 downto 107) <= std_logic_vector(IMUConfigReg_D.GyroFullScale_D);

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				ScaleRegEnable_S        <= '1';
				ScaleReg_DN(1 downto 0) <= std_logic_vector(IMUConfigReg_D.GyroFullScale_D);

				State_DN <= stWriteConfigRegister;

			when stWriteConfigRegister =>
				-- Signal the SPI state machine to start the current write transaction.
				SPIStartTransaction_SN <= '1';

				-- Wait until SPI signals done.
				-- Ignore SPI errors, there's nothing we can do here.
				if SPIDone_SP then
					State_DN <= stDoneAcknowledge;
				end if;

			when stPrepareReadDataRegister =>
				SPISRParInput_D(119) <= SPI_READ;

				if RunStatus_SP(IMU_RUN_STATUS_ACCEL) then
					SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.AccelData);
				elsif RunStatus_SP(IMU_RUN_STATUS_TEMP) then
					SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.TempData);
				else
					SPISRParInput_D(118 downto 112) <= std_logic_vector(SPI_REGISTER_ADDRESSES.GyroData);
				end if;

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				case RunStatus_SP(2 downto 0) is
					when "001" =>
						SPIReadSize_DN  <= to_unsigned(2, 4);
						SPIReadShift_DN <= to_unsigned(6, 4);

					when "010" =>
						SPIReadSize_DN  <= to_unsigned(6, 4);
						SPIReadShift_DN <= to_unsigned(0, 4);

					when "011" =>
						SPIReadSize_DN  <= to_unsigned(8, 4);
						SPIReadShift_DN <= to_unsigned(0, 4);

					when "100" =>
						SPIReadSize_DN  <= to_unsigned(6, 4);
						SPIReadShift_DN <= to_unsigned(8, 4);

					when "101" =>
						SPIReadSize_DN  <= to_unsigned(8, 4);
						SPIReadShift_DN <= to_unsigned(6, 4);

					when "110" =>
						SPIReadSize_DN  <= to_unsigned(14, 4);
						SPIReadShift_DN <= to_unsigned(0, 4);

					when "111" =>
						SPIReadSize_DN  <= to_unsigned(14, 4);
						SPIReadShift_DN <= to_unsigned(0, 4);

					when others => null;
				end case;

				State_DN <= stReadDataRegister;

			when stReadDataRegister =>
				-- Signal the SPI state machine to start the current read transaction.
				SPIStartTransaction_SN <= '1';
				SPIReadTransaction_SN  <= '1';

				-- Wait until SPI signals done.
				if SPIDone_SP then
					State_DN <= stWriteEventStart;
				end if;

			when stWriteEventStart =>
				OutFifoDataReg_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_IMU_START6;
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventInfo;

			when stWriteEventInfo =>
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU_SCALE & RunStatus_SP(2 downto 0) & '0' & ScaleReg_DP;
				OutFifoWriteReg_S <= '1';

				if RunStatus_SP(IMU_RUN_STATUS_ACCEL) then
					State_DN <= stWriteEventA0;
				elsif RunStatus_SP(IMU_RUN_STATUS_TEMP) then
					State_DN <= stWriteEventT0;
				else
					State_DN <= stWriteEventG0;
				end if;

			when stWriteEventA0 =>
				-- Upper 8 bits of Accel X.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(111 downto 104);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA1;

			when stWriteEventA1 =>
				-- Lower 8 bits of Accel X.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(103 downto 96);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA2;

			when stWriteEventA2 =>
				-- Upper 8 bits of Accel Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(95 downto 88);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA3;

			when stWriteEventA3 =>
				-- Lower 8 bits of Accel Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(87 downto 80);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA4;

			when stWriteEventA4 =>
				-- Upper 8 bits of Accel Z.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(79 downto 72);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA5;

			when stWriteEventA5 =>
				-- Lower 8 bits of Accel Z.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(71 downto 64);
				OutFifoWriteReg_S <= '1';

				if RunStatus_SP(IMU_RUN_STATUS_TEMP) then
					State_DN <= stWriteEventT0;
				elsif RunStatus_SP(IMU_RUN_STATUS_GYRO) then
					State_DN <= stWriteEventG0;
				else
					State_DN <= stWriteEventEnd;
				end if;

			when stWriteEventT0 =>
				-- Upper 8 bits of Temperature.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(63 downto 56);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventT1;

			when stWriteEventT1 =>
				-- Lower 8 bits of Temperature.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(55 downto 48);
				OutFifoWriteReg_S <= '1';

				if RunStatus_SP(IMU_RUN_STATUS_GYRO) then
					State_DN <= stWriteEventG0;
				else
					State_DN <= stWriteEventEnd;
				end if;

			when stWriteEventG0 =>
				-- Upper 8 bits of Gyro X.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(47 downto 40);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG1;

			when stWriteEventG1 =>
				-- Lower 8 bits of Gyro X.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(39 downto 32);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG2;

			when stWriteEventG2 =>
				-- Upper 8 bits of Gyro Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(31 downto 24);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG3;

			when stWriteEventG3 =>
				-- Lower 8 bits of Gyro Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(23 downto 16);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG4;

			when stWriteEventG4 =>
				-- Upper 8 bits of Gyro Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(15 downto 8);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG5;

			when stWriteEventG5 =>
				-- Lower 8 bits of Gyro Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(7 downto 0);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventEnd;

			when stWriteEventEnd =>
				OutFifoDataReg_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_IMU_END;
				OutFifoWriteReg_S <= '1';
				State_DN          <= stDoneAcknowledge;

			when stDoneAcknowledge =>
				-- Deassert transaction, and wait for SPI Done to also go back low, which
				-- means SPI is ready for the next transaction to happen.
				if not SPIDone_SP then
					State_DN <= stManageStartup;
				end if;

			when stManageStartup =>
				case StartupPhase_DP is
					when to_unsigned(0, StartupPhase_DP'length) =>
						State_DN <= stStartup1;

					when to_unsigned(1, StartupPhase_DP'length) =>
						State_DN <= stStartup2;

					when to_unsigned(2, StartupPhase_DP'length) =>
						State_DN <= stStartup3;

					when to_unsigned(3, StartupPhase_DP'length) =>
						State_DN <= stIdle;

					when others => null;
				end case;

			when others => null;
		end case;
	end process imuLogic;

	-- Change state on clock edge (synchronous).
	imuRegisterUpdate : process(Clock_CI, Reset_RI)
	begin
		if Reset_RI then                -- asynchronous reset (active-high for FPGAs)
			State_DP <= stStartup0;

			OutFifoControl_SO.Write_S <= '0';
			OutFifoData_DO            <= (others => '0');

			StartupPhase_DP <= to_unsigned(0, StartupPhase_DP'length);

			RunStatus_SP <= IMU_RUN_STATUS_NONE;

			IMUConfigReg_D <= tIMUConfigDefault;
		elsif rising_edge(Clock_CI) then
			State_DP <= State_DN;

			OutFifoControl_SO.Write_S <= OutFifoWriteReg_S;
			OutFifoData_DO            <= OutFifoDataReg_D;

			StartupPhase_DP <= StartupPhase_DN;

			RunStatus_SP <= RunStatus_SN;

			IMUConfigReg_D <= IMUConfig_DI;
		end if;
	end process imuRegisterUpdate;

	-- Remember the values of the accelerometer and gyroscope full scale settings.
	-- This is updated when sending out new values for these properties, so we can
	-- always tell the host the exact settings with which a sample was produced.
	scaleRegister : entity work.SimpleRegister
		generic map(
			SIZE => 4)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => ScaleRegEnable_S,
			Input_SI  => ScaleReg_DN,
			Output_SO => ScaleReg_DP);

	-- Run management.
	RunChip_S <= IMUConfigReg_D.RunAccel_S or IMUConfigReg_D.RunGyro_S or IMUConfigReg_D.RunTemp_S;

	detectRunAccelChange : entity work.ChangeDetector
		generic map(
			SIZE => 1)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI(0)       => IMUConfigReg_D.RunAccel_S,
			ChangeDetected_SO     => RunAccelChanged_S,
			ChangeAcknowledged_SI => RunAccelSent_S);

	detectRunGyroChange : entity work.ChangeDetector
		generic map(
			SIZE => 1)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI(0)       => IMUConfigReg_D.RunGyro_S,
			ChangeDetected_SO     => RunGyroChanged_S,
			ChangeAcknowledged_SI => RunGyroSent_S);

	detectRunTempChange : entity work.ChangeDetector
		generic map(
			SIZE => 1)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI(0)       => IMUConfigReg_D.RunTemp_S,
			ChangeDetected_SO     => RunTempChanged_S,
			ChangeAcknowledged_SI => RunTempSent_S);

	detectSampleRateDividerChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.SampleRateDivider_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.SampleRateDivider_D),
			ChangeDetected_SO     => SampleRateDividerChanged_S,
			ChangeAcknowledged_SI => SampleRateDividerSent_S);

	detectAccelDLPFChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.AccelDLPF_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.AccelDLPF_D),
			ChangeDetected_SO     => AccelDLPFChanged_S,
			ChangeAcknowledged_SI => AccelDLPFSent_S);

	detectGyroDLPFChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.GyroDLPF_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.GyroDLPF_D),
			ChangeDetected_SO     => GyroDLPFChanged_S,
			ChangeAcknowledged_SI => GyroDLPFSent_S);

	detectAccelFullScaleChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.AccelFullScale_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.AccelFullScale_D),
			ChangeDetected_SO     => AccelFullScaleChanged_S,
			ChangeAcknowledged_SI => AccelFullScaleSent_S);

	detectGyroFullScaleChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.GyroFullScale_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.GyroFullScale_D),
			ChangeDetected_SO     => GyroFullScaleChanged_S,
			ChangeAcknowledged_SI => GyroFullScaleSent_S);
end architecture Behavioral;
