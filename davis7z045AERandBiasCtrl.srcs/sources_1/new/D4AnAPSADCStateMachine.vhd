library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Functions.SizeCountUpToN;
use work.EventCodes.all;
use work.FIFORecords.all;
use work.D4AAPSADCConfigRecords.all;
use work.ChipGeometry.AXES_KEEP;
use work.ChipGeometry.AXES_INVERT;
use work.Settings.CHIP_APS_SIZE_COLUMNS;
use work.Settings.CHIP_APS_SIZE_ROWS;
use work.Settings.CHIP_APS_STREAM_START;
use work.Settings.CHIP_APS_AXES_INVERT;
use work.Settings.APS_ADC_BUS_WIDTH;
use work.Settings.ADC_CLOCK_FREQ;

-- Region Of Interest (ROI) support: both global and rolling shutter modes support specifying
-- a region of the full image to be scanned, instead of the full image. This enables skipping
-- certain sources of delay for pixels outside this given region, which makes for faster scan
-- times, and thus smaller delays and higher frame-rates.
-- In global shutter mode, since the reads are separated from each-other, from reset and from
-- integration, all pixels that are outside an interest region can be easily skipped. The
-- overall timing of the reset and signal reads will be the same.
-- In rolling shutter mode, things get more complex, given the precise 'time spacing' that must
-- be ovserved between the ResetRead and the SignalRead (see 'Rolling shutter considerations'
-- above). To guarantee this, all columns must take the same amount of time to be processed,
-- because if columns that are completely outside of the region of interest would take less time
-- (by just skipping them for example), then you have regions of the image that are traversed at
-- different speeds by the ResetReads and the successive SignalReads, since the SignalReads may
-- overlap with the ResetReads, and then could not just quickly advance the column shift register
-- like the ResetReads did, resulting in timing differences. An easy way to overcome this is by
-- just having all columns go through the same readout process, like if the region of interest
-- were always expanded to fit across all columns equally. This slightly mitigates the
-- advantages of ROI stated above, but is unavoidable with the current scheme.

entity D4AnAPSADCStateMachine is
	port(
		Clock_CI                 : in  std_logic; -- Clock for logic and chip internal ADC.
		Reset_RI                 : in  std_logic; -- This reset must be synchronized to the above clock.

		-- Fifo output (to Multiplexer, must be a dual-clock FIFO)
		OutFifoControl_SI        : in  tFromFifoWriteSide;
		OutFifoControl_SO        : out tToFifoWriteSide;
		OutFifoData_DO           : out std_logic_vector(EVENT_WIDTH - 1 downto 0);

		APSChipRowSRClock_CO     : out std_logic;
		APSChipRowSRIn_SO        : out std_logic;
		APSChipOverflowGate_SO   : out std_logic;
		APSChipTXGate_SO         : out std_logic;
		APSChipReset_SO          : out std_logic;
		APSChipGlobalShutter_SBO : out std_logic;

		ChipADCData_DI           : in  std_logic_vector(APS_ADC_BUS_WIDTH - 1 downto 0);
		ChipADCRampClear_SO      : out std_logic;
		ChipADCRampClock_CO      : out std_logic;
		ChipADCRampBitIn_SO      : out std_logic;
		ChipADCScanClock_CO      : out std_logic;
		ChipADCScanControl_SO    : out std_logic;
		ChipADCSample_SO         : out std_logic;
	
		-- Configuration input
		D4AAPSADCConfig_DI       : in  tD4AAPSADCConfig);
end entity D4AnAPSADCStateMachine;

architecture Behavioral of D4AnAPSADCStateMachine is
	attribute syn_enum_encoding : string;

	type tColumnState is (stIdle, stStartFrame, stEndFrame, stWaitFrameInterval, stRSIdle, stRSReadoutFeedOne1, stRSReadoutFeedOne1Tick, stRSReadoutFeedOne2, stRSReadoutFeedOne2Tick, stRSReadoutFeedOne3, stRSReadoutFeedOne3Tick, stRSFDSettle, stRSSample1Start, stRSSample1Done,
	                      stRSChargeTransfer, stRSSample2Start, stRSSample2Done, stRSFeed, stRSFeedTick, stGSIdle, stGSPDReset, stGSExposureStart, stGSResetFallTime, stGSChargeTransfer, stGSExposureEnd, stGSSwitchToReadout1, stGSSwitchToReadout2, stGSReadoutFeedOne,
	                      stGSReadoutFeedOneTick, stGSReadoutFeedZero, stGSReadoutFeedZeroTick, stGSSample1Start, stGSSample1Done, stGSFDReset, stGSSample2Start, stGSSample2Done,
	                      stROI0InfoStartCol1, stROI0InfoStartCol2, stROI0InfoStartRow1, stROI0InfoStartRow2, stROI0InfoEndCol1, stROI0InfoEndCol2, stROI0InfoEndRow1, stROI0InfoEndRow2,
	                      stExposureValue0, stExposureValue1, stExposureValue2, stRSStartExposureEvent, stGSStartExposureEvent, stGSEndExposureEvent, stRSEndExposureEvent);
	attribute syn_enum_encoding of tColumnState : type is "onehot";

	-- present and next state
	signal ColState_DP, ColState_DN : tColumnState;

	constant SAMPLETYPE_NULL    : std_logic_vector(1 downto 0) := "00";
	constant SAMPLETYPE_FDRESET : std_logic_vector(1 downto 0) := "01";
	constant SAMPLETYPE_SIGNAL  : std_logic_vector(1 downto 0) := "10";
	-- constant SAMPLETYPE_CPRESET : std_logic_vector(1 downto 0) := "11";

	signal APSSampleTypeReg_DP, APSSampleTypeReg_DN : std_logic_vector(1 downto 0);

	-- Keep track of what type of timing-only (fake) read is happening.
	signal TimingRead_DP, TimingRead_DN : std_logic_vector(1 downto 0);

	-- Exposure time counter.
	signal ExposureClear_S, ExposureDone_S : std_logic;

	-- Frame interval (between start of consecutive frames) counter.
	signal FrameIntervalClear_S, FrameIntervalDone_S : std_logic;

	-- Row settle time counter (at start of "column", but called "row" because of inverted layout).
	constant APS_ROWSETTLETIME                       : integer := integer(ADC_CLOCK_FREQ / 3.0);
	constant APS_ROWSETTLETIME_SIZE                  : integer := SizeCountUpToN(APS_ROWSETTLETIME);
	signal RowSettleTimeCount_S, RowSettleTimeDone_S : std_logic;

	-- Charge transfer time counter.
	signal TransferTimeCount_S, TransferTimeDone_S : std_logic;

	-- RS specific time counters.
	signal RSFDSettleTimeCount_S, RSFDSettleTimeDone_S : std_logic;

	-- GS specific time counters.
	signal GSPDResetTimeCount_S, GSPDResetTimeDone_S     : std_logic;
	signal GSResetFallTimeCount_S, GSResetFallTimeDone_S : std_logic;
	signal GSTXFallTimeCount_S, GSTXFallTimeDone_S       : std_logic;
	signal GSFDResetTimeCount_S, GSFDResetTimeDone_S     : std_logic;

	-- Lengthen clock high period.
	signal ClockSlowDownCount_S, ClockSlowDownDone_S : std_logic;

	-- Column and row read counters.
	signal ColumnReadPositionZero_S, ColumnReadPositionInc_S : std_logic;
	signal ColumnReadPosition_D                              : unsigned(CHIP_APS_SIZE_COLUMNS'range);
	signal RowReadPositionZero_S, RowReadPositionInc_S       : std_logic;
	signal RowReadPosition_D                                 : unsigned(CHIP_APS_SIZE_ROWS'range);

	-- Track row read position for ROI, so it follows same order as actual read pixels.
	signal ROIRowReadPositionZero_S, ROIRowReadPositionInc_S : std_logic;
	signal ROIRowReadPosition_D                              : unsigned(CHIP_APS_SIZE_ROWS'range);
	signal ROIRowReadDirection_S                             : std_logic;

	-- Communication between column and row state machines. Done through a register for full decoupling.
	signal RowReadInProgress_SP, RowReadStart_SN, RowReadDone_SN : std_logic;

	-- Wait for all row-read parts to be done before sending end-of-frame (EOF) event.
	signal RowReadsAllDone_S : std_logic;

	-- RS: the B read has several very special considerations that must be taken into account.
	-- First, it has to be done only after exposure time expires, before that, it must be faked
	-- to not throw off timing. Secondly, the B read binary pattern is a 1 with a 0 on either
	-- side, which means that it cannot come right after the A pattern; at least one 0 must be
	-- first shifted in. Also, it needs a further 0 to be shifted in after the 1, before B
	-- reads can really begin. We use the following two registers to control this.
	signal ReadBSRStatus_DP, ReadBSRStatus_DN : std_logic_vector(1 downto 0);

	constant RBSTAT_NEED_ZERO_ONE : std_logic_vector(1 downto 0) := "00";
	constant RBSTAT_NEED_ONE      : std_logic_vector(1 downto 0) := "01";
	constant RBSTAT_NEED_ZERO_TWO : std_logic_vector(1 downto 0) := "10";
	constant RBSTAT_NORMAL        : std_logic_vector(1 downto 0) := "11";

	-- Check column and row validity. Used for faster ROI.
	signal CurrentColumnValid_S : std_logic;
	signal CurrentRowValid_S    : std_logic;

	-- ROI size information.
	signal ROI0StartColumn_D : unsigned(15 downto 0);
	signal ROI0StartRow_D    : unsigned(15 downto 0);
	signal ROI0EndColumn_D   : unsigned(15 downto 0);
	signal ROI0EndRow_D      : unsigned(15 downto 0);

	-- Register outputs to FIFO.
	signal OutFifoWriteReg_S, OutFifoWriteRegCol_S, OutFifoWriteRegRow_S : std_logic;
	signal OutFifoDataReg_D, OutFifoDataRegCol_D, OutFifoDataRegRow_D    : std_logic_vector(EVENT_WIDTH - 1 downto 0);

	-- Register all outputs to chip APS control for clean transitions.
	signal APSChipColSRClockReg_C, APSChipColSRInReg_S            : std_logic;
	signal APSChipOverflowGateReg_SP, APSChipOverflowGateReg_SN   : std_logic;
	signal APSChipTXGateReg_SP, APSChipTXGateReg_SN               : std_logic;
	signal APSChipResetReg_SP, APSChipResetReg_SN                 : std_logic;
	signal APSChipGlobalShutterReg_SP, APSChipGlobalShutterReg_SN : std_logic;

	type tChipRowSampleState is (stIdle, stCaptureColMode, stRowSettleWait, stRowSampleWait, stRowSample, stDone);
	attribute syn_enum_encoding of tChipRowSampleState : type is "onehot";

	-- present and next state (Sample&Hold)
	signal ChipRowSampleState_DP, ChipRowSampleState_DN : tChipRowSampleState;

	type tChipRowRampState is (stIdle, stRowRampFeed, stRowRampFeedTick, stRowRampResetSettle, stRowRampClockLow, stRowRampClockHigh, stRowScanWait, stRowScanSelect, stRowScanSelectTick, stDone);
	attribute syn_enum_encoding of tChipRowRampState : type is "onehot";

	-- present and next state (Ramp generation)
	signal ChipRowRampState_DP, ChipRowRampState_DN : tChipRowRampState;

	type tChipRowScanState is (stIdle, stRowStart, stRowScanReadValue, stRowScanJumpValue, stRowScanNextValue, stRowDone);
	attribute syn_enum_encoding of tChipRowScanState : type is "onehot";

	-- present and next state (Value scan-out)
	signal ChipRowScanState_DP, ChipRowScanState_DN : tChipRowScanState;

	-- On-chip ADC control.
	signal ChipADCRampClearReg_S                          : std_logic;
	signal ChipADCRampClockReg_C                          : std_logic;
	signal ChipADCRampBitInReg_S                          : std_logic;
	signal ChipADCScanClockReg1_C, ChipADCScanClockReg2_C : std_logic; -- Used from two SMs (Ramp, Scan) but never concurrently.
	signal ChipADCScanControlReg_S                        : std_logic;
	signal ChipADCSampleReg_S                             : std_logic;

	-- Ramp clock counter. Could be used to generate grey-code if needed too.
	signal RampTickCount_S, RampTickDone_S : std_logic;

	-- Sample time settle counter.
	constant APS_SAMPLESETTLETIME                          : integer := integer(ADC_CLOCK_FREQ * 2.0);
	constant APS_SAMPLESETTLETIME_SIZE                     : integer := SizeCountUpToN(APS_SAMPLESETTLETIME);
	signal SampleSettleTimeCount_S, SampleSettleTimeDone_S : std_logic;

	-- Ramp reset time counter.
	constant APS_RAMPRESETTIME                       : integer := integer(ADC_CLOCK_FREQ / 3.0);
	constant APS_RAMPRESETTIME_SIZE                  : integer := SizeCountUpToN(APS_RAMPRESETTIME);
	signal RampResetTimeCount_S, RampResetTimeDone_S : std_logic;

	-- Scan control constants.
	constant SCAN_CONTROL_COPY_OVER    : std_logic := '0';
	constant SCAN_CONTROL_SCAN_THROUGH : std_logic := '1';

	-- For pipelined internal ADC, we split the row-read into three small state machines.
	-- This means we must also pass down the pipe what kind of read (NULL, Reset, Signal)
	-- we are doing, since that information is needed not only during sample time to actually
	-- select the correct read type, but also during column-start-event writeout, which would
	-- happen in the last of the three SMs, and so we need two additional registers to pass
	-- that information down and one more to store it at the end.
	signal APSSampleTypeRegSample_DP, APSSampleTypeRegSample_DN : std_logic_vector(1 downto 0);
	signal APSSampleTypeRegRamp_DP, APSSampleTypeRegRamp_DN     : std_logic_vector(1 downto 0);
	signal APSSampleTypeRegScan_DP, APSSampleTypeRegScan_DN     : std_logic_vector(1 downto 0);

	-- Do the same to keep track of type of timing-only (fake) reads, information which is needed
	-- to shorten the ramp during reset reads in RS mode. The main ColMode registers only show
	-- type NULL then, so we need additional information to determine this.
	signal TimingReadSample_DP, TimingReadSample_DN : std_logic_vector(1 downto 0);
	signal TimingReadRamp_DP, TimingReadRamp_DN     : std_logic_vector(1 downto 0);

	-- We also need two additional registers for the two new SMs to notify when they
	-- are actually running and control them.
	signal RampInProgress_SP, RampStart_SN, RampDone_SN : std_logic;
	signal ScanInProgress_SP, ScanStart_SN, ScanDone_SN : std_logic;

	-- Double register configuration input, since it comes from a different clock domain (LogicClock), it
	-- needs to go through a double-flip-flop synchronizer to guarantee correctness.
	signal D4AAPSADCConfigSyncReg_D, D4AAPSADCConfigReg_D : tD4AAPSADCConfig;
	signal D4AAPSADCConfigRegEnable_S                     : std_logic;
begin
	colReadPosition : entity work.ContinuousCounter
		generic map(
			SIZE              => CHIP_APS_SIZE_COLUMNS'length,
			RESET_ON_OVERFLOW => false,
			GENERATE_OVERFLOW => false)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => ColumnReadPositionZero_S,
			Enable_SI    => ColumnReadPositionInc_S,
			DataLimit_DI => CHIP_APS_SIZE_COLUMNS,
			Overflow_SO  => open,
			Data_DO      => ColumnReadPosition_D);

	exposureCounter : entity work.ContinuousCounter
		generic map(
			SIZE              => APS_EXPOSURE_SIZE,
			RESET_ON_OVERFLOW => false)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => ExposureClear_S,
			Enable_SI    => '1',
			DataLimit_DI => D4AAPSADCConfigReg_D.Exposure_D,
			Overflow_SO  => ExposureDone_S,
			Data_DO      => open);

	frameIntervalCounter : entity work.ContinuousCounter
		generic map(
			SIZE              => APS_FRAME_INTERVAL_SIZE,
			RESET_ON_OVERFLOW => false)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => FrameIntervalClear_S,
			Enable_SI    => '1',
			DataLimit_DI => D4AAPSADCConfigReg_D.FrameInterval_D,
			Overflow_SO  => FrameIntervalDone_S,
			Data_DO      => open);

	TransferTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_TRANSFERTIME_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => TransferTimeCount_S,
			DataLimit_DI => D4AAPSADCConfigReg_D.Transfer_D,
			Overflow_SO  => TransferTimeDone_S,
			Data_DO      => open);

	RSFDSettleTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_RSFDSETTLETIME_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => RSFDSettleTimeCount_S,
			DataLimit_DI => D4AAPSADCConfigReg_D.RSFDSettle_D,
			Overflow_SO  => RSFDSettleTimeDone_S,
			Data_DO      => open);

	GSPDResetTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_GSPDRESETTIME_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => GSPDResetTimeCount_S,
			DataLimit_DI => D4AAPSADCConfigReg_D.GSPDReset_D,
			Overflow_SO  => GSPDResetTimeDone_S,
			Data_DO      => open);

	GSResetFallTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_GSRESETFALLTIME_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => GSResetFallTimeCount_S,
			DataLimit_DI => D4AAPSADCConfigReg_D.GSResetFall_D,
			Overflow_SO  => GSResetFallTimeDone_S,
			Data_DO      => open);

	GSTXFallTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_GSTXFALLTIME_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => GSTXFallTimeCount_S,
			DataLimit_DI => D4AAPSADCConfigReg_D.GSTXFall_D,
			Overflow_SO  => GSTXFallTimeDone_S,
			Data_DO      => open);

	GSFDResetTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_GSFDRESETTIME_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => GSFDResetTimeCount_S,
			DataLimit_DI => D4AAPSADCConfigReg_D.GSFDReset_D,
			Overflow_SO  => GSFDResetTimeDone_S,
			Data_DO      => open);

	-- Lenghten clock cycles when feeding ones into registers.
	clockSlowDownCounter : entity work.ContinuousCounter
		generic map(
			SIZE => 4)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => ClockSlowDownCount_S,
			DataLimit_DI => to_unsigned(integer(ADC_CLOCK_FREQ / 6.0), 4),
			Overflow_SO  => ClockSlowDownDone_S,
			Data_DO      => open);

	columnMainStateMachine : process(ColState_DP, D4AAPSADCConfigReg_D, APSChipGlobalShutterReg_SP, APSChipOverflowGateReg_SP, APSChipResetReg_SP, APSChipTXGateReg_SP, ClockSlowDownDone_S, ColumnReadPosition_D, CurrentColumnValid_S, ExposureDone_S, FrameIntervalDone_S, GSFDResetTimeDone_S, GSPDResetTimeDone_S, GSResetFallTimeDone_S, GSTXFallTimeDone_S, OutFifoControl_SI.AlmostFull_S, RSFDSettleTimeDone_S, ReadBSRStatus_DP, RowReadInProgress_SP, RowReadsAllDone_S, TransferTimeDone_S, OutFifoWriteRegRow_S)
	begin
		ColState_DN <= ColState_DP;     -- Keep current state by default.

		OutFifoWriteRegCol_S <= '0';
		OutFifoDataRegCol_D  <= (others => '0');

		APSChipColSRClockReg_C <= '0';
		APSChipColSRInReg_S    <= '0';

		ExposureClear_S <= '0';

		FrameIntervalClear_S <= '0';

		-- Colum counters.
		ColumnReadPositionZero_S <= '0';
		ColumnReadPositionInc_S  <= '0';

		-- Don't enable any counter by default.
		TransferTimeCount_S    <= '0';
		RSFDSettleTimeCount_S  <= '0';
		GSPDResetTimeCount_S   <= '0';
		GSResetFallTimeCount_S <= '0';
		GSTXFallTimeCount_S    <= '0';
		GSFDResetTimeCount_S   <= '0';

		ClockSlowDownCount_S <= '0';

		-- Keep value by default.
		APSChipOverflowGateReg_SN  <= APSChipOverflowGateReg_SP;
		APSChipTXGateReg_SN        <= APSChipTXGateReg_SP;
		APSChipResetReg_SN         <= APSChipResetReg_SP;
		APSChipGlobalShutterReg_SN <= APSChipGlobalShutterReg_SP;

		-- Row SM communication.
		RowReadStart_SN <= '0';

		APSSampleTypeReg_DN <= SAMPLETYPE_NULL;
		TimingRead_DN       <= SAMPLETYPE_NULL;

		-- Keep value by default.
		ReadBSRStatus_DN <= ReadBSRStatus_DP;

		-- Only update configuration when in Idle state. Doing so while the frame is being read out
		-- would cause different timing, exposure and read out types, resulting in corrupted frames.
		D4AAPSADCConfigRegEnable_S <= '0';

		case ColState_DP is
			when stIdle =>
				-- Update config, so that we get changes to Run_S especially.
				D4AAPSADCConfigRegEnable_S <= '1';

				-- Clear frame interval so next frame capture is on time (best effort).
				FrameIntervalClear_S <= '1';

				if D4AAPSADCConfigReg_D.Run_S then
					ColState_DN <= stStartFrame;
				end if;

			when stStartFrame =>
				-- Write out start of frame marker. This and the end of frame marker are the only
				-- two events from this SM that always have to be committed and are never dropped.
				if not OutFifoControl_SI.AlmostFull_S then
					if D4AAPSADCConfigReg_D.GlobalShutter_S then
						OutFifoDataRegCol_D <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_STARTFRAME_GS;
					else
						OutFifoDataRegCol_D <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_STARTFRAME_RS;
					end if;

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stExposureValue0;
				end if;

			when stExposureValue0 =>
				-- Write out Exposure information. Up to 30 bits value, divided in three parts.
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA10 & EVENT_CODE_MISC_DATA10_APS_EXPOSURE & std_logic_vector(D4AAPSADCConfigReg_D.Exposure_D(9 downto 0));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stExposureValue1;
				end if;

			when stExposureValue1 =>
				-- Write out Exposure information. Up to 30 bits value, divided in three parts.
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA10 & EVENT_CODE_MISC_DATA10_APS_EXPOSURE & std_logic_vector(D4AAPSADCConfigReg_D.Exposure_D(19 downto 10));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stExposureValue2;
				end if;

			when stExposureValue2 =>
				-- Write out Exposure information. Up to 30 bits value, divided in three parts.
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA10 & EVENT_CODE_MISC_DATA10_APS_EXPOSURE & std_logic_vector(resize(D4AAPSADCConfigReg_D.Exposure_D(APS_EXPOSURE_SIZE - 1 downto 20), 10));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stROI0InfoStartCol1;
				end if;

			when stROI0InfoStartCol1 =>
				-- Write out APS frame size markers. The different ROI regions are notified separately.
				-- One size result is split into two, to support sizes up to 16 bits per side.
				-- This event is always delivered, like Start/End events!
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_APS_ROISIZE_0 & std_logic_vector(resize(D4AAPSADCConfigReg_D.StartColumn0_D, 16)(15 downto 8));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stROI0InfoStartCol2;
				end if;

			when stROI0InfoStartCol2 =>
				-- Write out APS frame size markers. The different ROI regions are notified separately.
				-- One size result is split into two, to support sizes up to 16 bits per side.
				-- This event is always delivered, like Start/End events!
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_APS_ROISIZE_1 & std_logic_vector(resize(D4AAPSADCConfigReg_D.StartColumn0_D, 16)(7 downto 0));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stROI0InfoStartRow1;
				end if;

			when stROI0InfoStartRow1 =>
				-- Write out APS frame size markers. The different ROI regions are notified separately.
				-- One size result is split into two, to support sizes up to 16 bits per side.
				-- This event is always delivered, like Start/End events!
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_APS_ROISIZE_0 & std_logic_vector(resize(D4AAPSADCConfigReg_D.StartRow0_D, 16)(15 downto 8));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stROI0InfoStartRow2;
				end if;

			when stROI0InfoStartRow2 =>
				-- Write out APS frame size markers. The different ROI regions are notified separately.
				-- One size result is split into two, to support sizes up to 16 bits per side.
				-- This event is always delivered, like Start/End events!
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_APS_ROISIZE_1 & std_logic_vector(resize(D4AAPSADCConfigReg_D.StartRow0_D, 16)(7 downto 0));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stROI0InfoEndCol1;
				end if;

			when stROI0InfoEndCol1 =>
				-- Write out APS frame size markers. The different ROI regions are notified separately.
				-- One size result is split into two, to support sizes up to 16 bits per side.
				-- This event is always delivered, like Start/End events!
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_APS_ROISIZE_0 & std_logic_vector(resize(D4AAPSADCConfigReg_D.EndColumn0_D, 16)(15 downto 8));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stROI0InfoEndCol2;
				end if;

			when stROI0InfoEndCol2 =>
				-- Write out APS frame size markers. The different ROI regions are notified separately.
				-- One size result is split into two, to support sizes up to 16 bits per side.
				-- This event is always delivered, like Start/End events!
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_APS_ROISIZE_1 & std_logic_vector(resize(D4AAPSADCConfigReg_D.EndColumn0_D, 16)(7 downto 0));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stROI0InfoEndRow1;
				end if;

			when stROI0InfoEndRow1 =>
				-- Write out APS frame size markers. The different ROI regions are notified separately.
				-- One size result is split into two, to support sizes up to 16 bits per side.
				-- This event is always delivered, like Start/End events!
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_APS_ROISIZE_0 & std_logic_vector(resize(D4AAPSADCConfigReg_D.EndRow0_D, 16)(15 downto 8));

					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stROI0InfoEndRow2;
				end if;

			when stROI0InfoEndRow2 =>
				-- Write out APS frame size markers. The different ROI regions are notified separately.
				-- One size result is split into two, to support sizes up to 16 bits per side.
				-- This event is always delivered, like Start/End events!
				if not OutFifoControl_SI.AlmostFull_S then
					OutFifoDataRegCol_D <= EVENT_CODE_MISC_DATA8 & EVENT_CODE_MISC_DATA8_APS_ROISIZE_1 & std_logic_vector(resize(D4AAPSADCConfigReg_D.EndRow0_D, 16)(7 downto 0));

					OutFifoWriteRegCol_S <= '1';

					if D4AAPSADCConfigReg_D.GlobalShutter_S then
						ColState_DN <= stGSIdle;
					else
						ColState_DN <= stRSIdle;
					end if;
				end if;

			when stRSIdle =>
				-- Set all signals to default for RS.
				APSChipResetReg_SN         <= '1';
				APSChipTXGateReg_SN        <= '0';
				APSChipOverflowGateReg_SN  <= '0';
				APSChipGlobalShutterReg_SN <= '0';

				ColState_DN <= stRSReadoutFeedOne1;

			when stRSReadoutFeedOne1 =>
				-- RS uses 111 pattern first. Shift register is at all zeros at startup.
				-- So shift in three 1s first. Then we start with the first column.
				APSChipColSRInReg_S    <= '1';
				APSChipColSRClockReg_C <= '0';

				ClockSlowDownCount_S <= '1';

				if ClockSlowDownDone_S then
					ColState_DN <= stRSReadoutFeedOne1Tick;
				end if;

			when stRSReadoutFeedOne1Tick =>
				-- Tick 1.
				APSChipColSRInReg_S    <= '1';
				APSChipColSRClockReg_C <= '1';

				ClockSlowDownCount_S <= '1';

				if ClockSlowDownDone_S then
					ColState_DN <= stRSReadoutFeedOne2;
				end if;

			when stRSReadoutFeedOne2 =>
				-- Feed 1.
				APSChipColSRInReg_S    <= '1';
				APSChipColSRClockReg_C <= '0';

				ClockSlowDownCount_S <= '1';

				if ClockSlowDownDone_S then
					ColState_DN <= stRSReadoutFeedOne2Tick;
				end if;

			when stRSReadoutFeedOne2Tick =>
				-- Tick 1.
				APSChipColSRInReg_S    <= '1';
				APSChipColSRClockReg_C <= '1';

				ClockSlowDownCount_S <= '1';

				if ClockSlowDownDone_S then
					ColState_DN <= stRSReadoutFeedOne3;
				end if;

			when stRSReadoutFeedOne3 =>
				-- Feed 1.
				APSChipColSRInReg_S    <= '1';
				APSChipColSRClockReg_C <= '0';

				ClockSlowDownCount_S <= '1';

				if ClockSlowDownDone_S then
					ColState_DN <= stRSReadoutFeedOne3Tick;
				end if;

			when stRSReadoutFeedOne3Tick =>
				-- Tick 1.
				APSChipColSRInReg_S    <= '1';
				APSChipColSRClockReg_C <= '1';

				ClockSlowDownCount_S <= '1';

				if ClockSlowDownDone_S then
					ColState_DN <= stRSFDSettle;
				end if;

			when stRSFDSettle =>
				RSFDSettleTimeCount_S <= '1';

				if RSFDSettleTimeDone_S then
					ColState_DN <= stRSSample1Start;
				end if;

			when stRSSample1Start =>
				APSChipResetReg_SN <= '0'; -- Turn off reset.

				RowReadStart_SN <= '1';

				ColState_DN <= stRSSample1Done;

			when stRSSample1Done =>
				if ReadBSRStatus_DP /= RBSTAT_NORMAL or CurrentColumnValid_S = '0' then
					APSSampleTypeReg_DN <= SAMPLETYPE_NULL;
					TimingRead_DN       <= SAMPLETYPE_FDRESET;
				else
					APSSampleTypeReg_DN <= SAMPLETYPE_FDRESET;
				end if;

				if not RowReadInProgress_SP then
					ColState_DN <= stRSChargeTransfer;
				end if;

			when stRSChargeTransfer =>
				APSChipTXGateReg_SN <= '1';

				TransferTimeCount_S <= '1';

				if TransferTimeDone_S then
					ColState_DN <= stRSSample2Start;
				end if;

			when stRSSample2Start =>
				APSChipTXGateReg_SN <= '0'; -- Turn off again.

				RowReadStart_SN <= '1';

				ColState_DN <= stRSSample2Done;

				if ReadBSRStatus_DP = RBSTAT_NEED_ZERO_ONE then
					ExposureClear_S <= '1';

					ColState_DN <= stRSStartExposureEvent;
				end if;

			when stRSStartExposureEvent =>
				if not OutFifoControl_SI.AlmostFull_S and not OutFifoWriteRegRow_S then
					OutFifoDataRegCol_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_STARTEXPOSURE;
					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stRSSample2Done;
				end if;

			when stRSSample2Done =>
				if ReadBSRStatus_DP /= RBSTAT_NORMAL or CurrentColumnValid_S = '0' then
					APSSampleTypeReg_DN <= SAMPLETYPE_NULL;
					TimingRead_DN       <= SAMPLETYPE_SIGNAL;
				else
					APSSampleTypeReg_DN <= SAMPLETYPE_SIGNAL;
				end if;

				if not RowReadInProgress_SP then
					APSChipResetReg_SN <= '1';

					-- If exposure time hasn't expired or we haven't yet even shifted in one
					-- 0 into the column SR, we first do that.
					if ExposureDone_S = '1' and ReadBSRStatus_DP /= RBSTAT_NEED_ZERO_ONE then
						if ReadBSRStatus_DP = RBSTAT_NEED_ONE then
							-- If the 1 that represents the read hasn't yet been shifted
							-- in, do so now.
							ColState_DN      <= stRSReadoutFeedOne3;
							ReadBSRStatus_DN <= RBSTAT_NEED_ZERO_TWO;
						elsif ReadBSRStatus_DP = RBSTAT_NEED_ZERO_TWO then
							-- Shift in the second 0 (the one after the 1) that is needed
							-- for a read of the very first column to work.
							ColState_DN      <= stRSEndExposureEvent;
							ReadBSRStatus_DN <= RBSTAT_NORMAL;
						else
							-- Finally, reads are happening, their position is increasing.
							ColState_DN             <= stRSFeed;
							ColumnReadPositionInc_S <= '1';
						end if;
					else
						-- Just shift in a zero.
						ColState_DN <= stRSFeed;
					end if;
				end if;

			when stRSEndExposureEvent =>
				if not OutFifoControl_SI.AlmostFull_S and not OutFifoWriteRegRow_S then
					OutFifoDataRegCol_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_ENDEXPOSURE;
					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stRSFeed;
				end if;

			when stRSFeed =>
				APSChipColSRInReg_S    <= '0';
				APSChipColSRClockReg_C <= '0';

				ColState_DN <= stRSFeedTick;

			when stRSFeedTick =>
				APSChipColSRInReg_S    <= '0';
				APSChipColSRClockReg_C <= '1';

				-- A first zero has just been shifted in.
				if ReadBSRStatus_DP = RBSTAT_NEED_ZERO_ONE then
					ReadBSRStatus_DN <= RBSTAT_NEED_ONE;
				end if;

				-- Check if we're done (reads ended).
				if ColumnReadPosition_D = CHIP_APS_SIZE_COLUMNS then
					ColState_DN <= stEndFrame;

					-- Reset ReadB status to initial (need at least a zero), for next frame.
					ReadBSRStatus_DN <= RBSTAT_NEED_ZERO_ONE;
				else
					ColState_DN <= stRSFDSettle;
				end if;

			when stGSIdle =>
				-- Set all signals to default for GS.
				APSChipResetReg_SN         <= '1';
				APSChipTXGateReg_SN        <= '0';
				APSChipOverflowGateReg_SN  <= '1';
				APSChipGlobalShutterReg_SN <= '1';

				ColState_DN <= stGSPDReset;

			when stGSPDReset =>
				GSPDResetTimeCount_S <= '1';

				if GSPDResetTimeDone_S then
					ExposureClear_S <= '1';

					ColState_DN <= stGSStartExposureEvent;
				end if;

			when stGSStartExposureEvent =>
				if not OutFifoControl_SI.AlmostFull_S and not OutFifoWriteRegRow_S then
					OutFifoDataRegCol_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_STARTEXPOSURE;
					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stGSExposureStart;
				end if;

			when stGSExposureStart =>
				APSChipOverflowGateReg_SN <= '0';

				if ExposureDone_S then
					ColState_DN <= stGSEndExposureEvent;
				end if;

			when stGSEndExposureEvent =>
				if not OutFifoControl_SI.AlmostFull_S and not OutFifoWriteRegRow_S then
					OutFifoDataRegCol_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_ENDEXPOSURE;
					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stGSResetFallTime;
				end if;

			when stGSResetFallTime =>
				APSChipResetReg_SN <= '0';

				GSResetFallTimeCount_S <= '1';

				if GSResetFallTimeDone_S then
					ColState_DN <= stGSChargeTransfer;
				end if;

			when stGSChargeTransfer =>
				APSChipTXGateReg_SN <= '1';

				TransferTimeCount_S <= '1';

				if TransferTimeDone_S then
					ColState_DN <= stGSExposureEnd;
				end if;

			when stGSExposureEnd =>
				APSChipTXGateReg_SN <= '0';

				GSTXFallTimeCount_S <= '1';

				if GSTXFallTimeDone_S then
					ColState_DN <= stGSSwitchToReadout1;
				end if;

			when stGSSwitchToReadout1 =>
				APSChipOverflowGateReg_SN <= '1';

				ColState_DN <= stGSSwitchToReadout2;

			when stGSSwitchToReadout2 =>
				-- Delay by one more cycle.
				ColState_DN <= stGSReadoutFeedOne;

			when stGSReadoutFeedOne =>
				-- GS turned off from here on.
				APSChipGlobalShutterReg_SN <= '0';

				-- GS uses 010 pattern. Shift register is at all zeros at startup.
				-- So we first shift in a 1, and then a 0. Then we start with the first column.
				APSChipColSRInReg_S    <= '1';
				APSChipColSRClockReg_C <= '0';

				ClockSlowDownCount_S <= '1';

				if ClockSlowDownDone_S then
					ColState_DN <= stGSReadoutFeedOneTick;
				end if;

			when stGSReadoutFeedOneTick =>
				-- Tick 1.
				APSChipColSRInReg_S    <= '1';
				APSChipColSRClockReg_C <= '1';

				ClockSlowDownCount_S <= '1';

				if ClockSlowDownDone_S then
					ColState_DN <= stGSReadoutFeedZero;
				end if;

			when stGSReadoutFeedZero =>
				-- Feed 0.
				APSChipColSRInReg_S    <= '0';
				APSChipColSRClockReg_C <= '0';

				ColState_DN <= stGSReadoutFeedZeroTick;

			when stGSReadoutFeedZeroTick =>
				-- Tick 0.
				APSChipColSRInReg_S    <= '0';
				APSChipColSRClockReg_C <= '1';

				if ColumnReadPosition_D = CHIP_APS_SIZE_COLUMNS then
					-- Done with reads.
					ColState_DN <= stEndFrame;
				else
					ColState_DN <= stGSSample1Start;
				end if;

			when stGSSample1Start =>
				if CurrentColumnValid_S then
					RowReadStart_SN <= '1';

					ColState_DN <= stGSSample1Done;
				else
					-- Jump ahead to next column.
					ColumnReadPositionInc_S <= '1';

					ColState_DN <= stGSReadoutFeedZero;
				end if;

			when stGSSample1Done =>
				APSSampleTypeReg_DN <= SAMPLETYPE_SIGNAL;

				if not RowReadInProgress_SP then
					ColState_DN <= stGSFDReset;
				end if;

			when stGSFDReset =>
				APSChipResetReg_SN <= '1';

				GSFDResetTimeCount_S <= '1';

				if GSFDResetTimeDone_S then
					ColState_DN <= stGSSample2Start;
				end if;

			when stGSSample2Start =>
				APSChipResetReg_SN <= '0'; -- Turn off again.

				RowReadStart_SN <= '1';

				ColState_DN <= stGSSample2Done;

			when stGSSample2Done =>
				APSSampleTypeReg_DN <= SAMPLETYPE_FDRESET;

				if not RowReadInProgress_SP then
					-- Increase column count, now that we're done with last read.
					ColumnReadPositionInc_S <= '1';

					ColState_DN <= stGSReadoutFeedZero;
				end if;

			when stEndFrame =>
				-- Zero column counters too.
				ColumnReadPositionZero_S <= '1';

				-- Write out end of frame marker. This and the start of frame marker are the only
				-- two events from this SM that always have to be committed and are never dropped.
				if not OutFifoControl_SI.AlmostFull_S and RowReadsAllDone_S then
					OutFifoDataRegCol_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_ENDFRAME;
					OutFifoWriteRegCol_S <= '1';

					ColState_DN <= stWaitFrameInterval;
				end if;

			when stWaitFrameInterval =>
				-- Wait until enough time has passed between frames.
				if FrameIntervalDone_S then
					ColState_DN <= stIdle;

					-- Ensure config reg is up-to-date when entering Idle state.
					D4AAPSADCConfigRegEnable_S <= '1';
				end if;

			when others => null;
		end case;
	end process columnMainStateMachine;

	-- Region of Interest 0 is always present, as it is the default frame.
	-- Here we define all regions of interest so that the signals are always defined,
	-- but ROI Regions 1/2/3 will not be used if QUAD_ROI is disabled.
	axesNormal : if CHIP_APS_AXES_INVERT = AXES_KEEP generate
	begin
		ROI0StartColumn_D <= resize(D4AAPSADCConfigReg_D.StartColumn0_D, 16);
		ROI0StartRow_D    <= resize(D4AAPSADCConfigReg_D.StartRow0_D, 16);
		ROI0EndColumn_D   <= resize(D4AAPSADCConfigReg_D.EndColumn0_D, 16);
		ROI0EndRow_D      <= resize(D4AAPSADCConfigReg_D.EndRow0_D, 16);
	end generate axesNormal;

	axesInverted : if CHIP_APS_AXES_INVERT = AXES_INVERT generate
	begin
		ROI0StartColumn_D <= resize(D4AAPSADCConfigReg_D.StartRow0_D, 16);
		ROI0StartRow_D    <= resize(D4AAPSADCConfigReg_D.StartColumn0_D, 16);
		ROI0EndColumn_D   <= resize(D4AAPSADCConfigReg_D.EndRow0_D, 16);
		ROI0EndRow_D      <= resize(D4AAPSADCConfigReg_D.EndColumn0_D, 16);
	end generate axesInverted;

	-- Concurrently calculate if the current column or row has to be read out or not.
	-- If not (like with ROI), we can just fast jump past it.
	apsColumnROI : if CHIP_APS_STREAM_START(1) = '0' generate
	begin
		CurrentColumnValid_S <= '1' when (ColumnReadPosition_D >= ROI0StartColumn_D and ColumnReadPosition_D <= ROI0EndColumn_D) else '0';
	end generate apsColumnROI;

	apsColumnROIInverted : if CHIP_APS_STREAM_START(1) = '1' generate
		signal StartColumn0Inverted_S : unsigned(15 downto 0);
		signal EndColumn0Inverted_S   : unsigned(15 downto 0);
	begin
		StartColumn0Inverted_S <= resize(CHIP_APS_SIZE_COLUMNS - 1, 16) - ROI0StartColumn_D;
		EndColumn0Inverted_S   <= resize(CHIP_APS_SIZE_COLUMNS - 1, 16) - ROI0EndColumn_D;

		CurrentColumnValid_S <= '1' when (ColumnReadPosition_D >= EndColumn0Inverted_S and ColumnReadPosition_D <= StartColumn0Inverted_S) else '0';
	end generate apsColumnROIInverted;

	apsRowROI : if CHIP_APS_STREAM_START(0) = '0' generate
	begin
		CurrentRowValid_S <= '1' when (ROIRowReadPosition_D >= ROI0StartRow_D and ROIRowReadPosition_D <= ROI0EndRow_D) else '0';
	end generate apsRowROI;

	apsRowROIInverted : if CHIP_APS_STREAM_START(0) = '1' generate
		signal StartRow0Inverted_S : unsigned(15 downto 0);
		signal EndRow0Inverted_S   : unsigned(15 downto 0);
	begin
		StartRow0Inverted_S <= resize(CHIP_APS_SIZE_ROWS - 1, 16) - ROI0StartRow_D;
		EndRow0Inverted_S   <= resize(CHIP_APS_SIZE_ROWS - 1, 16) - ROI0EndRow_D;

		CurrentRowValid_S <= '1' when (ROIRowReadPosition_D >= EndRow0Inverted_S and ROIRowReadPosition_D <= StartRow0Inverted_S) else '0';
	end generate apsRowROIInverted;

	-- Special counter for ROI position, follows ADC ordering.
	roiSpecialRowReadPosition : process(Clock_CI, Reset_RI) is
	begin
		if Reset_RI then
			ROIRowReadPosition_D  <= (others => '0');
			ROIRowReadDirection_S <= '0';
		elsif rising_edge(Clock_CI) then
			if ROIRowReadPositionZero_S then
				ROIRowReadPosition_D  <= (others => '0');
				ROIRowReadDirection_S <= '0';
			elsif ROIRowReadPositionInc_S then
				if not ROIRowReadDirection_S then
					-- Increasing, first even pass.
					ROIRowReadPosition_D <= ROIRowReadPosition_D + 2;
				else
					-- Decreasing, second odd pass.
					ROIRowReadPosition_D <= ROIRowReadPosition_D - 2;
				end if;

				-- Switch direction once end of first pass is reached.
				if ROIRowReadPosition_D = (CHIP_APS_SIZE_ROWS - 2) then
					ROIRowReadPosition_D  <= (CHIP_APS_SIZE_ROWS - 1);
					ROIRowReadDirection_S <= '1';
				end if;
			else
				ROIRowReadPosition_D  <= ROIRowReadPosition_D;
				ROIRowReadDirection_S <= ROIRowReadDirection_S;
			end if;
		end if;
	end process roiSpecialRowReadPosition;

	-- Signal when all row-reads are done and we can send EOF.
	-- For pipelined ADC, this needs to make sure all three phases are completed.
	RowReadsAllDone_S <= not RowReadInProgress_SP and not RampInProgress_SP and not ScanInProgress_SP;

	rampTickCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_ADC_BUS_WIDTH)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => RampTickCount_S,
			DataLimit_DI => to_unsigned(1021, APS_ADC_BUS_WIDTH),
			Overflow_SO  => RampTickDone_S,
			Data_DO      => open);

	sampleSettleTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_SAMPLESETTLETIME_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => SampleSettleTimeCount_S,
			DataLimit_DI => to_unsigned(APS_SAMPLESETTLETIME, APS_SAMPLESETTLETIME_SIZE),
			Overflow_SO  => SampleSettleTimeDone_S,
			Data_DO      => open);

	rampResetTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_RAMPRESETTIME_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => RampResetTimeCount_S,
			DataLimit_DI => to_unsigned(APS_RAMPRESETTIME, APS_RAMPRESETTIME_SIZE),
			Overflow_SO  => RampResetTimeDone_S,
			Data_DO      => open);

	rowSettleTimeCounter : entity work.ContinuousCounter
		generic map(
			SIZE => APS_ROWSETTLETIME_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => '0',
			Enable_SI    => RowSettleTimeCount_S,
			DataLimit_DI => to_unsigned(APS_ROWSETTLETIME, APS_ROWSETTLETIME_SIZE),
			Overflow_SO  => RowSettleTimeDone_S,
			Data_DO      => open);

	rowReadPosition : entity work.ContinuousCounter
		generic map(
			SIZE              => CHIP_APS_SIZE_ROWS'length,
			RESET_ON_OVERFLOW => false,
			GENERATE_OVERFLOW => false)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => RowReadPositionZero_S,
			Enable_SI    => RowReadPositionInc_S,
			DataLimit_DI => CHIP_APS_SIZE_ROWS,
			Overflow_SO  => open,
			Data_DO      => RowReadPosition_D);

	chipADCRowReadoutSampleStateMachine : process(ChipRowSampleState_DP, RowSettleTimeDone_S, RampInProgress_SP, RowReadInProgress_SP, SampleSettleTimeDone_S, APSSampleTypeRegSample_DP, APSSampleTypeReg_DP, TimingReadSample_DP, TimingRead_DP)
	begin
		ChipRowSampleState_DN <= ChipRowSampleState_DP;

		-- Settle times counters.
		RowSettleTimeCount_S    <= '0';
		SampleSettleTimeCount_S <= '0';

		-- Column SM communication.
		RowReadDone_SN <= '0';

		-- Ramp SM communication.
		RampStart_SN <= '0';

		-- Keep track of current readout type.
		APSSampleTypeRegSample_DN <= APSSampleTypeRegSample_DP;
		TimingReadSample_DN       <= TimingReadSample_DP;

		-- On-chip ADC.
		ChipADCSampleReg_S <= '0';

		case ChipRowSampleState_DP is
			when stIdle =>
				-- Wait until the main column state machine signals us to do a row read.
				if RowReadInProgress_SP then
					ChipRowSampleState_DN <= stCaptureColMode;
				end if;

			when stCaptureColMode =>
				-- Update the readout type register, which is used to pass this value down to the other SMs.
				-- This is done here because APSSampleTypeReg_DP is not yet set in stIdle above.
				APSSampleTypeRegSample_DN <= APSSampleTypeReg_DP;
				TimingReadSample_DN       <= TimingRead_DP;

				ChipRowSampleState_DN <= stRowSettleWait;

			when stRowSettleWait =>
				-- Additional wait for the row selection to be valid.
				if RowSettleTimeDone_S then
					ChipRowSampleState_DN <= stRowSampleWait;
				end if;

				RowSettleTimeCount_S <= '1';

			when stRowSampleWait =>
				-- Wait for old ramp to be finished before sampling the new value.
				if not RampInProgress_SP then
					ChipRowSampleState_DN <= stRowSample;
				end if;

			when stRowSample =>
				-- Do sample now!
				ChipADCSampleReg_S <= '1';

				if SampleSettleTimeDone_S then
					ChipRowSampleState_DN <= stDone;
				end if;

				SampleSettleTimeCount_S <= '1';

			when stDone =>
				ChipRowSampleState_DN <= stIdle;

				-- Notify main SM that we're done with sampling. It can proceed
				-- to select the next column.
				RowReadDone_SN <= '1';

				-- Also, ramp can start. We know there is none in progress since we
				-- checked in stIdle at the start. The two are mutually exclusive.
				RampStart_SN <= '1';

			when others => null;
		end case;
	end process chipADCRowReadoutSampleStateMachine;

	chipADCRowReadoutRampStateMachine : process(ChipRowRampState_DP, RampInProgress_SP, RampResetTimeDone_S, RampTickDone_S, ScanInProgress_SP, APSSampleTypeRegRamp_DP, APSSampleTypeRegSample_DP, TimingReadRamp_DP, TimingReadSample_DP)
	begin
		ChipRowRampState_DN <= ChipRowRampState_DP;

		-- ADC clock counter.
		RampTickCount_S <= '0';

		-- Settle times counters.
		RampResetTimeCount_S <= '0';

		-- Ramp SM communication.
		RampDone_SN <= '0';

		-- Scan SM communication.
		ScanStart_SN <= '0';

		-- Keep track of current readout type.
		APSSampleTypeRegRamp_DN <= APSSampleTypeRegRamp_DP;
		TimingReadRamp_DN       <= TimingReadRamp_DP;

		-- On-chip ADC.
		ChipADCRampClearReg_S   <= '1'; -- Clear ramp by default.
		ChipADCRampClockReg_C   <= '0';
		ChipADCRampBitInReg_S   <= '0';
		ChipADCScanClockReg1_C  <= '0';
		ChipADCScanControlReg_S <= SCAN_CONTROL_SCAN_THROUGH; -- Scan by default.
		-- Scan control is done here, because once a ramp is done, we can't do the next one
		-- until the values are copied to the scan registers, and the previous scan also has
		-- to be finished before we do that, or we'd destroy the values it's reading out.
		-- So we do those checks here, as well as the copy control.

		case ChipRowRampState_DP is
			when stIdle =>
				-- Wait until the sample state machine signals us to start the ramp.
				if RampInProgress_SP then
					ChipRowRampState_DN <= stRowRampFeed;

					-- Update the readout type register, which is used to pass this value down to the other SMs.
					APSSampleTypeRegRamp_DN <= APSSampleTypeRegSample_DP;
					TimingReadRamp_DN       <= TimingReadSample_DP;
				end if;

			when stRowRampFeed =>
				-- Do not clear Ramp while in use!
				ChipADCRampClearReg_S <= '0';

				ChipADCRampClockReg_C <= '0'; -- Set BitIn one cycle before to ensure the value is stable.
				ChipADCRampBitInReg_S <= '1';

				ChipRowRampState_DN <= stRowRampFeedTick;

			when stRowRampFeedTick =>
				-- Do not clear Ramp while in use!
				ChipADCRampClearReg_S <= '0';

				ChipADCRampClockReg_C <= '1';
				ChipADCRampBitInReg_S <= '1';

				ChipRowRampState_DN <= stRowRampResetSettle;

			when stRowRampResetSettle =>
				-- Do not clear Ramp while in use!
				ChipADCRampClearReg_S <= '0';

				if RampResetTimeDone_S then
					ChipRowRampState_DN <= stRowRampClockLow;
				end if;

				RampResetTimeCount_S <= '1';

			when stRowRampClockLow =>
				ChipADCRampClockReg_C <= '0';

				-- Do not clear Ramp while in use!
				ChipADCRampClearReg_S <= '0';

				ChipRowRampState_DN <= stRowRampClockHigh;

			when stRowRampClockHigh =>
				ChipADCRampClockReg_C <= '1';

				-- Do not clear Ramp while in use!
				ChipADCRampClearReg_S <= '0';

				-- Increase counter and stop ramping when maximum reached.
				RampTickCount_S <= '1';

				if RampTickDone_S then
					ChipRowRampState_DN <= stRowScanWait;
				else
					ChipRowRampState_DN <= stRowRampClockLow;
				end if;

			when stRowScanWait =>
				-- Do not clear Ramp while in use!
				ChipADCRampClearReg_S <= '0';

				-- Wait for old scan to be finished before copying over the new value.
				if not ScanInProgress_SP then
					ChipRowRampState_DN <= stRowScanSelect;
				end if;

			when stRowScanSelect =>
				-- Do not clear Ramp while in use!
				ChipADCRampClearReg_S <= '0';

				ChipADCScanClockReg1_C  <= '0';
				ChipADCScanControlReg_S <= SCAN_CONTROL_COPY_OVER;

				ChipRowRampState_DN <= stRowScanSelectTick;

			when stRowScanSelectTick =>
				-- Do not clear Ramp while in use!
				ChipADCRampClearReg_S <= '0';

				ChipADCScanClockReg1_C  <= '1';
				ChipADCScanControlReg_S <= SCAN_CONTROL_COPY_OVER;

				ChipRowRampState_DN <= stDone;

			when stDone =>
				ChipRowRampState_DN <= stIdle;

				-- Notify sample SM that we're done with the ramp. It can proceed
				-- to take the next sample.
				RampDone_SN <= '1';

				-- Also, scan can start, since we know the previous one already finished.
				ScanStart_SN <= '1';

			when others => null;
		end case;
	end process chipADCRowReadoutRampStateMachine;

	chipADCRowReadoutScanStateMachine : process(ChipRowScanState_DP, D4AAPSADCConfigReg_D, OutFifoControl_SI, ChipADCData_DI, RowReadPosition_D, CurrentRowValid_S, ScanInProgress_SP, APSSampleTypeRegRamp_DP, APSSampleTypeRegScan_DP)
	begin
		ChipRowScanState_DN <= ChipRowScanState_DP;

		OutFifoWriteRegRow_S <= '0';
		OutFifoDataRegRow_D  <= (others => '0');

		-- Row counters.
		RowReadPositionZero_S <= '0';
		RowReadPositionInc_S  <= '0';

		ROIRowReadPositionZero_S <= '0';
		ROIRowReadPositionInc_S  <= '0';

		-- Ramp SM communication.
		ScanDone_SN <= '0';

		-- Keep track of current readout type.
		APSSampleTypeRegScan_DN <= APSSampleTypeRegScan_DP;

		-- On-chip ADC.
		ChipADCScanClockReg2_C <= '0';

		case ChipRowScanState_DP is
			when stIdle =>
				-- Wait until the ramp state machine signals us to start the scan.
				if ScanInProgress_SP then
					ChipRowScanState_DN <= stRowStart;

					-- Update the readout type register, which is used to decide the type of events to output.
					APSSampleTypeRegScan_DN <= APSSampleTypeRegRamp_DP;
				end if;

			when stRowStart =>
				-- Write event only if FIFO has place, else wait.
				-- If fake read (SAMPLETYPE_NULL), don't write anything.
				if OutFifoControl_SI.AlmostFull_S = '0' and APSSampleTypeRegScan_DP /= SAMPLETYPE_NULL then
					if APSSampleTypeRegScan_DP = SAMPLETYPE_FDRESET then
						OutFifoDataRegRow_D <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_STARTRESETCOL;
					else
						OutFifoDataRegRow_D <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_STARTSIGNALCOL;
					end if;

					OutFifoWriteRegRow_S <= '1';
				end if;

				if OutFifoControl_SI.AlmostFull_S = '0' or APSSampleTypeRegScan_DP = SAMPLETYPE_NULL or D4AAPSADCConfigReg_D.WaitOnTransferStall_S = '0' then
					-- Same check as in stRowScanNextValue needed here.
					if CurrentRowValid_S then
						ChipRowScanState_DN <= stRowScanReadValue;
					else
						ChipRowScanState_DN <= stRowScanJumpValue;
					end if;
				end if;

			when stRowScanReadValue =>
				-- Write event only if FIFO has place, else wait.
				if OutFifoControl_SI.AlmostFull_S = '0' and APSSampleTypeRegScan_DP /= SAMPLETYPE_NULL then
					OutFifoDataRegRow_D(EVENT_WIDTH - 1 downto EVENT_WIDTH - 3) <= EVENT_CODE_ADC_SAMPLE;

					-- Convert from gray-code to binary. This uses a direct algorithm instead of using the previously stored binary
					-- value at each step. Lastly, the output is negated so that the range 0-1023 is properly inverted to be the same
					-- as for external ADC, where 0 represents lowest voltage and 1023 highest voltage.
					OutFifoDataRegRow_D(9) <= not (ChipADCData_DI(9));
					OutFifoDataRegRow_D(8) <= not (ChipADCData_DI(8) xor ChipADCData_DI(9));
					OutFifoDataRegRow_D(7) <= not (ChipADCData_DI(7) xor ChipADCData_DI(8) xor ChipADCData_DI(9));
					OutFifoDataRegRow_D(6) <= not (ChipADCData_DI(6) xor ChipADCData_DI(7) xor ChipADCData_DI(8) xor ChipADCData_DI(9));
					OutFifoDataRegRow_D(5) <= not (ChipADCData_DI(5) xor ChipADCData_DI(6) xor ChipADCData_DI(7) xor ChipADCData_DI(8) xor ChipADCData_DI(9));
					OutFifoDataRegRow_D(4) <= not (ChipADCData_DI(4) xor ChipADCData_DI(5) xor ChipADCData_DI(6) xor ChipADCData_DI(7) xor ChipADCData_DI(8) xor ChipADCData_DI(9));
					OutFifoDataRegRow_D(3) <= not (ChipADCData_DI(3) xor ChipADCData_DI(4) xor ChipADCData_DI(5) xor ChipADCData_DI(6) xor ChipADCData_DI(7) xor ChipADCData_DI(8) xor ChipADCData_DI(9));
					OutFifoDataRegRow_D(2) <= not (ChipADCData_DI(2) xor ChipADCData_DI(3) xor ChipADCData_DI(4) xor ChipADCData_DI(5) xor ChipADCData_DI(6) xor ChipADCData_DI(7) xor ChipADCData_DI(8) xor ChipADCData_DI(9));
					OutFifoDataRegRow_D(1) <= not (ChipADCData_DI(1) xor ChipADCData_DI(2) xor ChipADCData_DI(3) xor ChipADCData_DI(4) xor ChipADCData_DI(5) xor ChipADCData_DI(6) xor ChipADCData_DI(7) xor ChipADCData_DI(8) xor ChipADCData_DI(9));
					OutFifoDataRegRow_D(0) <= not (ChipADCData_DI(0) xor ChipADCData_DI(1) xor ChipADCData_DI(2) xor ChipADCData_DI(3) xor ChipADCData_DI(4) xor ChipADCData_DI(5) xor ChipADCData_DI(6) xor ChipADCData_DI(7) xor ChipADCData_DI(8) xor ChipADCData_DI(9));

					OutFifoWriteRegRow_S <= '1';
				end if;

				if OutFifoControl_SI.AlmostFull_S = '0' or APSSampleTypeRegScan_DP = SAMPLETYPE_NULL or D4AAPSADCConfigReg_D.WaitOnTransferStall_S = '0' then
					ChipRowScanState_DN     <= stRowScanNextValue;
					RowReadPositionInc_S    <= '1';
					ROIRowReadPositionInc_S <= '1';
				end if;

			when stRowScanJumpValue =>
				ChipRowScanState_DN     <= stRowScanNextValue;
				RowReadPositionInc_S    <= '1';
				ROIRowReadPositionInc_S <= '1';

			when stRowScanNextValue =>
				ChipADCScanClockReg2_C <= '1';

				-- Check if we're done. The row read position is at the
				-- maximum, so we can detect that, zero it and exit.
				if RowReadPosition_D = CHIP_APS_SIZE_ROWS then
					ChipRowScanState_DN      <= stRowDone;
					RowReadPositionZero_S    <= '1';
					ROIRowReadPositionZero_S <= '1';
				else
					if CurrentRowValid_S then
						ChipRowScanState_DN <= stRowScanReadValue;
					else
						ChipRowScanState_DN <= stRowScanJumpValue;
					end if;
				end if;

			when stRowDone =>
				-- Write event only if FIFO has place, else wait.
				if OutFifoControl_SI.AlmostFull_S = '0' and APSSampleTypeRegScan_DP /= SAMPLETYPE_NULL then
					OutFifoDataRegRow_D  <= EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_APS_ENDCOL;
					OutFifoWriteRegRow_S <= '1';
				end if;

				if OutFifoControl_SI.AlmostFull_S = '0' or APSSampleTypeRegScan_DP = SAMPLETYPE_NULL or D4AAPSADCConfigReg_D.WaitOnTransferStall_S = '0' then
					ChipRowScanState_DN <= stIdle;

					-- Notify ramp SM that we're done with the scan. It can proceed
					-- with the next ramp.
					ScanDone_SN <= '1';
				end if;

			when others => null;
		end case;
	end process chipADCRowReadoutScanStateMachine;

	chipADCRegisterUpdate : process(Clock_CI, Reset_RI) is
	begin
		if Reset_RI then
			ChipRowSampleState_DP <= stIdle;
			ChipRowRampState_DP   <= stIdle;
			ChipRowScanState_DP   <= stIdle;

			RampInProgress_SP <= '0';
			ScanInProgress_SP <= '0';

			APSSampleTypeRegSample_DP <= SAMPLETYPE_NULL;
			APSSampleTypeRegRamp_DP   <= SAMPLETYPE_NULL;
			APSSampleTypeRegScan_DP   <= SAMPLETYPE_NULL;

			TimingReadSample_DP <= SAMPLETYPE_NULL;
			TimingReadRamp_DP   <= SAMPLETYPE_NULL;

			ChipADCRampClear_SO   <= '1'; -- Clear ramp by default.
			ChipADCRampClock_CO   <= '0';
			ChipADCRampBitIn_SO   <= '0';
			ChipADCScanClock_CO   <= '0';
			ChipADCScanControl_SO <= SCAN_CONTROL_SCAN_THROUGH;
			ChipADCSample_SO      <= '0';
		elsif rising_edge(Clock_CI) then
			ChipRowSampleState_DP <= ChipRowSampleState_DN;
			ChipRowRampState_DP   <= ChipRowRampState_DN;
			ChipRowScanState_DP   <= ChipRowScanState_DN;

			RampInProgress_SP <= RampInProgress_SP xor (RampStart_SN or RampDone_SN);
			ScanInProgress_SP <= ScanInProgress_SP xor (ScanStart_SN or ScanDone_SN);

			APSSampleTypeRegSample_DP <= APSSampleTypeRegSample_DN;
			APSSampleTypeRegRamp_DP   <= APSSampleTypeRegRamp_DN;
			APSSampleTypeRegScan_DP   <= APSSampleTypeRegScan_DN;

			TimingReadSample_DP <= TimingReadSample_DN;
			TimingReadRamp_DP   <= TimingReadRamp_DN;

			ChipADCRampClear_SO   <= ChipADCRampClearReg_S;
			ChipADCRampClock_CO   <= ChipADCRampClockReg_C;
			ChipADCRampBitIn_SO   <= ChipADCRampBitInReg_S;
			ChipADCScanClock_CO   <= ChipADCScanClockReg1_C or ChipADCScanClockReg2_C;
			ChipADCScanControl_SO <= ChipADCScanControlReg_S;
			ChipADCSample_SO      <= ChipADCSampleReg_S;
		end if;
	end process chipADCRegisterUpdate;

	-- FIFO output can be driven by both the column or the row state machines.
	-- Care must be taken to never have both at the same time output meaningful data.
	OutFifoWriteReg_S <= OutFifoWriteRegCol_S or OutFifoWriteRegRow_S;
	OutFifoDataReg_D  <= OutFifoDataRegCol_D or OutFifoDataRegRow_D;

	outputDataRegister : entity work.SimpleRegister
		generic map(
			SIZE => EVENT_WIDTH)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => OutFifoWriteReg_S,
			Input_SI  => OutFifoDataReg_D,
			Output_SO => OutFifoData_DO);

	-- Change state on clock edge (synchronous).
	registerUpdate : process(Clock_CI, Reset_RI)
	begin
		if Reset_RI then                -- asynchronous reset (active-high for FPGAs)
			ColState_DP <= stIdle;

			RowReadInProgress_SP <= '0';

			ReadBSRStatus_DP    <= RBSTAT_NEED_ZERO_ONE;
			APSSampleTypeReg_DP <= SAMPLETYPE_NULL;
			TimingRead_DP       <= SAMPLETYPE_NULL;

			OutFifoControl_SO.Write_S <= '0';

			APSChipRowSRClock_CO <= '0';
			APSChipRowSRIn_SO    <= '0';

			APSChipOverflowGateReg_SP  <= '1';
			APSChipTXGateReg_SP        <= '0';
			APSChipResetReg_SP         <= '1';
			APSChipGlobalShutterReg_SP <= '1';

			-- APS ADC config from another clock domain.
			D4AAPSADCConfigReg_D     <= tD4AAPSADCConfigDefault;
			D4AAPSADCConfigSyncReg_D <= tD4AAPSADCConfigDefault;
		elsif rising_edge(Clock_CI) then
			ColState_DP <= ColState_DN;

			RowReadInProgress_SP <= RowReadInProgress_SP xor (RowReadStart_SN or RowReadDone_SN);

			ReadBSRStatus_DP    <= ReadBSRStatus_DN;
			APSSampleTypeReg_DP <= APSSampleTypeReg_DN;
			TimingRead_DP       <= TimingRead_DN;

			OutFifoControl_SO.Write_S <= OutFifoWriteReg_S;

			-- Invert Column and Row register outputs. The DAVIS RGB, like the other high resolution
			-- new chips, has the read-out inverted as if the chip was rotated by 90 degrees,
			-- resulting in a row-first readout, instead of column-first like the DAVIS240s.
			-- BUT with this rotation, unlike the other chips, it also aligned its internal nomenclature
			-- and renamed the signals accordingly. Since we use the legacy naming from DAVIS240 in the
			-- APS ADC state-machines, we have to invert it here.
			APSChipRowSRClock_CO <= APSChipColSRClockReg_C;
			APSChipRowSRIn_SO    <= APSChipColSRInReg_S;

			APSChipOverflowGateReg_SP  <= APSChipOverflowGateReg_SN;
			APSChipTXGateReg_SP        <= APSChipTXGateReg_SN;
			APSChipResetReg_SP         <= APSChipResetReg_SN;
			APSChipGlobalShutterReg_SP <= APSChipGlobalShutterReg_SN;

			-- APS ADC config from another clock domain.
			if D4AAPSADCConfigRegEnable_S then
				D4AAPSADCConfigReg_D <= D4AAPSADCConfigSyncReg_D;
			end if;
			D4AAPSADCConfigSyncReg_D <= D4AAPSADCConfig_DI;
		end if;
	end process registerUpdate;

	-- The output of this register goes to an intermediate signal, since we need to access it
	-- inside this module. That's not possible with 'out' signal directly.
	APSChipOverflowGate_SO   <= APSChipOverflowGateReg_SP;
	APSChipTXGate_SO         <= APSChipTXGateReg_SP;
	APSChipReset_SO          <= APSChipResetReg_SP;
	APSChipGlobalShutter_SBO <= not APSChipGlobalShutterReg_SP;
end architecture Behavioral;
