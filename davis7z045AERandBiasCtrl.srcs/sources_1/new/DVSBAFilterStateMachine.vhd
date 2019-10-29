library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;
use ieee.math_real."**";
use work.EventCodes.EVENT_WIDTH;
use work.Functions.BooleanToStdLogic;
use work.DVSAERConfigRecords.DVS_FILTER_BA_DELTAT_WIDTH;
use work.Settings.CHIP_DVS_SIZE_ROWS;
use work.Settings.CHIP_DVS_SIZE_COLUMNS;
use work.Settings.LOGIC_CLOCK_FREQ;

entity DVSBAFilterStateMachine is
	generic(
		BA_FILTER_SUBSAMPLE_COLUMN : integer := 2;
		BA_FILTER_SUBSAMPLE_ROW    : integer := 2);
	port(
		Clock_CI                                : in  std_logic;
		Reset_RI                                : in  std_logic;

		-- Filter control and settings.
		FilterBackgroundActivity_SI             : in  std_logic;
		FilterBackgroundActivityTime_DI         : in  unsigned(DVS_FILTER_BA_DELTAT_WIDTH - 1 downto 0);
		FilterRefractoryPeriod_SI               : in  std_logic;
		FilterRefractoryPeriodTime_DI           : in  unsigned(DVS_FILTER_BA_DELTAT_WIDTH - 1 downto 0);

		-- Statistics output.
		StatisticsFilteredBackgroundActivity_SO : out std_logic;
		StatisticsFilteredRefractoryPeriod_SO   : out std_logic;

		-- Data input.
		BAFilterInputData_DI                    : in  std_logic_vector(EVENT_WIDTH - 1 downto 0);
		BAFilterInputValid_SI                   : in  std_logic;

		-- Data output.
		BAFilterOutputData_DO                   : out std_logic_vector(EVENT_WIDTH - 1 downto 0);
		BAFilterOutputValid_SO                  : out std_logic);
end entity DVSBAFilterStateMachine;

architecture Behavioral of DVSBAFilterStateMachine is
	-- Bits needed for each address.
	constant DVS_ROW_ADDRESS_WIDTH    : integer := integer(ceil(log2(real(to_integer(CHIP_DVS_SIZE_ROWS)))));
	constant DVS_COLUMN_ADDRESS_WIDTH : integer := integer(ceil(log2(real(to_integer(CHIP_DVS_SIZE_COLUMNS)))));

	constant BA_COLUMN_ADDRESS_WIDTH : integer := DVS_COLUMN_ADDRESS_WIDTH - BA_FILTER_SUBSAMPLE_COLUMN;
	constant BA_ROW_ADDRESS_WIDTH    : integer := DVS_ROW_ADDRESS_WIDTH - BA_FILTER_SUBSAMPLE_ROW;
	constant BA_COLUMN_CELL_NUMBER   : integer := integer(ceil(real(to_integer(CHIP_DVS_SIZE_COLUMNS)) / (2.0 ** real(BA_FILTER_SUBSAMPLE_COLUMN))));
	constant BA_ROW_CELL_NUMBER      : integer := integer(ceil(real(to_integer(CHIP_DVS_SIZE_ROWS)) / (2.0 ** real(BA_FILTER_SUBSAMPLE_ROW))));
	constant BA_ADDRESS_DEPTH        : integer := BA_COLUMN_CELL_NUMBER * BA_ROW_CELL_NUMBER;
	constant BA_ADDRESS_WIDTH        : integer := integer(ceil(log2(real(BA_ADDRESS_DEPTH))));
	constant BA_TIMESTAMP_WIDTH      : integer := 18;

	signal LastRowAddress_DP, LastRowAddress_DN : unsigned(DVS_ROW_ADDRESS_WIDTH - 1 downto 0);

	attribute syn_enum_encoding : string;

	type tState is (stIdle, stLookup0, stLookup1, stLookup2Results0, stLookup3Results1, stResults2, stResults3);
	attribute syn_enum_encoding of tState : type is "onehot";

	-- Present and next state (state machine).
	signal State_DP, State_DN : tState;

	-- Is the filter running at all?
	signal FilterIsEnabled_S : std_logic;

	-- Lookup information.
	constant PX_TYPE_CENTER           : std_logic_vector(1 downto 0) := "00";
	constant PX_TYPE_EDGE             : std_logic_vector(1 downto 0) := "01";
	constant PX_TYPE_CORNER           : std_logic_vector(1 downto 0) := "10";
	signal PixelType_DP, PixelType_DN : std_logic_vector(1 downto 0);

	signal LookupAddress0_DP, LookupAddress0_DN : unsigned(BA_ADDRESS_WIDTH - 1 downto 0);
	signal LookupAddress1_DP, LookupAddress1_DN : unsigned(BA_ADDRESS_WIDTH - 1 downto 0);
	signal LookupAddress2_DP, LookupAddress2_DN : unsigned(BA_ADDRESS_WIDTH - 1 downto 0);
	signal LookupAddress3_DP, LookupAddress3_DN : unsigned(BA_ADDRESS_WIDTH - 1 downto 0);

	signal LookupValid1_DP, LookupValid1_DN : std_logic;
	signal LookupValid2_DP, LookupValid2_DN : std_logic;
	signal LookupValid3_DP, LookupValid3_DN : std_logic;

	-- Timestamp map lookup.
	signal TimestampMapEn_S, TimestampMapWr_S : std_logic;
	signal TimestampMapAddress_D              : unsigned(BA_ADDRESS_WIDTH - 1 downto 0);
	signal TimestampMap_DP, TimestampMap_DN   : unsigned(BA_TIMESTAMP_WIDTH - 1 downto 0);
	signal LookupResult_D                     : unsigned(BA_TIMESTAMP_WIDTH - 1 downto 0);

	-- Generate continuous timestamp value, expanded to N microseconds per tick.
	constant TICK_EXPANSION : integer := 250;
	constant TS_TICK        : integer := integer(LOGIC_CLOCK_FREQ * real(TICK_EXPANSION));
	constant TS_TICK_SIZE   : integer := integer(ceil(log2(real(TS_TICK))));

	signal TimestampRefresh_S : std_logic;
	signal TimestampTick_S    : std_logic;
	signal Timestamp_D        : unsigned(BA_TIMESTAMP_WIDTH - 1 downto 0);
	signal TimestampBuffer_D  : unsigned(BA_TIMESTAMP_WIDTH - 1 downto 0);

	-- Calculations.
	signal ColumnAddress_D : unsigned(BA_COLUMN_ADDRESS_WIDTH - 1 downto 0);
	signal RowAddress_D    : unsigned(BA_ROW_ADDRESS_WIDTH - 1 downto 0);

	signal SubSampledColumnAddress_D : unsigned(BA_FILTER_SUBSAMPLE_COLUMN - 1 downto 0);
	signal SubSampledRowAddress_D    : unsigned(BA_FILTER_SUBSAMPLE_ROW - 1 downto 0);

	signal TimestampAddress_D : unsigned(BA_ADDRESS_WIDTH - 1 downto 0);

	signal IsEdgeLeft_S  : std_logic;
	signal IsEdgeRight_S : std_logic;
	signal IsEdgeUp_S    : std_logic;
	signal IsEdgeDown_S  : std_logic;

	signal IsCornerUpLeft_S    : std_logic;
	signal IsCornerRightUp_S   : std_logic;
	signal IsCornerDownRight_S : std_logic;
	signal IsCornerLeftDown_S  : std_logic;

	signal IsMapEdgeLeft_S  : std_logic;
	signal IsMapEdgeRight_S : std_logic;
	signal IsMapEdgeUp_S    : std_logic;
	signal IsMapEdgeDown_S  : std_logic;

	signal RefractoryResult_S         : std_logic;
	signal BackgroundActivityResult_S : std_logic;
	
	signal NOTFilterIsEnabled_S : std_logic;
begin
	assert (BA_FILTER_SUBSAMPLE_COLUMN >= 1) report "BA_FILTER_SUBSAMPLE_COLUMN must be bigger or equal to 1." severity FAILURE;
	assert (BA_FILTER_SUBSAMPLE_ROW >= 1) report "BA_FILTER_SUBSAMPLE_ROW must be bigger or equal to 1." severity FAILURE;

	FilterIsEnabled_S <= FilterBackgroundActivity_SI or FilterRefractoryPeriod_SI;

	-- This is a column address, save it and calculate all map-related
	-- lookup information, so then we can execute all the lookup states.
	ColumnAddress_D <= unsigned(BAFilterInputData_DI(DVS_COLUMN_ADDRESS_WIDTH - 1 downto BA_FILTER_SUBSAMPLE_COLUMN));
	RowAddress_D    <= LastRowAddress_DP(DVS_ROW_ADDRESS_WIDTH - 1 downto BA_FILTER_SUBSAMPLE_ROW);

	-- Use only one multiplication, add/sub for other addresses.
	TimestampAddress_D <= resize(RowAddress_D * to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH) + ColumnAddress_D, BA_ADDRESS_WIDTH);

	SubSampledColumnAddress_D <= unsigned(BAFilterInputData_DI(BA_FILTER_SUBSAMPLE_COLUMN - 1 downto 0));
	SubSampledRowAddress_D    <= LastRowAddress_DP(BA_FILTER_SUBSAMPLE_ROW - 1 downto 0);

	IsEdgeLeft_S  <= BooleanToStdLogic(SubSampledColumnAddress_D = (SubSampledColumnAddress_D'range => '0'));
	IsEdgeRight_S <= BooleanToStdLogic(SubSampledColumnAddress_D = (SubSampledColumnAddress_D'range => '1'));
	IsEdgeUp_S    <= BooleanToStdLogic(SubSampledRowAddress_D = (SubSampledRowAddress_D'range => '0'));
	IsEdgeDown_S  <= BooleanToStdLogic(SubSampledRowAddress_D = (SubSampledRowAddress_D'range => '1'));

	IsCornerUpLeft_S    <= IsEdgeUp_S and IsEdgeLeft_S;
	IsCornerRightUp_S   <= IsEdgeRight_S and IsEdgeUp_S;
	IsCornerDownRight_S <= IsEdgeDown_S and IsEdgeRight_S;
	IsCornerLeftDown_S  <= IsEdgeLeft_S and IsEdgeDown_S;

	IsMapEdgeLeft_S  <= BooleanToStdLogic(ColumnAddress_D = to_unsigned(0, BA_COLUMN_ADDRESS_WIDTH));
	IsMapEdgeRight_S <= BooleanToStdLogic(ColumnAddress_D = to_unsigned(BA_COLUMN_CELL_NUMBER - 1, BA_COLUMN_ADDRESS_WIDTH));
	IsMapEdgeUp_S    <= BooleanToStdLogic(RowAddress_D = to_unsigned(0, BA_ROW_ADDRESS_WIDTH));
	IsMapEdgeDown_S  <= BooleanToStdLogic(RowAddress_D = to_unsigned(BA_ROW_CELL_NUMBER - 1, BA_ROW_ADDRESS_WIDTH));

	RefractoryResult_S         <= BooleanToStdLogic(LookupResult_D < FilterRefractoryPeriodTime_DI);
	BackgroundActivityResult_S <= BooleanToStdLogic(LookupResult_D > FilterBackgroundActivityTime_DI);

	baFilterLogic : process(State_DP, LastRowAddress_DP, FilterIsEnabled_S, BAFilterInputData_DI, BAFilterInputValid_SI, PixelType_DP, LookupAddress0_DP, LookupAddress1_DP, LookupAddress2_DP, LookupAddress3_DP, FilterBackgroundActivity_SI, FilterRefractoryPeriod_SI, IsCornerDownRight_S, IsCornerLeftDown_S, IsCornerRightUp_S, IsCornerUpLeft_S, IsEdgeDown_S, IsEdgeLeft_S, IsEdgeRight_S, IsEdgeUp_S, TimestampAddress_D, LookupValid1_DP, LookupValid2_DP, LookupValid3_DP, IsMapEdgeDown_S, IsMapEdgeLeft_S, IsMapEdgeRight_S, IsMapEdgeUp_S, BackgroundActivityResult_S, RefractoryResult_S)
	begin
		State_DN <= State_DP;           -- Keep current state by default.

		LastRowAddress_DN <= LastRowAddress_DP;

		PixelType_DN      <= PixelType_DP;
		LookupAddress0_DN <= LookupAddress0_DP;
		LookupAddress1_DN <= LookupAddress1_DP;
		LookupAddress2_DN <= LookupAddress2_DP;
		LookupAddress3_DN <= LookupAddress3_DP;

		LookupValid1_DN <= LookupValid1_DP;
		LookupValid2_DN <= LookupValid2_DP;
		LookupValid3_DN <= LookupValid3_DP;

		TimestampMapEn_S      <= '0';
		TimestampMapWr_S      <= '0';
		TimestampMapAddress_D <= (others => '0');

		TimestampRefresh_S <= '0';

		-- Nothing is being filtered out by default.
		StatisticsFilteredBackgroundActivity_SO <= '0';
		StatisticsFilteredRefractoryPeriod_SO   <= '0';

		BAFilterOutputData_DO  <= BAFilterInputData_DI;
		BAFilterOutputValid_SO <= '0';

		case State_DP is
			when stIdle =>
				if FilterIsEnabled_S = '1' then
					if BAFilterInputValid_SI = '1' then
						if BAFilterInputData_DI(EVENT_WIDTH - 2) = '0' then
							-- This is a row address, we just save it for later and forward it.
							LastRowAddress_DN <= unsigned(BAFilterInputData_DI(DVS_ROW_ADDRESS_WIDTH - 1 downto 0));

							BAFilterOutputValid_SO <= '1'; -- Must be valid due to if-condition above.
						else
							LookupAddress0_DN <= TimestampAddress_D;

							if IsCornerUpLeft_S = '1' or IsCornerRightUp_S = '1' or IsCornerDownRight_S = '1' or IsCornerLeftDown_S = '1' then
								-- Is a corner pixel!
								PixelType_DN <= PX_TYPE_CORNER;

								if IsCornerUpLeft_S = '1' then
									LookupAddress1_DN <= TimestampAddress_D - 1;
									LookupAddress2_DN <= TimestampAddress_D - to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH) - 1;
									LookupAddress3_DN <= TimestampAddress_D - to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH);

									LookupValid1_DN <= not IsMapEdgeLeft_S;
									LookupValid2_DN <= not IsMapEdgeLeft_S and not IsMapEdgeUp_S;
									LookupValid3_DN <= not IsMapEdgeUp_S;
								elsif IsCornerRightUp_S = '1' then
									LookupAddress1_DN <= TimestampAddress_D - to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH);
									LookupAddress2_DN <= TimestampAddress_D - to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH) + 1;
									LookupAddress3_DN <= TimestampAddress_D + 1;

									LookupValid1_DN <= not IsMapEdgeUp_S;
									LookupValid2_DN <= not IsMapEdgeUp_S and not IsMapEdgeRight_S;
									LookupValid3_DN <= not IsMapEdgeRight_S;
								elsif IsCornerDownRight_S = '1' then
									LookupAddress1_DN <= TimestampAddress_D + 1;
									LookupAddress2_DN <= TimestampAddress_D + to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH) + 1;
									LookupAddress3_DN <= TimestampAddress_D + to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH);

									LookupValid1_DN <= not IsMapEdgeRight_S;
									LookupValid2_DN <= not IsMapEdgeRight_S and not IsMapEdgeDown_S;
									LookupValid3_DN <= not IsMapEdgeDown_S;
								else
									LookupAddress1_DN <= TimestampAddress_D + to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH);
									LookupAddress2_DN <= TimestampAddress_D + to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH) - 1;
									LookupAddress3_DN <= TimestampAddress_D - 1;

									LookupValid1_DN <= not IsMapEdgeDown_S;
									LookupValid2_DN <= not IsMapEdgeDown_S and not IsMapEdgeLeft_S;
									LookupValid3_DN <= not IsMapEdgeLeft_S;
								end if;
							elsif IsEdgeLeft_S = '1' or IsEdgeRight_S = '1' or IsEdgeUp_S = '1' or IsEdgeDown_S = '1' then
								-- Is an edge pixel then, if any edge is ON but not a corner.
								PixelType_DN <= PX_TYPE_EDGE;

								if IsEdgeLeft_S = '1' then
									LookupAddress1_DN <= TimestampAddress_D - 1;

									LookupValid1_DN <= not IsMapEdgeLeft_S;
								elsif IsEdgeRight_S = '1' then
									LookupAddress1_DN <= TimestampAddress_D + 1;

									LookupValid1_DN <= not IsMapEdgeRight_S;
								elsif IsEdgeUp_S = '1' then
									LookupAddress1_DN <= TimestampAddress_D - to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH);

									LookupValid1_DN <= not IsMapEdgeUp_S;
								else
									LookupAddress1_DN <= TimestampAddress_D + to_unsigned(BA_COLUMN_CELL_NUMBER, BA_ADDRESS_WIDTH);

									LookupValid1_DN <= not IsMapEdgeDown_S;
								end if;
							else
								-- Not a corner or an edge, must be a center pixel.
								PixelType_DN <= PX_TYPE_CENTER;
							end if;

							-- Fix timestamp for the subsequent series of lookups and comparisons.
							TimestampRefresh_S <= '1';

							-- Go do first lookup. No data/valid output here, only if all filter stages
							-- work out do we send out the column address with a valid bit.
							State_DN <= stLookup0;
						end if;
					end if;
				else
					-- Filter disabled, just forward input valid and remain in this state.
					BAFilterOutputValid_SO <= BAFilterInputValid_SI;
				end if;

			when stLookup0 =>
				TimestampMapEn_S      <= '1';
				TimestampMapWr_S      <= '1';
				TimestampMapAddress_D <= LookupAddress0_DP;

				State_DN <= stLookup1;

			when stLookup1 =>
				TimestampMapEn_S      <= '1';
				TimestampMapWr_S      <= '0';
				TimestampMapAddress_D <= LookupAddress1_DP;

				State_DN <= stLookup2Results0;

			when stLookup2Results0 =>
				TimestampMapEn_S      <= '1';
				TimestampMapWr_S      <= '0';
				TimestampMapAddress_D <= LookupAddress2_DP;

				if FilterRefractoryPeriod_SI = '1' and RefractoryResult_S = '1' then
					-- Refractory filter failure.
					State_DN <= stIdle;

					StatisticsFilteredRefractoryPeriod_SO <= '1';
				elsif FilterBackgroundActivity_SI = '1' and BackgroundActivityResult_S = '1' then
					-- Background-activity filter failure.
					if PixelType_DP = PX_TYPE_CENTER then
						-- Not supported, and this is a Center-type pixel, so we only do lookup 0.
						-- At this point, this event is invalid.
						State_DN <= stIdle;

						StatisticsFilteredBackgroundActivity_SO <= '1';
					else
						-- Edge or Corner pixel, could have others supporting him, do next lookups.
						State_DN <= stLookup3Results1;
					end if;
				else
					-- Both filters turend off in the meantime, or refractory/background-activity
					-- enabled but with a valid event, so pass the current event.
					State_DN <= stIdle;

					BAFilterOutputValid_SO <= '1';
				end if;

			when stLookup3Results1 =>
				TimestampMapEn_S      <= '1';
				TimestampMapWr_S      <= '0';
				TimestampMapAddress_D <= LookupAddress3_DP;

				if LookupValid1_DP = '1' then
					if BackgroundActivityResult_S = '1' then
						if PixelType_DP = PX_TYPE_EDGE then
							-- Not supported, and this is an Edge-type pixel, so we only do lookup 0 and 1.
							-- At this point, this event is invalid.
							State_DN <= stIdle;

							StatisticsFilteredBackgroundActivity_SO <= '1';
						else
							-- Corner pixel, could have others supporting him, do next lookups.
							State_DN <= stResults2;
						end if;
					else
						-- Background-activity with a valid event, so pass the current event.
						State_DN <= stIdle;

						BAFilterOutputValid_SO <= '1';
					end if;
				else
					-- Lookup invalid, no information, same as no support.
					if PixelType_DP = PX_TYPE_EDGE then
						-- Not supported, and this is an Edge-type pixel, so we only do lookup 0 and 1.
						-- At this point, this event is invalid.
						State_DN <= stIdle;

						StatisticsFilteredBackgroundActivity_SO <= '1';
					else
						-- Corner pixel, could have others supporting him, do next lookups.
						State_DN <= stResults2;
					end if;
				end if;

			when stResults2 =>
				if LookupValid2_DP = '1' then
					if BackgroundActivityResult_S = '1' then
						-- Not supported, and this is a Corner pixel, could have one other supporting him, do last lookup check.
						State_DN <= stResults3;
					else
						-- Background-activity with a valid event, so pass the current event.
						State_DN <= stIdle;

						BAFilterOutputValid_SO <= '1';
					end if;
				else
					-- Lookup invalid, no information, same as no support.
					-- Not supported, and this is a Corner pixel, could have one other supporting him, do last lookup check.
					State_DN <= stResults3;
				end if;

			when stResults3 =>
				State_DN <= stIdle;

				if LookupValid3_DP = '1' then
					if BackgroundActivityResult_S = '1' then
						-- Not supported on last check, must be invalid.
						StatisticsFilteredBackgroundActivity_SO <= '1';
					else
						-- Background-activity with a valid event, so pass the current event.
						BAFilterOutputValid_SO <= '1';
					end if;
				else
					-- Lookup invalid, no information, same as no support.
					-- Not supported on last check, must be invalid.
					StatisticsFilteredBackgroundActivity_SO <= '1';
				end if;

			when others => null;
		end case;
	end process baFilterLogic;

	-- Change state on clock edge (synchronous).
	baFilterRegUpdate : process(Clock_CI, Reset_RI)
	begin
		if Reset_RI = '1' then          -- asynchronous reset (active-high for FPGAs)
			State_DP <= stIdle;

			LastRowAddress_DP <= (others => '0');

			PixelType_DP      <= PX_TYPE_CENTER;
			LookupAddress0_DP <= (others => '0');
			LookupAddress1_DP <= (others => '0');
			LookupAddress2_DP <= (others => '0');
			LookupAddress3_DP <= (others => '0');

			LookupValid1_DP <= '0';
			LookupValid2_DP <= '0';
			LookupValid3_DP <= '0';
		elsif rising_edge(Clock_CI) then
			State_DP <= State_DN;

			LastRowAddress_DP <= LastRowAddress_DN;

			PixelType_DP      <= PixelType_DN;
			LookupAddress0_DP <= LookupAddress0_DN;
			LookupAddress1_DP <= LookupAddress1_DN;
			LookupAddress2_DP <= LookupAddress2_DN;
			LookupAddress3_DP <= LookupAddress3_DN;

			LookupValid1_DP <= LookupValid1_DN;
			LookupValid2_DP <= LookupValid2_DN;
			LookupValid3_DP <= LookupValid3_DN;
		end if;
	end process baFilterRegUpdate;

	-- The next value, if and when we're going to write to a RAM address, is
	-- always going to be the current timestamp. So we can just hardcode that.
	TSMap : entity work.BlockRAM
		generic map(
			ADDRESS_DEPTH => BA_ADDRESS_DEPTH,
			ADDRESS_WIDTH => BA_ADDRESS_WIDTH,
			DATA_WIDTH    => BA_TIMESTAMP_WIDTH,
			RAM_STYLE     => "block",
			WRITE_MODE    => "readbeforewrite")
		port map(
			Clock_CI          => Clock_CI,
			Reset_RI          => Reset_RI,
			Address_DI        => TimestampMapAddress_D,
			Enable_SI         => TimestampMapEn_S,
			WriteEnable_SI    => TimestampMapWr_S,
			Data_DI           => std_logic_vector(TimestampBuffer_D),
			unsigned(Data_DO) => TimestampMap_DN,
			DataValid_SO      => open);

	TSMapBuffer : entity work.SimpleRegister
		generic map(
			SIZE => BA_TIMESTAMP_WIDTH)
		port map(
			Clock_CI            => Clock_CI,
			Reset_RI            => Reset_RI,
			Enable_SI           => '1',
			Input_SI            => std_logic_vector(TimestampMap_DN),
			unsigned(Output_SO) => TimestampMap_DP);

	-- Final output is the timestamp difference.
	LookupResult_D <= (TimestampBuffer_D - TimestampMap_DP);
	
	NOTFilterIsEnabled_S <= not FilterIsEnabled_S;
	baFilterTSTick : entity work.ContinuousCounter
		generic map(
			SIZE => TS_TICK_SIZE)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Clear_SI     => NOTFilterIsEnabled_S,
			Enable_SI    => '1',
			DataLimit_DI => to_unsigned(TS_TICK - 1, TS_TICK_SIZE),
			Overflow_SO  => TimestampTick_S,
			Data_DO      => open);

	baFilterTSCounter : entity work.Counter
		generic map(
			SIZE => BA_TIMESTAMP_WIDTH)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Clear_SI  => NOTFilterIsEnabled_S,
			Enable_SI => TimestampTick_S,
			Data_DO   => Timestamp_D);

	baFilterTSBuffer : entity work.SimpleRegister
		generic map(
			SIZE => BA_TIMESTAMP_WIDTH)
		port map(
			Clock_CI            => Clock_CI,
			Reset_RI            => Reset_RI,
			Enable_SI           => TimestampRefresh_S,
			Input_SI            => std_logic_vector(Timestamp_D),
			unsigned(Output_SO) => TimestampBuffer_D);
end architecture Behavioral;
