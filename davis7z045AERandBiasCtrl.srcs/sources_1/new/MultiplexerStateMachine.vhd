library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.EventCodes.all;
use work.FIFORecords.all;
use work.MultiplexerConfigRecords.all;

entity MultiplexerStateMachine is
	generic(
		ENABLE_STATISTICS : boolean := false);
	port(
		Clock_CI                    : in  std_logic;
		Reset_RI                    : in  std_logic;

		-- Multiple devices synchronization support.
		SyncInClock_CI              : in  std_logic;
		SyncOutClock_CO             : out std_logic;

		DeviceIsMaster_SO           : out std_logic;

		-- Fifo output (to USB)
		OutFifoControl_SI           : in  tFromFifoWriteSide;
		OutFifoControl_SO           : out tToFifoWriteSide;
		OutFifoData_DO              : out std_logic_vector(FULL_EVENT_WIDTH - 1 downto 0);

		-- Fifo input (from IMU)
		IMUFifoControl_SI           : in  tFromFifoReadSide;
		IMUFifoControl_SO           : out tToFifoReadSide;
		IMUFifoData_DI              : in  std_logic_vector(EVENT_WIDTH - 1 downto 0);
		IMUTimestamp_SI             : in  std_logic;

		-- Fifo input (from ExtInput)
		ExtInputFifoControl_SI      : in  tFromFifoReadSide;
		ExtInputFifoControl_SO      : out tToFifoReadSide;
		ExtInputFifoData_DI         : in  std_logic_vector(EVENT_WIDTH - 1 downto 0);
		ExtInputTimestamp_SI        : in  std_logic;

		-- Fifo input (from DVS)
		DVSFifoControl_SI           : in  tFromFifoReadSide;
		DVSFifoControl_SO           : out tToFifoReadSide;
		DVSFifoData_DI              : in  std_logic_vector(EVENT_WIDTH - 1 downto 0);
		DVSTimestamp_SI             : in  std_logic;

		-- Fifo input (from APS)
		APSFifoControl_SI           : in  tFromFifoReadSide;
		APSFifoControl_SO           : out tToFifoReadSide;
		APSFifoData_DI              : in  std_logic_vector(EVENT_WIDTH - 1 downto 0);
		APSTimestamp_SI             : in  std_logic;

		-- Configuration input and output
		MultiplexerConfig_DI        : in  tMultiplexerConfig;
		MultiplexerConfigInfoOut_DO : out tMultiplexerConfigInfoOut);
end MultiplexerStateMachine;

architecture Behavioral of MultiplexerStateMachine is
	attribute syn_enum_encoding : string;

	type tState is (stIdle, stTimestampReset, stTimestampWrap, stTimestamp, stPrepareIMU, stIMU, stPrepareExtInput, stExtInput, stPrepareDVS, stDVS, stPrepareAPS, stAPS, stDropData);
	attribute syn_enum_encoding of tState : type is "onehot";

	-- present and next state
	signal State_DP, State_DN                           : tState;
	signal StateTimestampNext_DP, StateTimestampNext_DN : tState;

	signal TimestampOverflow_S : std_logic;
	signal Timestamp_D         : unsigned(TIMESTAMP_WIDTH - 1 downto 0);

	-- Communication between TS synchronizer and generator.
	signal TimestampInc_S, TimestampReset_S : std_logic;

	-- Timestamp reset support. Either external (host) or internal (ovreflow counter overflow).
	signal TimestampResetExternalDetected_S : std_logic;
	signal TimestampResetBufferClear_S      : std_logic;
	signal TimestampResetBuffer_S           : std_logic;

	signal TimestampOverflowBufferClear_S    : std_logic;
	signal TimestampOverflowBufferOverflow_S : std_logic;
	signal TimestampOverflowBuffer_D         : unsigned(OVERFLOW_WIDTH - 1 downto 0);

	-- Buffer timestamp here so it's always in sync with the Overflow and Reset
	-- buffers, meaning delayed by one cycle.
	signal TimestampBuffer_D : unsigned(TIMESTAMP_WIDTH - 1 downto 0);

	signal TimestampChanged_S, TimestampSent_S : std_logic;

	-- Keep track if a timestamp of all 1s has been sent, to avoid doing it again.
	signal HighestTimestampSent_SP, HighestTimestampSent_SN : std_logic;

	-- Register configuration input and output.
	signal MultiplexerConfigReg_D : tMultiplexerConfig;

	-- Statistics support.
	signal StatisticsExtInputDropped_SP, StatisticsExtInputDropped_SN : std_logic;
	signal StatisticsDVSDropped_SP, StatisticsDVSDropped_SN           : std_logic;
	
    signal TimestampReset_SORTimestampOverflowBufferOverflow_S, NOTMultiplexerConfigReg_DRun_S : std_logic;
begin
	-- Use a PulseDetector to detect this, so that the pulse, however long it
	-- may be, gets reduced to one cycle at exit and only resets once.
	tsResetExternalDetector : entity work.PulseDetector
		generic map(
			SIZE => 2)
		port map(
			Clock_CI         => Clock_CI,
			Reset_RI         => Reset_RI,
			PulsePolarity_SI => '1',
			PulseLength_DI   => to_unsigned(2, 2),
			InputSignal_SI   => MultiplexerConfigReg_D.TimestampReset_S,
			PulseDetected_SO => TimestampResetExternalDetected_S);

	tsSynchronizer : entity work.TimestampSynchronizer
		port map(
			Clock_CI          => Clock_CI,
			Reset_RI          => Reset_RI,
			SyncInClock_CI    => SyncInClock_CI,
			SyncOutClock_CO   => SyncOutClock_CO,
			DeviceIsMaster_SO => DeviceIsMaster_SO,
			TimestampRun_SI   => MultiplexerConfigReg_D.TimestampRun_S,
			TimestampReset_SI => TimestampResetExternalDetected_S,
			TimestampInc_SO   => TimestampInc_S,
			TimestampReset_SO => TimestampReset_S);

	-- Generate the timestamp, as well as its overflow signal, which is
	-- asserted for 1 cycle whenever the timestamp jumps back to zero.
	-- Or, in other words, during the first cycle that the timestamp is
	-- zero, the overflow signal goes high.
	tsGenerator : entity work.ContinuousCounter
		generic map(
			SIZE             => TIMESTAMP_WIDTH,
			SHORT_OVERFLOW   => true,
			OVERFLOW_AT_ZERO => true)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => TimestampResetBufferClear_S,
			Enable_SI    => TimestampInc_S,
			DataLimit_DI => (others => '1'),
			Overflow_SO  => TimestampOverflow_S,
			Data_DO      => Timestamp_D);

    TimestampReset_SORTimestampOverflowBufferOverflow_S <= TimestampReset_S or TimestampOverflowBufferOverflow_S;
	tsResetBuffer : entity work.BufferClear
		port map(
			Clock_CI        => Clock_CI,
			Reset_RI        => Reset_RI,
			Clear_SI        => TimestampResetBufferClear_S,
			InputSignal_SI  => TimestampReset_SORTimestampOverflowBufferOverflow_S,
			OutputSignal_SO => TimestampResetBuffer_S);

	-- The overflow counter keeps track of wrap events. While there usually
	-- will only be one which will be then sent out right away via USB, it is
	-- theoretically possible for USB to stall and thus for the OutFifo to not
	-- be able to accept new events anymore. In that case we start dropping
	-- data events, but we can't drop wrap events, or the time on the device
	-- will then drift significantly from the time on the host when USB
	-- communication resumes. To avoid this, we keep a count of wrap events and
	-- ensure the wrap event, with it's count, is the first thing sent over
	-- when USB communication resumes (only a timestamp reset event has higher
	-- priority). If communication is down for a very long period of time, we
	-- reach the limit of this counter, and it overflows, at which point it
	-- becomes impossible to maintain any kind of meaningful correspondence
	-- between the device and host time. The only correct solution at this
	-- point is to force a timestamp reset event to be sent, so that both
	-- device and host re-synchronize on zero.
	tsOverflowBuffer : entity work.ContinuousCounter
		generic map(
			SIZE             => OVERFLOW_WIDTH,
			SHORT_OVERFLOW   => true,
			OVERFLOW_AT_ZERO => true)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => TimestampOverflowBufferClear_S,
			Enable_SI    => TimestampOverflow_S,
			DataLimit_DI => (others => '1'),
			Overflow_SO  => TimestampOverflowBufferOverflow_S,
			Data_DO      => TimestampOverflowBuffer_D);

	timestampChangeDetector : entity work.ChangeDetector
		generic map(
			SIZE => TIMESTAMP_WIDTH)
		port map(
			Clock_CI              => Clock_CI,
			Reset_RI              => Reset_RI,
			InputData_DI          => std_logic_vector(Timestamp_D),
			ChangeDetected_SO     => TimestampChanged_S,
			ChangeAcknowledged_SI => TimestampSent_S);

	p_memoryless : process(State_DP, StateTimestampNext_DP, TimestampResetBuffer_S, TimestampOverflowBuffer_D, TimestampBuffer_D, HighestTimestampSent_SP, TimestampChanged_S, OutFifoControl_SI, IMUFifoControl_SI, IMUFifoData_DI, ExtInputFifoControl_SI, ExtInputFifoData_DI, DVSFifoControl_SI, DVSFifoData_DI, APSFifoControl_SI, APSFifoData_DI, MultiplexerConfigReg_D, IMUTimestamp_SI, ExtInputTimestamp_SI, DVSTimestamp_SI, APSTimestamp_SI, TimestampOverflow_S)
	begin
		State_DN              <= State_DP; -- Keep current state by default.
		StateTimestampNext_DN <= stTimestamp;

		HighestTimestampSent_SN <= HighestTimestampSent_SP;

		TimestampResetBufferClear_S    <= '0';
		TimestampOverflowBufferClear_S <= '0';
		TimestampSent_S                <= '0';

		OutFifoControl_SO.Write_S <= '0';
		OutFifoData_DO            <= (others => '0');

		IMUFifoControl_SO.Read_S      <= '0';
		ExtInputFifoControl_SO.Read_S <= '0';
		DVSFifoControl_SO.Read_S      <= '0';
		APSFifoControl_SO.Read_S      <= '0';

		StatisticsExtInputDropped_SN <= '0';
		StatisticsDVSDropped_SN      <= '0';

		case State_DP is
			when stIdle =>
				-- Only exit idle state if logic is running.
				if MultiplexerConfigReg_D.Run_S = '1' then
					-- Now check various flags and see what data to forward.
					-- Timestamp-related flags have priority over data.
					if not OutFifoControl_SI.Full_S = '1' then
						if TimestampResetBuffer_S = '1' then
							State_DN <= stTimestampReset;
						elsif TimestampOverflowBuffer_D > 0 then
							State_DN <= stTimestampWrap;
						elsif not OutFifoControl_SI.AlmostFull_S = '1' then
							-- Use the AlmostEmpty flags as markers to see if
							-- there is lots of data in the FIFOs and
							-- prioritize emptying these over others.
							-- First check the AlmostEmpty flags, which are set
							-- to indicate a higher fullness level.
							if not IMUFifoControl_SI.Empty_S = '1' then
								State_DN <= stPrepareIMU;
							elsif not ExtInputFifoControl_SI.Empty_S = '1' then
								State_DN <= stPrepareExtInput;
							elsif not DVSFifoControl_SI.AlmostEmpty_S = '1' then
								State_DN <= stPrepareDVS;
							elsif not APSFifoControl_SI.AlmostEmpty_S = '1' then
								State_DN <= stPrepareAPS;
							elsif not DVSFifoControl_SI.Empty_S = '1' then
								State_DN <= stPrepareDVS;
							elsif not APSFifoControl_SI.Empty_S = '1' then
								State_DN <= stPrepareAPS;
							end if;
						else
							-- No space for an event and its timestamp, drop it.
							State_DN <= stDropData;
						end if;
					else
						-- No space for even timestamp flags, drop data to
						-- ensure flow continues.
						State_DN <= stDropData;
					end if;
				else
					-- If not running, just drain the FIFOs.
					IMUFifoControl_SO.Read_S      <= not IMUFifoControl_SI.Empty_S;
					ExtInputFifoControl_SO.Read_S <= not ExtInputFifoControl_SI.Empty_S;
					DVSFifoControl_SO.Read_S      <= not DVSFifoControl_SI.Empty_S;
					APSFifoControl_SO.Read_S      <= not APSFifoControl_SI.Empty_S;
				end if;

			when stTimestampReset =>
				-- Send timestamp reset (back to zero) event to host.
				OutFifoData_DO            <= EVENT_CODE_EVENT & EVENT_CODE_SPECIAL & EVENT_CODE_SPECIAL_TIMESTAMP_RESET;
				OutFifoControl_SO.Write_S <= '1';

				TimestampResetBufferClear_S    <= '1';
				-- Also clean overflow counter, since a timestamp reset event
				-- has higher priority and invalidates all previous time
				-- information by restarting from zero at this point.
				TimestampOverflowBufferClear_S <= '1';
				HighestTimestampSent_SN        <= '0';

				State_DN <= stIdle;

			when stTimestampWrap =>
				-- It can happen that while we're here wanting to send a timestamp overflow out,
				-- the tsGenerator actually generates another overflow. To not have this new
				-- overflow be lost (since resetting the counter would reset it to zero), we
				-- don't do anything, let the counter be updated normally, and then handle
				-- the new count as usual in stIdle. This is the least painful way to deal with
				-- this corner case, others (like sending out a VAL+1) suffer from problems
				-- themselves when the overflow counter is at its maximum.
				if not TimestampOverflow_S = '1' then
					-- Send timestamp wrap (add 15 bits) event to host.
					OutFifoData_DO            <= EVENT_CODE_EVENT & EVENT_CODE_TIMESTAMP_WRAP & std_logic_vector(TimestampOverflowBuffer_D);
					OutFifoControl_SO.Write_S <= '1';

					TimestampOverflowBufferClear_S <= '1';
					HighestTimestampSent_SN        <= '0';
				end if;

				State_DN <= stIdle;

			when stTimestamp =>
				if TimestampChanged_S = '1' then
					-- Timestamp changed from the last time we tried to send one, so
					-- this time we really send one and acknowledge the change.
					TimestampSent_S <= '1';

					-- Write a timestamp before the event it refers to.
					if TimestampOverflowBuffer_D > 0 and HighestTimestampSent_SP = '0' then
						-- The timestamp wrapped around! This means the current
						-- TimestampBuffer_D is zero. But since we're here, we didn't
						-- yet have time to handle this and send a TS_WRAP event.
						-- So we use a hard-coded timestamp of all ones, the
						-- biggest possible timestamp, right before a TS_WRAP
						-- event actually happens.
						OutFifoData_DO            <= (EVENT_CODE_TIMESTAMP, others => '1');
						OutFifoControl_SO.Write_S <= '1';
					elsif TimestampBuffer_D /= 0 then
						-- Use current timestamp.
						-- Ensure that no zero timestamps are ever sent. This further
						-- reduces traffic, as zero can always be inferred.
						-- This is also fine if a timestamp reset is pending, since
						-- in that case timestamps are still valid until the reset
						-- itself happens.
						OutFifoData_DO            <= EVENT_CODE_TIMESTAMP & std_logic_vector(TimestampBuffer_D);
						OutFifoControl_SO.Write_S <= '1';

						-- Check if the timestamp we're just sending is the highest possible one (all 1s).
						-- If it is, we keep that in mind, so that we can ensure it isn't sent a second
						-- time when the above case of "overflow while timestamping" happens. This way
						-- we can actually guarantee strict monotonicity of timestamps.
						if TimestampBuffer_D = (TimestampBuffer_D'range => '1') then
							HighestTimestampSent_SN <= '1';
						end if;
					end if;
				end if;

				State_DN <= StateTimestampNext_DP;

			when stPrepareIMU =>
				-- Decide if event needs to be timestamped.
				if IMUTimestamp_SI = '1'then
					State_DN              <= stTimestamp;
					StateTimestampNext_DN <= stIMU;
				else
					State_DN <= stIMU;
				end if;

			when stIMU =>
				-- Write out current event.
				OutFifoData_DO            <= EVENT_CODE_EVENT & IMUFifoData_DI;
				OutFifoControl_SO.Write_S <= '1';

				IMUFifoControl_SO.Read_S <= '1';
				State_DN                 <= stIdle;

			when stPrepareExtInput =>
				-- Decide if event needs to be timestamped.
				if ExtInputTimestamp_SI = '1' then
					State_DN              <= stTimestamp;
					StateTimestampNext_DN <= stExtInput;
				else
					State_DN <= stExtInput;
				end if;

			when stExtInput =>
				-- Write out current event.
				OutFifoData_DO            <= EVENT_CODE_EVENT & ExtInputFifoData_DI;
				OutFifoControl_SO.Write_S <= '1';

				ExtInputFifoControl_SO.Read_S <= '1';
				State_DN                      <= stIdle;

			when stPrepareDVS =>
				-- Decide if event needs to be timestamped.
				if DVSTimestamp_SI = '1' then
					State_DN              <= stTimestamp;
					StateTimestampNext_DN <= stDVS;
				else
					State_DN <= stDVS;
				end if;

			when stDVS =>
				-- Write out current event.
				OutFifoData_DO            <= EVENT_CODE_EVENT & DVSFifoData_DI;
				OutFifoControl_SO.Write_S <= '1';

				DVSFifoControl_SO.Read_S <= '1';
				State_DN                 <= stIdle;

			when stPrepareAPS =>
				-- Decide if event needs to be timestamped.
				if APSTimestamp_SI = '1' then
					State_DN              <= stTimestamp;
					StateTimestampNext_DN <= stAPS;
				else
					State_DN <= stAPS;
				end if;

			when stAPS =>
				-- Write out current event.
				OutFifoData_DO            <= EVENT_CODE_EVENT & APSFifoData_DI;
				OutFifoControl_SO.Write_S <= '1';

				APSFifoControl_SO.Read_S <= '1';
				State_DN                 <= stIdle;

			when stDropData =>
				-- Drop events while the output fifo is full. This guarantees
				-- a continuous flow of events from the data producers and
				-- disallows a backlog of old events to remain around, which
				-- would be timestamped incorrectly after long delays.
				-- This is fully configurable from the host.
				if MultiplexerConfigReg_D.DropExtInputOnTransferStall_S = '1' and not ExtInputFifoControl_SI.Empty_S = '1' then
					ExtInputFifoControl_SO.Read_S <= '1';

					StatisticsExtInputDropped_SN <= '1';
				end if;

				if MultiplexerConfigReg_D.DropDVSOnTransferStall_S = '1' and not DVSFifoControl_SI.Empty_S = '1' then
					DVSFifoControl_SO.Read_S <= '1';

					StatisticsDVSDropped_SN <= '1';
				end if;

				State_DN <= stIdle;

			when others => null;
		end case;
	end process p_memoryless;

	-- Change state on clock edge (synchronous).
	p_memoryzing : process(Clock_CI, Reset_RI)
	begin
		if Reset_RI = '1' then                -- asynchronous reset (active-high for FPGAs)
			State_DP              <= stIdle;
			StateTimestampNext_DP <= stTimestamp;

			HighestTimestampSent_SP <= '0';
			TimestampBuffer_D       <= (others => '0');

			MultiplexerConfigReg_D <= tMultiplexerConfigDefault;
		elsif rising_edge(Clock_CI) then
			State_DP              <= State_DN;
			StateTimestampNext_DP <= StateTimestampNext_DN;

			HighestTimestampSent_SP <= HighestTimestampSent_SN;
			TimestampBuffer_D       <= Timestamp_D;

			MultiplexerConfigReg_D <= MultiplexerConfig_DI;
		end if;
	end process p_memoryzing;

    NOTMultiplexerConfigReg_DRun_S <= not MultiplexerConfigReg_D.Run_S;
	statisticsSupport : if ENABLE_STATISTICS generate
		StatisticsExtInputDroppedReg : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => StatisticsExtInputDropped_SN,
				Output_SO(0) => StatisticsExtInputDropped_SP);

		StatisticsExtInputDroppedCounter : entity work.Counter
			generic map(
				SIZE => TRANSACTION_COUNTER_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Clear_SI  => NOTMultiplexerConfigReg_DRun_S,
				Enable_SI => StatisticsExtInputDropped_SP,
				Data_DO   => MultiplexerConfigInfoOut_DO.StatisticsExtInputDropped_D);

		StatisticsDVSDroppedReg : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => StatisticsDVSDropped_SN,
				Output_SO(0) => StatisticsDVSDropped_SP);

		StatisticsDVSDroppedCounter : entity work.Counter
			generic map(
				SIZE => TRANSACTION_COUNTER_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Clear_SI  => NOTMultiplexerConfigReg_DRun_S,
				Enable_SI => StatisticsDVSDropped_SP,
				Data_DO   => MultiplexerConfigInfoOut_DO.StatisticsDVSDropped_D);
	end generate statisticsSupport;

	noStatisticsSupport : if not ENABLE_STATISTICS generate
		MultiplexerConfigInfoOut_DO <= tMultiplexerConfigInfoOutDefault;
	end generate noStatisticsSupport;
end Behavioral;
