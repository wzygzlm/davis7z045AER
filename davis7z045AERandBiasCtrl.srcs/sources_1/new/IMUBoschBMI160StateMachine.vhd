library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Functions.SizeCountNTimes;
use work.Functions.SizeCountUpToN;
use work.EventCodes.all;
use work.Settings.LOGIC_CLOCK_FREQ;
use work.FIFORecords.all;
use work.ShiftRegisterModes.all;
use work.IMUBoschBMI160ConfigRecords.all;

entity IMUBoschBMI160StateMachine is
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
		IMUInterrupt1_SI      : in  std_logic;
		IMUInterrupt2_SI      : in  std_logic;

		-- Configuration input
		IMUConfig_DI          : in  tIMUConfig);
end entity IMUBoschBMI160StateMachine;

architecture Behavioral of IMUBoschBMI160StateMachine is
	attribute syn_enum_encoding : string;

	type tState is (stIdle, stWriteConfigRegister, stPrepareReadDataRegister, stReadDataRegister, stWriteEventStart, stWriteEventA0, stWriteEventA1, stWriteEventA2, stWriteEventA3, stWriteEventA4, stWriteEventA5, stWriteEventG0, stWriteEventG1, stWriteEventG2, stWriteEventG3, stWriteEventG4, stWriteEventG5, stWriteEventEnd, stDoneAcknowledge, stWriteEventInfo, stStartup0, stStartup1, stStartup2, stStartup3, stStartup4, stStartup5, stTransactionDelay, stAckAndPowerGyroTemp, stAckAndPowerAccel, stAckAndLoadAccelConf, stAckAndLoadAccelRange, stAckAndLoadGyroConf, stAckAndLoadGyroRange, stPrepareReadTemperature, stReadTemperature, stManageStartup, stWriteTemperatureEventStart, stWriteTemperatureEventInfo, stWriteTemperatureEventT0, stWriteTemperatureEventT1, stWriteTemperatureEventEnd);
	attribute syn_enum_encoding of tState : type is "onehot";

	-- present and next state
	signal State_DP, State_DN : tState;

	type tSPIState is (stSPIIdle, stSPICSSetup, stSPIWriteRegisterAddress, stSPIWriteRegisterData, stSPIReadIMUData, stSPIAlignIMUDataPrepare, stSPIAlignIMUData, stSPICSHold);
	attribute syn_enum_encoding of tSPIState : type is "onehot";

	-- present and next state
	signal SPIState_DP, SPIState_DN : tSPIState;

	-- SPI frequency is 5 MHz.
	constant SPI_CYCLES              : integer := integer(LOGIC_CLOCK_FREQ / 5.0);
	constant SPI_CYCLES_COUNTER_SIZE : integer := SizeCountNTimes(SPI_CYCLES);
	constant SPI_WRITE_SIZE          : integer := 1; -- write 1 byte data
	constant SPI_READ_SIZE           : integer := 12; -- read 12 bytes of data
	constant SPI_MAX_SIZE            : integer := maximum(SPI_WRITE_SIZE, SPI_READ_SIZE) + 1; -- +1: write 1 byte address always
	constant SPI_BIT_COUNTER_SIZE    : integer := SizeCountNTimes(SPI_MAX_SIZE * 8);

	constant SPI_READ  : std_logic := '1';
	constant SPI_WRITE : std_logic := '0';

	constant SPI_TRANSACTION_DELAY_TIME_NORMAL  : real    := 2.5; -- delay in us between SPI transactions in normal power mode.
	constant SPI_TRANSACTION_DELAY_TIME_SUSPEND : real    := 460.0; -- delay in us between SPI transactions in suspend power mode.
	constant SPI_TRANSACTION_DELAY_TIME_ACCEL   : real    := 4.5 * 1000.0; -- delay in us between SPI transactions when turning on/off accelerometer.
	constant SPI_TRANSACTION_DELAY_TIME_GYRO    : real    := 82.0 * 1000.0; -- delay in us between SPI transactions when turning on/off gyroscope.
	constant SPI_TRANSACTION_DELAY_COUNTER_SIZE : integer := SizeCountUpToN(SPI_TRANSACTION_DELAY_TIME_GYRO * LOGIC_CLOCK_FREQ);
	

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
	signal ScaleReg_DP, ScaleReg_DN : std_logic_vector(4 downto 0);

	-- Register outputs to FIFO.
	signal OutFifoWriteReg_S : std_logic;
	signal OutFifoDataReg_D  : std_logic_vector(EVENT_WIDTH - 1 downto 0);

	-- Register configuration inputs.
	signal IMUConfigReg_D : tIMUConfig;

	-- Track system startup.
	signal StartupPhase_DP, StartupPhase_DN : unsigned(2 downto 0);

	signal DelayClear_S            : std_logic;
	signal DelayData_D             : unsigned(SPI_TRANSACTION_DELAY_COUNTER_SIZE - 1 downto 0);
	signal TransactionDelayValue_D : unsigned(SPI_TRANSACTION_DELAY_COUNTER_SIZE - 1 downto 0);

	signal RunAccelChanged_S, RunAccelSent_S : std_logic;
	signal RunGyroChanged_S, RunGyroSent_S   : std_logic;
	signal RunTempChanged_S, RunTempSent_S   : std_logic;

	signal AccelDataRateChanged_S, AccelDataRateSent_S : std_logic;
	signal AccelFilterChanged_S, AccelFilterSent_S     : std_logic;
	signal AccelRangeChanged_S, AccelRangeSent_S       : std_logic;
	signal GyroDataRateChanged_S, GyroDataRateSent_S   : std_logic;
	signal GyroFilterChanged_S, GyroFilterSent_S       : std_logic;
	signal GyroRangeChanged_S, GyroRangeSent_S         : std_logic;

	-- IMU Run Status: bit 0 accelerometer, bit 1 gyroscope.
	constant IMU_RUN_STATUS_NONE      : std_logic_vector(2 downto 0) := "000";
	constant IMU_RUN_STATUS_ACCEL     : integer                      := 2;
	constant IMU_RUN_STATUS_GYRO      : integer                      := 1;
	constant IMU_RUN_STATUS_TEMP      : integer                      := 0;
	signal RunStatus_SP, RunStatus_SN : std_logic_vector(2 downto 0);

	-- IMU Power Mode: 00 suspend, 01 starting accel, 10 starting gyro, 11 normal.
	constant IMU_POWER_MODE_SUSPEND   : std_logic_vector(1 downto 0) := "00";
	constant IMU_POWER_MODE_ACCEL     : std_logic_vector(1 downto 0) := "01";
	constant IMU_POWER_MODE_GYRO      : std_logic_vector(1 downto 0) := "10";
	constant IMU_POWER_MODE_NORMAL    : std_logic_vector(1 downto 0) := "11";
	signal PowerMode_SP, PowerMode_SN : std_logic_vector(1 downto 0);

	-- Temperature needs a separate read on this IMU, as it has a different register address.
	-- Also, it is only updated every 10 ms, so we only read a new value every 10 ms.
	signal TemperatureDoReadClear_S, TemperatureDoRead_S : std_logic;
	constant TEMPERATURE_READOUT_TIME                    : real := 10.0 * 1000.0; -- Time between consecutive temperature updates.
	constant TEMPERATURE_READOUT_COUNTER_SIZE            : integer := SizeCountUpToN(TEMPERATURE_READOUT_TIME * LOGIC_CLOCK_FREQ);
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

	imuLogic : process(State_DP, OutFifoControl_SI, IMUConfigReg_D, IMUInterrupt1_SI, SPIDone_SP, SPISRParOutput_D, ScaleReg_DP, StartupPhase_DP, DelayData_D, AccelDataRateChanged_S, AccelFilterChanged_S, AccelRangeChanged_S, GyroDataRateChanged_S, GyroFilterChanged_S, GyroRangeChanged_S, TransactionDelayValue_D, PowerMode_SP, SPIReadSize_DP, RunAccelChanged_S, RunGyroChanged_S, RunStatus_SP, TemperatureDoRead_S, SPIReadShift_DP, RunTempChanged_S)
	begin
		State_DN <= State_DP;           -- Keep current state by default.

		StartupPhase_DN <= StartupPhase_DP;
		DelayClear_S    <= '1';

		RunStatus_SN <= RunStatus_SP;
		PowerMode_SN <= PowerMode_SP;

		TemperatureDoReadClear_S <= '0';

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

		AccelDataRateSent_S <= '0';
		AccelFilterSent_S   <= '0';
		AccelRangeSent_S    <= '0';
		GyroDataRateSent_S  <= '0';
		GyroFilterSent_S    <= '0';
		GyroRangeSent_S     <= '0';

		case State_DP is
			when stStartup0 =>
				-- Enable SPI by doing a single access on register 0x7F. The important thing is CS going down and up again,
				-- so that a positive edge on CS is seen. We use write-mode, so 2 bytes, and all 16 bits are 1.
				SPISRParInput_D(103 downto 88) <= (others => '1');

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(0, StartupPhase_DN'length);

			when stStartup1 =>
				-- Configure interrupt mapping: select Data Ready interrupt on Interrupt 1.
				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.InterruptMap);
				SPISRParInput_D(95)            <= '1'; -- Int1_DRDY.

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(1, StartupPhase_DN'length);

			when stStartup2 =>
				-- Configure interrupt latching.
				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.InterruptLatch);
				SPISRParInput_D(91 downto 88)  <= "1111"; -- Full latch.

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(2, StartupPhase_DN'length);

			when stStartup3 =>
				-- Configure interrupt electrical behavior.
				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.InterruptOutput);
				SPISRParInput_D(91)            <= '1'; -- Interrupt 1 output enabled.
				SPISRParInput_D(89)            <= '1'; -- Interrupt 1 active-high.

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(3, StartupPhase_DN'length);

			when stStartup4 =>
				-- Enable interrupt.
				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.InterruptEnable);
				SPISRParInput_D(92)            <= '1'; -- Enable Data Ready interrupt.

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(4, StartupPhase_DN'length);

			when stStartup5 =>
				-- Configure fast calibration.
				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.FastCalibration);
				SPISRParInput_D(94)            <= '1'; -- Enable gyro fast offset compensation.
				SPISRParInput_D(93 downto 92)  <= "11"; -- Enable accel X fast offset compensation: 01 +1g, 10 -1g, 11 0g.
				SPISRParInput_D(91 downto 90)  <= "10"; -- Enable accel Y fast offset compensation: 01 +1g, 10 -1g, 11 0g.
				SPISRParInput_D(89 downto 88)  <= "11"; -- Enable accel Z fast offset compensation: 01 +1g, 10 -1g, 11 0g.

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

				StartupPhase_DN <= to_unsigned(5, StartupPhase_DN'length);

			when stIdle =>
				-- When the Run signals change, we need to configure the IMU appropriately.
				-- Else, if anything is in fact turned on, we wait on the interrupt to signal
				-- us to get new data, or we send off configuration changes. Else we idle.
				if RunAccelChanged_S then
					State_DN <= stAckAndPowerAccel;
				elsif RunGyroChanged_S or RunTempChanged_S then
					State_DN <= stAckAndPowerGyroTemp;
				elsif RunStatus_SP /= IMU_RUN_STATUS_NONE then
					if not OutFifoControl_SI.AlmostFull_S then
						if IMUInterrupt1_SI and (RunStatus_SP(IMU_RUN_STATUS_ACCEL) or RunStatus_SP(IMU_RUN_STATUS_GYRO)) then
							State_DN <= stPrepareReadDataRegister;
						end if;

						if TemperatureDoRead_S and RunStatus_SP(IMU_RUN_STATUS_TEMP) then
							State_DN <= stPrepareReadTemperature;
						end if;
					end if;

					if AccelDataRateChanged_S or AccelFilterChanged_S then
						State_DN <= stAckAndLoadAccelConf;
					end if;
					if AccelRangeChanged_S then
						State_DN <= stAckAndLoadAccelRange;
					end if;
					if GyroDataRateChanged_S or GyroFilterChanged_S then
						State_DN <= stAckAndLoadGyroConf;
					end if;
					if GyroRangeChanged_S then
						State_DN <= stAckAndLoadGyroRange;
					end if;
				end if;

			when stAckAndPowerAccel =>
				RunAccelSent_S <= '1';

				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.Command);
				SPISRParInput_D(95 downto 89)  <= std_logic_vector(SPI_COMMANDS.AccelPowerMode);
				SPISRParInput_D(88)            <= IMUConfigReg_D.RunAccel_S;

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				-- Change in power mode for accelerometer.
				PowerMode_SN                       <= IMU_POWER_MODE_ACCEL;
				RunStatus_SN(IMU_RUN_STATUS_ACCEL) <= IMUConfigReg_D.RunAccel_S;

				State_DN <= stWriteConfigRegister;

			when stAckAndPowerGyroTemp =>
				RunGyroSent_S <= '1';
				RunTempSent_S <= '1';

				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.Command);
				SPISRParInput_D(95 downto 89)  <= std_logic_vector(SPI_COMMANDS.GyroPowerMode);
				SPISRParInput_D(88)            <= IMUConfigReg_D.RunGyro_S or IMUConfigReg_D.RunTemp_S;

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				-- Change in power mode for gyroscope.
				PowerMode_SN                      <= IMU_POWER_MODE_GYRO;
				RunStatus_SN(IMU_RUN_STATUS_GYRO) <= IMUConfigReg_D.RunGyro_S;
				RunStatus_SN(IMU_RUN_STATUS_TEMP) <= IMUConfigReg_D.RunTemp_S;

				State_DN <= stWriteConfigRegister;

			when stAckAndLoadAccelConf =>
				AccelDataRateSent_S <= '1';
				AccelFilterSent_S   <= '1';

				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.AccelConfig);
				SPISRParInput_D(94 downto 92)  <= '0' & std_logic_vector(IMUConfigReg_D.AccelFilter_D);
				SPISRParInput_D(91 downto 88)  <= std_logic_vector(resize(IMUConfigReg_D.AccelDataRate_D, 4) + to_unsigned(5, 4));

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

			when stAckAndLoadAccelRange =>
				AccelRangeSent_S <= '1';

				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.AccelRange);

				case IMUConfigReg_D.AccelRange_D is
					when to_unsigned(0, tIMUConfig.AccelRange_D'length) =>
						SPISRParInput_D(91 downto 88) <= "0011";

					when to_unsigned(1, tIMUConfig.AccelRange_D'length) =>
						SPISRParInput_D(91 downto 88) <= "0101";

					when to_unsigned(2, tIMUConfig.AccelRange_D'length) =>
						SPISRParInput_D(91 downto 88) <= "1000";

					when to_unsigned(3, tIMUConfig.AccelRange_D'length) =>
						SPISRParInput_D(91 downto 88) <= "1100";

					when others => null;
				end case;

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				ScaleRegEnable_S        <= '1';
				ScaleReg_DN(4 downto 3) <= std_logic_vector(IMUConfigReg_D.AccelRange_D);

				State_DN <= stWriteConfigRegister;

			when stAckAndLoadGyroConf =>
				GyroDataRateSent_S <= '1';
				GyroFilterSent_S   <= '1';

				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.GyroConfig);
				SPISRParInput_D(93 downto 92)  <= std_logic_vector(IMUConfigReg_D.GyroFilter_D);
				SPISRParInput_D(91 downto 88)  <= std_logic_vector(resize(IMUConfigReg_D.GyroDataRate_D, 4) + to_unsigned(6, 4));

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				State_DN <= stWriteConfigRegister;

			when stAckAndLoadGyroRange =>
				GyroRangeSent_S <= '1';

				SPISRParInput_D(103)           <= SPI_WRITE;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.GyroRange);
				SPISRParInput_D(90 downto 88)  <= std_logic_vector(IMUConfigReg_D.GyroRange_D);

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				ScaleRegEnable_S        <= '1';
				ScaleReg_DN(2 downto 0) <= std_logic_vector(IMUConfigReg_D.GyroRange_D);

				State_DN <= stWriteConfigRegister;

			when stWriteConfigRegister =>
				-- Signal the SPI state machine to start the current write transaction.
				SPIStartTransaction_SN <= '1';

				-- Wait until SPI signals done.
				if SPIDone_SP then
					State_DN <= stDoneAcknowledge;
				end if;

			when stPrepareReadTemperature =>
				SPISRParInput_D(103)           <= SPI_READ;
				SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.TempData);

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				SPIReadSize_DN  <= to_unsigned(2, 4);
				SPIReadShift_DN <= to_unsigned(0, 4);

				-- Prime temperature to be read again in 10 ms.
				TemperatureDoReadClear_S <= '1';

				State_DN <= stReadTemperature;

			when stReadTemperature =>
				-- Signal the SPI state machine to start the current read transaction.
				SPIStartTransaction_SN <= '1';
				SPIReadTransaction_SN  <= '1';

				-- Wait until SPI signals done.
				if SPIDone_SP then
					State_DN <= stWriteTemperatureEventStart;
				end if;

			when stWriteTemperatureEventStart =>
				OutFifoDataReg_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_IMU_START6;
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteTemperatureEventInfo;

			when stWriteTemperatureEventInfo =>
				-- Temperature always enabled/present if we get to this state!
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU_SCALE & "001" & ScaleReg_DP;
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteTemperatureEventT0;

			when stWriteTemperatureEventT0 =>
				-- Upper 8 bits of Temperature.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(15 downto 8);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteTemperatureEventT1;

			when stWriteTemperatureEventT1 =>
				-- Lower 8 bits of Temperature.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(7 downto 0);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteTemperatureEventEnd;

			when stWriteTemperatureEventEnd =>
				OutFifoDataReg_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_IMU_END;
				OutFifoWriteReg_S <= '1';
				State_DN          <= stDoneAcknowledge;

			when stPrepareReadDataRegister =>
				SPISRParInput_D(103) <= SPI_READ;

				if RunStatus_SP(IMU_RUN_STATUS_GYRO) then
					SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.GyroData);
				else
					SPISRParInput_D(102 downto 96) <= std_logic_vector(SPI_REGISTER_ADDRESSES.AccelData);
				end if;

				SPISRModeExt_S <= SHIFTREGISTER_MODE_PARALLEL_LOAD;

				if RunStatus_SP(IMU_RUN_STATUS_ACCEL) and RunStatus_SP(IMU_RUN_STATUS_GYRO) then
					SPIReadSize_DN <= to_unsigned(12, 4);
				else
					SPIReadSize_DN <= to_unsigned(6, 4);
				end if;

				if not RunStatus_SP(IMU_RUN_STATUS_ACCEL) and RunStatus_SP(IMU_RUN_STATUS_GYRO) then
					SPIReadShift_DN <= to_unsigned(6, 4);
				else
					SPIReadShift_DN <= to_unsigned(0, 4);
				end if;

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
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU_SCALE & RunStatus_SP(2 downto 1) & '0' & ScaleReg_DP;
				OutFifoWriteReg_S <= '1';

				if RunStatus_SP(IMU_RUN_STATUS_ACCEL) then
					State_DN <= stWriteEventA0;
				else
					State_DN <= stWriteEventG0;
				end if;

			when stWriteEventA0 =>
				-- Upper 8 bits of Accel X.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(47 downto 40);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA1;

			when stWriteEventA1 =>
				-- Lower 8 bits of Accel X.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(39 downto 32);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA2;

			when stWriteEventA2 =>
				-- Upper 8 bits of Accel Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(31 downto 24);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA3;

			when stWriteEventA3 =>
				-- Lower 8 bits of Accel Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(23 downto 16);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA4;

			when stWriteEventA4 =>
				-- Upper 8 bits of Accel Z.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(15 downto 8);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventA5;

			when stWriteEventA5 =>
				-- Lower 8 bits of Accel Z.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(7 downto 0);
				OutFifoWriteReg_S <= '1';

				if RunStatus_SP(IMU_RUN_STATUS_GYRO) then
					State_DN <= stWriteEventG0;
				else
					State_DN <= stWriteEventEnd;
				end if;

			when stWriteEventG0 =>
				-- Upper 8 bits of Gyro X.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(95 downto 88);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG1;

			when stWriteEventG1 =>
				-- Lower 8 bits of Gyro X.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(87 downto 80);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG2;

			when stWriteEventG2 =>
				-- Upper 8 bits of Gyro Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(79 downto 72);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG3;

			when stWriteEventG3 =>
				-- Lower 8 bits of Gyro Y.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(71 downto 64);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG4;

			when stWriteEventG4 =>
				-- Upper 8 bits of Gyro Z.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(63 downto 56);
				OutFifoWriteReg_S <= '1';
				State_DN          <= stWriteEventG5;

			when stWriteEventG5 =>
				-- Lower 8 bits of Gyro Z.
				OutFifoDataReg_D  <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_IMU & SPISRParOutput_D(55 downto 48);
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
					State_DN <= stTransactionDelay;
				end if;

			when stTransactionDelay =>
				DelayClear_S <= '0';

				-- Wait after every SPI transaction.
				if DelayData_D = TransactionDelayValue_D then
					State_DN <= stManageStartup;

					-- Power mode tracking: if the powermode indicates a change, we have to update the power mode
					-- to either NORMAL or SUSPEND, depending on if anything is running or not. This will always
					-- eventually settle, even if these values are changing all the time. It is handled here,
					-- after the delay, as the value itself influences the actual delay time.
					if PowerMode_SP = IMU_POWER_MODE_ACCEL or PowerMode_SP = IMU_POWER_MODE_GYRO then
						if RunStatus_SP = IMU_RUN_STATUS_NONE then
							PowerMode_SN <= IMU_POWER_MODE_SUSPEND;
						else
							PowerMode_SN <= IMU_POWER_MODE_NORMAL;
						end if;
					end if;
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
						State_DN <= stStartup4;

					when to_unsigned(4, StartupPhase_DP'length) =>
						State_DN <= stStartup5;

					when to_unsigned(5, StartupPhase_DP'length) =>
						State_DN <= stIdle;

					when others => null;
				end case;

			when others => null;
		end case;
	end process imuLogic;

	with PowerMode_SP select TransactionDelayValue_D <=
		to_unsigned(integer(SPI_TRANSACTION_DELAY_TIME_SUSPEND * LOGIC_CLOCK_FREQ), SPI_TRANSACTION_DELAY_COUNTER_SIZE) when IMU_POWER_MODE_SUSPEND,
		to_unsigned(integer(SPI_TRANSACTION_DELAY_TIME_ACCEL * LOGIC_CLOCK_FREQ), SPI_TRANSACTION_DELAY_COUNTER_SIZE) when IMU_POWER_MODE_ACCEL,
		to_unsigned(integer(SPI_TRANSACTION_DELAY_TIME_GYRO * LOGIC_CLOCK_FREQ), SPI_TRANSACTION_DELAY_COUNTER_SIZE) when IMU_POWER_MODE_GYRO,
		to_unsigned(integer(SPI_TRANSACTION_DELAY_TIME_NORMAL * LOGIC_CLOCK_FREQ), SPI_TRANSACTION_DELAY_COUNTER_SIZE) when IMU_POWER_MODE_NORMAL,
		(others => '0') when others;

	-- Change state on clock edge (synchronous).
	imuRegisterUpdate : process(Clock_CI, Reset_RI)
	begin
		if Reset_RI then                -- asynchronous reset (active-high for FPGAs)
			State_DP <= stStartup0;

			OutFifoControl_SO.Write_S <= '0';
			OutFifoData_DO            <= (others => '0');

			StartupPhase_DP <= to_unsigned(0, StartupPhase_DP'length);

			RunStatus_SP <= IMU_RUN_STATUS_NONE;
			PowerMode_SP <= IMU_POWER_MODE_SUSPEND;

			IMUConfigReg_D <= tIMUConfigDefault;
		elsif rising_edge(Clock_CI) then
			State_DP <= State_DN;

			OutFifoControl_SO.Write_S <= OutFifoWriteReg_S;
			OutFifoData_DO            <= OutFifoDataReg_D;

			StartupPhase_DP <= StartupPhase_DN;

			RunStatus_SP <= RunStatus_SN;
			PowerMode_SP <= PowerMode_SN;

			IMUConfigReg_D <= IMUConfig_DI;
		end if;
	end process imuRegisterUpdate;

	-- Remember the values of the accelerometer and gyroscope full scale settings.
	-- This is updated when sending out new values for these properties, so we can
	-- always tell the host the exact settings with which a sample was produced.
	scaleRegister : entity work.SimpleRegister
		generic map(
			SIZE => 5)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => ScaleRegEnable_S,
			Input_SI  => ScaleReg_DN,
			Output_SO => ScaleReg_DP);

	-- Temperature is only updated every 10 ms, and has to be read separately, so we only
	-- go and read it every 10 ms, basically generating our own internal time-based interrupt.
	temperatureCounter : entity work.ContinuousCounter
		generic map(
			SIZE              => TEMPERATURE_READOUT_COUNTER_SIZE,
			RESET_ON_OVERFLOW => false,
			GENERATE_OVERFLOW => true)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => TemperatureDoReadClear_S,
			Enable_SI    => RunStatus_SP(IMU_RUN_STATUS_TEMP),
			DataLimit_DI => to_unsigned(integer(TEMPERATURE_READOUT_TIME * LOGIC_CLOCK_FREQ), TEMPERATURE_READOUT_COUNTER_SIZE),
			Overflow_SO  => TemperatureDoRead_S,
			Data_DO      => open);

	-- Run management.
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

	detectAccelDataRateChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.AccelDataRate_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.AccelDataRate_D),
			ChangeDetected_SO     => AccelDataRateChanged_S,
			ChangeAcknowledged_SI => AccelDataRateSent_S);

	detectAccelFilterChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.AccelFilter_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.AccelFilter_D),
			ChangeDetected_SO     => AccelFilterChanged_S,
			ChangeAcknowledged_SI => AccelFilterSent_S);

	detectAccelRangeChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.AccelRange_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.AccelRange_D),
			ChangeDetected_SO     => AccelRangeChanged_S,
			ChangeAcknowledged_SI => AccelRangeSent_S);

	detectGyroDataRateChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.GyroDataRate_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.GyroDataRate_D),
			ChangeDetected_SO     => GyroDataRateChanged_S,
			ChangeAcknowledged_SI => GyroDataRateSent_S);

	detectGyroFilterChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.GyroFilter_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.GyroFilter_D),
			ChangeDetected_SO     => GyroFilterChanged_S,
			ChangeAcknowledged_SI => GyroFilterSent_S);

	detectGyroRangeChange : entity work.ChangeDetector
		generic map(
			SIZE => tIMUConfig.GyroRange_D'length)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(IMUConfigReg_D.GyroRange_D),
			ChangeDetected_SO     => GyroRangeChanged_S,
			ChangeAcknowledged_SI => GyroRangeSent_S);

	transactionDelayCounter : entity work.Counter
		generic map(
			SIZE => SPI_TRANSACTION_DELAY_COUNTER_SIZE)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Clear_SI  => DelayClear_S,
			Enable_SI => '1',
			Data_DO   => DelayData_D);
end architecture Behavioral;
