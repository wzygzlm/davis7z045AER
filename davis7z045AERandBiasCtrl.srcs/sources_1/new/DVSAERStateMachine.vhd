library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Functions.SizeCountNTimes;
use work.Functions.BooleanToStdLogic;
use work.EventCodes.all;
use work.FIFORecords.all;
use work.DVSAERConfigRecords.all;
use work.ChipGeometry.AXES_KEEP;
use work.ChipGeometry.AXES_INVERT;
use work.Settings.DVS_AER_BUS_WIDTH;
use work.Settings.CHIP_DVS_ORIGIN_POINT;
use work.Settings.CHIP_DVS_AXES_INVERT;
use work.Settings.CHIP_DVS_SIZE_ROWS;
use work.Settings.CHIP_DVS_SIZE_COLUMNS;

entity DVSAERStateMachine is
	generic(
		ENABLE_ROI_FILTERING       : boolean := false;
		ENABLE_PIXEL_FILTERING     : boolean := false;
		ENABLE_BA_REFR_FILTERING   : boolean := false;
		BA_FILTER_SUBSAMPLE_COLUMN : integer := 2;
		BA_FILTER_SUBSAMPLE_ROW    : integer := 2;
		ENABLE_SKIP_FILTERING      : boolean := false;
		ENABLE_POLARITY_FILTERING  : boolean := false;
		ENABLE_STATISTICS          : boolean := false);
	port(
		Clock_CI               : in  std_logic;
		Reset_RI               : in  std_logic;

		-- Fifo output (to Multiplexer)
		OutFifoControl_SI      : in  tFromFifoWriteSide;
		OutFifoControl_SO      : out tToFifoWriteSide;
		OutFifoData_DO         : out std_logic_vector(EVENT_WIDTH - 1 downto 0);

		DVSAERData_DI          : in  std_logic_vector(DVS_AER_BUS_WIDTH - 1 downto 0);
		DVSAERReq_SBI          : in  std_logic;
		DVSAERAck_SBO          : out std_logic;
		DVSAERReset_SBO        : out std_logic;

		-- Configuration input and output
		DVSAERConfig_DI        : in  tDVSAERConfig;
		DVSAERConfigInfoOut_DO : out tDVSAERConfigInfoOut);
end DVSAERStateMachine;

architecture Behavioral of DVSAERStateMachine is
	attribute syn_enum_encoding : string;

	type tState is (stIdle, stDifferentiateRowCol, stAERCaptureRow, stAERWriteRow, stAERCaptureCol, stAERWriteCol, stAERAck, stFIFOFull);
	attribute syn_enum_encoding of tState : type is "onehot";

	-- present and next state
	signal State_DP, State_DN : tState;

	-- Counter to influence acknowledge delays.
	constant ROW_CAPTURE_DELAY_COUNTER_WIDTH             : integer := 2;
	signal RowCaptureDelayCount_S, RowCaptureDelayDone_S : std_logic;

	-- Bits needed for each address.
	constant DVS_ROW_ADDRESS_WIDTH    : integer := SizeCountNTimes(CHIP_DVS_SIZE_ROWS);
	constant DVS_COLUMN_ADDRESS_WIDTH : integer := SizeCountNTimes(CHIP_DVS_SIZE_COLUMNS);

	constant IS_ROW_ADDR : std_logic := '0';

	-- Data incoming from DVS.
	signal ChipAERDataCapture_S : std_logic;
	signal ChipAERData_D        : std_logic_vector(DVS_AER_BUS_WIDTH - 1 downto 0);

	-- DVS event.
	signal DVSEventDataReg_D     : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal DVSEventValidReg_S    : std_logic;
	signal DVSEventOutDataReg_D  : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal DVSEventOutValidReg_S : std_logic;

	-- Register outputs to DVS.
	signal DVSAERAckReg_SB   : std_logic;
	signal DVSAERResetReg_SB : std_logic;

	-- Register configuration input and output.
	signal DVSAERConfigReg_D : tDVSAERConfig;

	-- Polarity filtering support.
	signal PolarityFilterInDataReg_D   : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal PolarityFilterInValidReg_S  : std_logic;
	signal PolarityFilterOutDataReg_D  : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal PolarityFilterOutValidReg_S : std_logic;

	-- ROI filtering support.
	signal ROIFilterInDataReg_D   : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal ROIFilterInValidReg_S  : std_logic;
	signal ROIFilterOutDataReg_D  : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal ROIFilterOutValidReg_S : std_logic;

	-- Pixel filtering support.
	signal PixelFilterInDataReg_D   : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal PixelFilterInValidReg_S  : std_logic;
	signal PixelFilterOutDataReg_D  : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal PixelFilterOutValidReg_S : std_logic;

	-- Background Activity filtering support.
	signal BARefrFilterInDataReg_D   : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal BARefrFilterInValidReg_S  : std_logic;
	signal BARefrFilterOutDataReg_D  : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal BARefrFilterOutValidReg_S : std_logic;

	-- Skip filtering support.
	signal SkipFilterInDataReg_D   : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal SkipFilterInValidReg_S  : std_logic;
	signal SkipFilterOutDataReg_D  : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal SkipFilterOutValidReg_S : std_logic;

	-- Row Only filtering support (at end to catch all the row-only events that
	-- are generated from the other filters due to dropping column events).
	signal RowOnlyFilterInDataReg_D   : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal RowOnlyFilterInValidReg_S  : std_logic;
	signal RowOnlyFilterOutDataReg_D  : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal RowOnlyFilterOutValidReg_S : std_logic;
	signal RowOnlyFilterPassRow_S     : std_logic;

	-- Statistics support.
	signal StatisticsEventsRow_SP, StatisticsEventsRow_SN                                   : std_logic;
	signal StatisticsEventsColumn_SP, StatisticsEventsColumn_SN                             : std_logic;
	signal StatisticsEventsDropped_SP, StatisticsEventsDropped_SN                           : std_logic;
	signal StatisticsFilteredPixels_SP, StatisticsFilteredPixels_SN                         : std_logic;
	signal StatisticsFilteredBackgroundActivity_SP, StatisticsFilteredBackgroundActivity_SN : std_logic;
	signal StatisticsFilteredRefractoryPeriod_SP, StatisticsFilteredRefractoryPeriod_SN     : std_logic;
	
	signal NOTDVSAERConfigReg_DRun_S : std_logic;
begin
	rowCaptureDelayCounter : entity work.ContinuousCounter
		generic map(
			SIZE => ROW_CAPTURE_DELAY_COUNTER_WIDTH)
		port map(Clock_CI     => Clock_CI,
		         Reset_RI     => Reset_RI,
		         Clear_SI     => '0',
		         Enable_SI    => RowCaptureDelayCount_S,
		         DataLimit_DI => to_unsigned(3, ROW_CAPTURE_DELAY_COUNTER_WIDTH),
		         Overflow_SO  => RowCaptureDelayDone_S,
		         Data_DO      => open);

	dvsHandleAERComb : process(State_DP, OutFifoControl_SI, DVSAERReq_SBI, DVSAERData_DI, DVSAERConfigReg_D, RowCaptureDelayDone_S, ChipAERData_D)
	begin
		State_DN <= State_DP;           -- Keep current state by default.

		DVSEventValidReg_S <= '0';
		DVSEventDataReg_D  <= (others => '0');

		ChipAERDataCapture_S <= '0';

		DVSAERAckReg_SB   <= '1';       -- No AER ACK by default.
		DVSAERResetReg_SB <= '1';       -- Keep DVS out of reset by default, so we don't have to repeat this in every state.

		RowCaptureDelayCount_S <= '0';

		StatisticsEventsRow_SN     <= '0';
		StatisticsEventsColumn_SN  <= '0';
		StatisticsEventsDropped_SN <= '0';

		case State_DP is
			when stIdle =>
				-- Only exit idle state if DVS data producer is active.
				if DVSAERConfigReg_D.Run_S = '1' then
					if not DVSAERReq_SBI = '1' then
						if not OutFifoControl_SI.AlmostFull_S = '1' then
							-- Got a request on the AER bus, let's get the data.
							-- We do have space in the output FIFO for it.
							State_DN <= stDifferentiateRowCol;
						elsif not DVSAERConfigReg_D.WaitOnTransferStall_S = '1' then
							-- FIFO full, keep ACKing.
							State_DN <= stFIFOFull;

							StatisticsEventsDropped_SN <= '1';
						end if;
					end if;
				else
					if DVSAERConfigReg_D.ExternalAERControl_S = '1' then
						-- Support handing off control of AER to external systems connected through the CAVIAR
						-- connector on the board. This ensures the chip is kept out of reset and the ACK is
						-- not driven from our logic.
						DVSAERAckReg_SB   <= 'Z';
						DVSAERResetReg_SB <= '1';
					else
						-- Keep the DVS in reset if data producer turned off.
						DVSAERResetReg_SB <= '0';
					end if;
				end if;

			when stFIFOFull =>
				-- Output FIFO is full, just ACK the data, so that, when
				-- we'll have space in the FIFO again, the newest piece of
				-- data is the next to be inserted, and not stale old data.
				DVSAERAckReg_SB <= DVSAERReq_SBI;

				-- Only go back to idle when FIFO has space again, and when
				-- the sender is not requesting (to avoid AER races).
				if not OutFifoControl_SI.AlmostFull_S = '1' and DVSAERReq_SBI = '1' then
					State_DN <= stIdle;
				end if;

			when stDifferentiateRowCol =>
				-- Get data and format it. AER(WIDTH-1) holds the axis.
				if DVSAERData_DI(DVS_AER_BUS_WIDTH - 1) = IS_ROW_ADDR then
					-- This is an Y address.
					State_DN <= stAERCaptureRow;
				else
					State_DN <= stAERCaptureCol;
				end if;

			when stAERCaptureRow =>
				-- We might need to delay the ACK.
				if RowCaptureDelayDone_S = '1' then
					ChipAERDataCapture_S <= '1';

					State_DN <= stAERWriteRow;
				end if;

				RowCaptureDelayCount_S <= '1';

			when stAERWriteRow =>
				DVSAERAckReg_SB <= '0';

				-- Row address (Y).
				DVSEventDataReg_D(EVENT_WIDTH - 1 downto EVENT_WIDTH - 3) <= EVENT_CODE_Y_ADDR;

				if CHIP_DVS_ORIGIN_POINT(0) = '1' then
					DVSEventDataReg_D(DVS_ROW_ADDRESS_WIDTH - 1 downto 0) <= std_logic_vector(resize(CHIP_DVS_SIZE_ROWS - 1, DVS_ROW_ADDRESS_WIDTH) - unsigned(ChipAERData_D(DVS_ROW_ADDRESS_WIDTH - 1 downto 0)));
				else
					DVSEventDataReg_D(DVS_ROW_ADDRESS_WIDTH - 1 downto 0) <= ChipAERData_D(DVS_ROW_ADDRESS_WIDTH - 1 downto 0);
				end if;

				DVSEventValidReg_S <= '1';

				StatisticsEventsRow_SN <= '1';

				State_DN <= stAERAck;

			when stAERCaptureCol =>
				ChipAERDataCapture_S <= '1';

				State_DN <= stAERWriteCol;

			when stAERWriteCol =>
				DVSAERAckReg_SB <= '0';

				-- Column address (X).
				DVSEventDataReg_D(EVENT_WIDTH - 1 downto EVENT_WIDTH - 3) <= EVENT_CODE_X_ADDR & ChipAERData_D(0);

				if CHIP_DVS_ORIGIN_POINT(1) = '1' then
					DVSEventDataReg_D(DVS_COLUMN_ADDRESS_WIDTH - 1 downto 0) <= std_logic_vector(resize(CHIP_DVS_SIZE_COLUMNS - 1, DVS_COLUMN_ADDRESS_WIDTH) - unsigned(ChipAERData_D(DVS_COLUMN_ADDRESS_WIDTH downto 1)));
				else
					DVSEventDataReg_D(DVS_COLUMN_ADDRESS_WIDTH - 1 downto 0) <= ChipAERData_D(DVS_COLUMN_ADDRESS_WIDTH downto 1);
				end if;

				DVSEventValidReg_S <= '1';

				StatisticsEventsColumn_SN <= '1';

				State_DN <= stAERAck;

			when stAERAck =>
				DVSAERAckReg_SB <= '0';

				if DVSAERReq_SBI = '1' then
					State_DN <= stIdle;
				end if;

			when others => null;
		end case;
	end process dvsHandleAERComb;

	-- Change state on clock edge (synchronous).
	dvsHandleAERRegisterUpdate : process(Clock_CI, Reset_RI)
	begin
		if Reset_RI = '1' then                -- asynchronous reset (active-high for FPGAs)
			State_DP <= stIdle;

			DVSAERAck_SBO   <= '1';
			DVSAERReset_SBO <= '0';

			DVSAERConfigReg_D <= tDVSAERConfigDefault;
		elsif rising_edge(Clock_CI) then
			State_DP <= State_DN;

			DVSAERAck_SBO   <= DVSAERAckReg_SB;
			DVSAERReset_SBO <= DVSAERResetReg_SB;

			DVSAERConfigReg_D <= DVSAERConfig_DI;
		end if;
	end process dvsHandleAERRegisterUpdate;

	dvsChipAERDataRegister : entity work.SimpleRegister
		generic map(
			SIZE => DVS_AER_BUS_WIDTH)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => ChipAERDataCapture_S,
			Input_SI  => DVSAERData_DI,
			Output_SO => ChipAERData_D);

	dvsEventDataRegister : entity work.SimpleRegister
		generic map(
			SIZE => EVENT_WIDTH)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => DVSEventValidReg_S,
			Input_SI  => DVSEventDataReg_D,
			Output_SO => DVSEventOutDataReg_D);

	dvsEventValidRegister : entity work.SimpleRegister
		generic map(
			SIZE => 1)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Enable_SI    => '1',
			Input_SI(0)  => DVSEventValidReg_S,
			Output_SO(0) => DVSEventOutValidReg_S);

	polarityFilterSupportDisabled : if not ENABLE_POLARITY_FILTERING generate
	begin
		PolarityFilterInDataReg_D  <= DVSEventOutDataReg_D;
		PolarityFilterInValidReg_S <= DVSEventOutValidReg_S;

		PolarityFilterOutDataReg_D  <= PolarityFilterInDataReg_D;
		PolarityFilterOutValidReg_S <= PolarityFilterInValidReg_S;
	end generate polarityFilterSupportDisabled;

	polarityFilterSupportEnabled : if ENABLE_POLARITY_FILTERING generate
		polarityFilter : process(DVSEventOutDataReg_D, DVSEventOutValidReg_S, DVSAERConfigReg_D)
		begin
			PolarityFilterInDataReg_D  <= DVSEventOutDataReg_D;
			PolarityFilterInValidReg_S <= DVSEventOutValidReg_S;

			if DVSEventOutValidReg_S = '1' then
				if DVSEventOutDataReg_D(EVENT_WIDTH - 2) = '1' then
					-- This is a column address, it carries the polarity information.
					-- Flatten: converts all polarities to OFF.
					if(DVSAERConfigReg_D.FilterPolarityFlatten_S = '1') then
                        PolarityFilterInDataReg_D(EVENT_WIDTH - 3) <= '0'; 
                    else 
                        PolarityFilterInDataReg_D(EVENT_WIDTH - 3) <= DVSEventOutDataReg_D(EVENT_WIDTH - 3);
                    end if;
					
					-- Suppress: removes one type of polarity.
					if DVSAERConfigReg_D.FilterPolaritySuppress_S = '1' then
						PolarityFilterInValidReg_S <= BooleanToStdLogic(DVSEventOutDataReg_D(EVENT_WIDTH - 3) /= DVSAERConfigReg_D.FilterPolaritySuppressType_S);
					end if;
				end if;
			end if;
		end process polarityFilter;

		polarityFilterDataRegister : entity work.SimpleRegister
			generic map(
				SIZE => EVENT_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Enable_SI => PolarityFilterInValidReg_S,
				Input_SI  => PolarityFilterInDataReg_D,
				Output_SO => PolarityFilterOutDataReg_D);

		polarityFilterValidRegister : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => PolarityFilterInValidReg_S,
				Output_SO(0) => PolarityFilterOutValidReg_S);
	end generate polarityFilterSupportEnabled;

	roiFilterSupportDisabled : if not ENABLE_ROI_FILTERING generate
	begin
		ROIFilterInDataReg_D  <= PolarityFilterOutDataReg_D;
		ROIFilterInValidReg_S <= PolarityFilterOutValidReg_S;

		ROIFilterOutDataReg_D  <= ROIFilterInDataReg_D;
		ROIFilterOutValidReg_S <= ROIFilterInValidReg_S;
	end generate roiFilterSupportDisabled;

	roiFilterSupportEnabled : if ENABLE_ROI_FILTERING generate
		signal LastRowAddress_DP, LastRowAddress_DN : unsigned(DVS_ROW_ADDRESS_WIDTH - 1 downto 0);

		signal FilterROIStartColumn_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterROIStartRow_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterROIEndColumn_D   : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterROIEndRow_D      : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
	begin
		roiFilterLastRowAddressRegister : entity work.SimpleRegister
			generic map(
				SIZE => DVS_ROW_ADDRESS_WIDTH)
			port map(
				Clock_CI            => Clock_CI,
				Reset_RI            => Reset_RI,
				Enable_SI           => '1',
				Input_SI            => std_logic_vector(LastRowAddress_DN),
				unsigned(Output_SO) => LastRowAddress_DP);

		axesNormal : if CHIP_DVS_AXES_INVERT = AXES_KEEP generate
		begin
			FilterROIStartColumn_D <= resize(DVSAERConfigReg_D.FilterROIStartColumn_D, EVENT_DATA_WIDTH_MAX);
			FilterROIStartRow_D    <= resize(DVSAERConfigReg_D.FilterROIStartRow_D, EVENT_DATA_WIDTH_MAX);
			FilterROIEndColumn_D   <= resize(DVSAERConfigReg_D.FilterROIEndColumn_D, EVENT_DATA_WIDTH_MAX);
			FilterROIEndRow_D      <= resize(DVSAERConfigReg_D.FilterROIEndRow_D, EVENT_DATA_WIDTH_MAX);
		end generate axesNormal;

		axesInverted : if CHIP_DVS_AXES_INVERT = AXES_INVERT generate
		begin
			FilterROIStartColumn_D <= resize(DVSAERConfigReg_D.FilterROIStartRow_D, EVENT_DATA_WIDTH_MAX);
			FilterROIStartRow_D    <= resize(DVSAERConfigReg_D.FilterROIStartColumn_D, EVENT_DATA_WIDTH_MAX);
			FilterROIEndColumn_D   <= resize(DVSAERConfigReg_D.FilterROIEndRow_D, EVENT_DATA_WIDTH_MAX);
			FilterROIEndRow_D      <= resize(DVSAERConfigReg_D.FilterROIEndColumn_D, EVENT_DATA_WIDTH_MAX);
		end generate axesInverted;

		roiFilter : process(PolarityFilterOutDataReg_D, PolarityFilterOutValidReg_S, LastRowAddress_DP, FilterROIEndColumn_D, FilterROIEndRow_D, FilterROIStartColumn_D, FilterROIStartRow_D)
			variable ColumnAddress_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0) := (others => '0');
			variable RowAddress_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0) := (others => '0');

			variable ColumnValid_S    : boolean := false;
			variable RowValid_S       : boolean := false;
			variable ROIFilterValid_S : boolean := false;
		begin
			ROIFilterInDataReg_D  <= PolarityFilterOutDataReg_D;
			ROIFilterInValidReg_S <= PolarityFilterOutValidReg_S;

			LastRowAddress_DN <= LastRowAddress_DP;

			ColumnAddress_D := resize(unsigned(PolarityFilterOutDataReg_D(DVS_COLUMN_ADDRESS_WIDTH - 1 downto 0)), EVENT_DATA_WIDTH_MAX);
			RowAddress_D    := resize(LastRowAddress_DP, EVENT_DATA_WIDTH_MAX);

			ColumnValid_S := ColumnAddress_D >= FilterROIStartColumn_D and ColumnAddress_D <= FilterROIEndColumn_D;
			RowValid_S    := RowAddress_D >= FilterROIStartRow_D and RowAddress_D <= FilterROIEndRow_D;

			ROIFilterValid_S := ColumnValid_S and RowValid_S;

			if PolarityFilterOutValidReg_S = '1' then
				if PolarityFilterOutDataReg_D(EVENT_WIDTH - 2) = '0' then
					-- This is a row address, we just save it.
					LastRowAddress_DN <= unsigned(PolarityFilterOutDataReg_D(DVS_ROW_ADDRESS_WIDTH - 1 downto 0));
				else
					-- This is a column address, we use the full comparison at this point.
					-- If it matches any of the pixels that should be filtered, we set the column
					-- address to be invalid.
					ROIFilterInValidReg_S <= BooleanToStdLogic(ROIFilterValid_S);
				end if;
			end if;
		end process roiFilter;

		roiFilterDataRegister : entity work.SimpleRegister
			generic map(
				SIZE => EVENT_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Enable_SI => ROIFilterInValidReg_S,
				Input_SI  => ROIFilterInDataReg_D,
				Output_SO => ROIFilterOutDataReg_D);

		roiFilterValidRegister : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => ROIFilterInValidReg_S,
				Output_SO(0) => ROIFilterOutValidReg_S);
	end generate roiFilterSupportEnabled;

	pixelFilterSupportDisabled : if not ENABLE_PIXEL_FILTERING generate
	begin
		PixelFilterInDataReg_D  <= ROIFilterOutDataReg_D;
		PixelFilterInValidReg_S <= ROIFilterOutValidReg_S;

		PixelFilterOutDataReg_D  <= PixelFilterInDataReg_D;
		PixelFilterOutValidReg_S <= PixelFilterInValidReg_S;
	end generate pixelFilterSupportDisabled;

	pixelFilterSupportEnabled : if ENABLE_PIXEL_FILTERING generate
		signal LastRowAddress_DP, LastRowAddress_DN : unsigned(DVS_ROW_ADDRESS_WIDTH - 1 downto 0);

		signal FilterPixel0Row_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel0Column_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel1Row_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel1Column_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel2Row_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel2Column_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel3Row_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel3Column_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel4Row_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel4Column_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel5Row_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel5Column_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel6Row_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel6Column_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel7Row_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
		signal FilterPixel7Column_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0);
	begin
		pixelFilterLastRowAddressRegister : entity work.SimpleRegister
			generic map(
				SIZE => DVS_ROW_ADDRESS_WIDTH)
			port map(
				Clock_CI            => Clock_CI,
				Reset_RI            => Reset_RI,
				Enable_SI           => '1',
				Input_SI            => std_logic_vector(LastRowAddress_DN),
				unsigned(Output_SO) => LastRowAddress_DP);

		axesNormal : if CHIP_DVS_AXES_INVERT = AXES_KEEP generate
		begin
			FilterPixel0Row_D    <= resize(DVSAERConfigReg_D.FilterPixel0Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel0Column_D <= resize(DVSAERConfigReg_D.FilterPixel0Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel1Row_D    <= resize(DVSAERConfigReg_D.FilterPixel1Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel1Column_D <= resize(DVSAERConfigReg_D.FilterPixel1Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel2Row_D    <= resize(DVSAERConfigReg_D.FilterPixel2Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel2Column_D <= resize(DVSAERConfigReg_D.FilterPixel2Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel3Row_D    <= resize(DVSAERConfigReg_D.FilterPixel3Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel3Column_D <= resize(DVSAERConfigReg_D.FilterPixel3Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel4Row_D    <= resize(DVSAERConfigReg_D.FilterPixel4Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel4Column_D <= resize(DVSAERConfigReg_D.FilterPixel4Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel5Row_D    <= resize(DVSAERConfigReg_D.FilterPixel5Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel5Column_D <= resize(DVSAERConfigReg_D.FilterPixel5Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel6Row_D    <= resize(DVSAERConfigReg_D.FilterPixel6Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel6Column_D <= resize(DVSAERConfigReg_D.FilterPixel6Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel7Row_D    <= resize(DVSAERConfigReg_D.FilterPixel7Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel7Column_D <= resize(DVSAERConfigReg_D.FilterPixel7Column_D, EVENT_DATA_WIDTH_MAX);
		end generate axesNormal;

		axesInverted : if CHIP_DVS_AXES_INVERT = AXES_INVERT generate
		begin
			FilterPixel0Row_D    <= resize(DVSAERConfigReg_D.FilterPixel0Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel0Column_D <= resize(DVSAERConfigReg_D.FilterPixel0Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel1Row_D    <= resize(DVSAERConfigReg_D.FilterPixel1Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel1Column_D <= resize(DVSAERConfigReg_D.FilterPixel1Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel2Row_D    <= resize(DVSAERConfigReg_D.FilterPixel2Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel2Column_D <= resize(DVSAERConfigReg_D.FilterPixel2Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel3Row_D    <= resize(DVSAERConfigReg_D.FilterPixel3Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel3Column_D <= resize(DVSAERConfigReg_D.FilterPixel3Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel4Row_D    <= resize(DVSAERConfigReg_D.FilterPixel4Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel4Column_D <= resize(DVSAERConfigReg_D.FilterPixel4Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel5Row_D    <= resize(DVSAERConfigReg_D.FilterPixel5Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel5Column_D <= resize(DVSAERConfigReg_D.FilterPixel5Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel6Row_D    <= resize(DVSAERConfigReg_D.FilterPixel6Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel6Column_D <= resize(DVSAERConfigReg_D.FilterPixel6Row_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel7Row_D    <= resize(DVSAERConfigReg_D.FilterPixel7Column_D, EVENT_DATA_WIDTH_MAX);
			FilterPixel7Column_D <= resize(DVSAERConfigReg_D.FilterPixel7Row_D, EVENT_DATA_WIDTH_MAX);
		end generate axesInverted;

		pixelFilter : process(ROIFilterOutDataReg_D, ROIFilterOutValidReg_S, LastRowAddress_DP, FilterPixel0Column_D, FilterPixel0Row_D, FilterPixel1Column_D, FilterPixel1Row_D, FilterPixel2Column_D, FilterPixel2Row_D, FilterPixel3Column_D, FilterPixel3Row_D, FilterPixel4Column_D, FilterPixel4Row_D, FilterPixel5Column_D, FilterPixel5Row_D, FilterPixel6Column_D, FilterPixel6Row_D, FilterPixel7Column_D, FilterPixel7Row_D)
			variable ColumnAddress_D : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0) := (others => '0');
			variable RowAddress_D    : unsigned(EVENT_DATA_WIDTH_MAX - 1 downto 0) := (others => '0');

			variable Pixel0Hit_S : boolean := false;
			variable Pixel1Hit_S : boolean := false;
			variable Pixel2Hit_S : boolean := false;
			variable Pixel3Hit_S : boolean := false;
			variable Pixel4Hit_S : boolean := false;
			variable Pixel5Hit_S : boolean := false;
			variable Pixel6Hit_S : boolean := false;
			variable Pixel7Hit_S : boolean := false;

			variable PixelFilterInvalid_S : boolean := false;
		begin
			PixelFilterInDataReg_D  <= ROIFilterOutDataReg_D;
			PixelFilterInValidReg_S <= ROIFilterOutValidReg_S;

			LastRowAddress_DN <= LastRowAddress_DP;

			StatisticsFilteredPixels_SN <= '0';

			ColumnAddress_D := resize(unsigned(ROIFilterOutDataReg_D(DVS_COLUMN_ADDRESS_WIDTH - 1 downto 0)), EVENT_DATA_WIDTH_MAX);
			RowAddress_D    := resize(LastRowAddress_DP, EVENT_DATA_WIDTH_MAX);

			Pixel0Hit_S := RowAddress_D = FilterPixel0Row_D and ColumnAddress_D = FilterPixel0Column_D;
			Pixel1Hit_S := RowAddress_D = FilterPixel1Row_D and ColumnAddress_D = FilterPixel1Column_D;
			Pixel2Hit_S := RowAddress_D = FilterPixel2Row_D and ColumnAddress_D = FilterPixel2Column_D;
			Pixel3Hit_S := RowAddress_D = FilterPixel3Row_D and ColumnAddress_D = FilterPixel3Column_D;
			Pixel4Hit_S := RowAddress_D = FilterPixel4Row_D and ColumnAddress_D = FilterPixel4Column_D;
			Pixel5Hit_S := RowAddress_D = FilterPixel5Row_D and ColumnAddress_D = FilterPixel5Column_D;
			Pixel6Hit_S := RowAddress_D = FilterPixel6Row_D and ColumnAddress_D = FilterPixel6Column_D;
			Pixel7Hit_S := RowAddress_D = FilterPixel7Row_D and ColumnAddress_D = FilterPixel7Column_D;

			PixelFilterInvalid_S := Pixel0Hit_S or Pixel1Hit_S or Pixel2Hit_S or Pixel3Hit_S or Pixel4Hit_S or Pixel5Hit_S or Pixel6Hit_S or Pixel7Hit_S;

			if ROIFilterOutValidReg_S = '1' then
				if ROIFilterOutDataReg_D(EVENT_WIDTH - 2) = '0' then
					-- This is a row address, we just save it.
					LastRowAddress_DN <= unsigned(ROIFilterOutDataReg_D(DVS_ROW_ADDRESS_WIDTH - 1 downto 0));
				else
					-- This is a column address, we use the full comparison at this point.
					-- If it matches any of the pixels that should be filtered, we set the column
					-- address to be invalid.
					PixelFilterInValidReg_S <= BooleanToStdLogic(not PixelFilterInvalid_S);

					StatisticsFilteredPixels_SN <= BooleanToStdLogic(PixelFilterInvalid_S);
				end if;
			end if;
		end process pixelFilter;

		pixelFilterDataRegister : entity work.SimpleRegister
			generic map(
				SIZE => EVENT_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Enable_SI => PixelFilterInValidReg_S,
				Input_SI  => PixelFilterInDataReg_D,
				Output_SO => PixelFilterOutDataReg_D);

		pixelFilterValidRegister : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => PixelFilterInValidReg_S,
				Output_SO(0) => PixelFilterOutValidReg_S);
	end generate pixelFilterSupportEnabled;

	baRefrFilterSupportDisabled : if not ENABLE_BA_REFR_FILTERING generate
	begin
		BARefrFilterInDataReg_D  <= PixelFilterOutDataReg_D;
		BARefrFilterInValidReg_S <= PixelFilterOutValidReg_S;

		BARefrFilterOutDataReg_D  <= BARefrFilterInDataReg_D;
		BARefrFilterOutValidReg_S <= BARefrFilterInValidReg_S;
	end generate baRefrFilterSupportDisabled;

	baRefrFilterSupportEnabled : if ENABLE_BA_REFR_FILTERING generate
		baFilter : entity work.DVSBAFilterStateMachine
			generic map(
				BA_FILTER_SUBSAMPLE_COLUMN => BA_FILTER_SUBSAMPLE_COLUMN,
				BA_FILTER_SUBSAMPLE_ROW    => BA_FILTER_SUBSAMPLE_ROW)
			port map(
				Clock_CI                                => Clock_CI,
				Reset_RI                                => Reset_RI,
				FilterBackgroundActivity_SI             => DVSAERConfigReg_D.FilterBackgroundActivity_S,
				FilterBackgroundActivityTime_DI         => DVSAERConfigReg_D.FilterBackgroundActivityTime_D,
				FilterRefractoryPeriod_SI               => DVSAERConfigReg_D.FilterRefractoryPeriod_S,
				FilterRefractoryPeriodTime_DI           => DVSAERConfigReg_D.FilterRefractoryPeriodTime_D,
				StatisticsFilteredBackgroundActivity_SO => StatisticsFilteredBackgroundActivity_SN,
				StatisticsFilteredRefractoryPeriod_SO   => StatisticsFilteredRefractoryPeriod_SN,
				BAFilterInputData_DI                    => PixelFilterOutDataReg_D,
				BAFilterInputValid_SI                   => PixelFilterOutValidReg_S,
				BAFilterOutputData_DO                   => BARefrFilterInDataReg_D,
				BAFilterOutputValid_SO                  => BARefrFilterInValidReg_S);

		baFilterDataRegister : entity work.SimpleRegister
			generic map(
				SIZE => EVENT_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Enable_SI => BARefrFilterInValidReg_S,
				Input_SI  => BARefrFilterInDataReg_D,
				Output_SO => BARefrFilterOutDataReg_D);

		baFilterValidRegister : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => BARefrFilterInValidReg_S,
				Output_SO(0) => BARefrFilterOutValidReg_S);
	end generate baRefrFilterSupportEnabled;

	skipFilterSupportDisabled : if not ENABLE_SKIP_FILTERING generate
	begin
		SkipFilterInDataReg_D  <= BARefrFilterOutDataReg_D;
		SkipFilterInValidReg_S <= BARefrFilterOutValidReg_S;

		SkipFilterOutDataReg_D  <= SkipFilterInDataReg_D;
		SkipFilterOutValidReg_S <= SkipFilterInValidReg_S;
	end generate skipFilterSupportDisabled;

	skipFilterSupportEnabled : if ENABLE_SKIP_FILTERING generate
		signal FilterSkipCounterIncrement_S : std_logic;
		signal FilterSkipCounterSuppress_S  : std_logic;
	begin
		skipCounter : entity work.ContinuousCounter
			generic map(
				SIZE              => DVS_FILTER_SKIP_EVENTS_WIDTH,
				RESET_ON_OVERFLOW => true,
				GENERATE_OVERFLOW => true)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Clear_SI     => '0',
				Enable_SI    => FilterSkipCounterIncrement_S,
				DataLimit_DI => DVSAERConfigReg_D.FilterSkipEventsEvery_D,
				Overflow_SO  => FilterSkipCounterSuppress_S,
				Data_DO      => open);

		skipFilter : process(BARefrFilterOutDataReg_D, BARefrFilterOutValidReg_S, DVSAERConfigReg_D, FilterSkipCounterSuppress_S)
		begin
			SkipFilterInDataReg_D  <= BARefrFilterOutDataReg_D;
			SkipFilterInValidReg_S <= BARefrFilterOutValidReg_S;

			FilterSkipCounterIncrement_S <= '0';

			if DVSAERConfigReg_D.FilterSkipEvents_S = '1' and BARefrFilterOutValidReg_S = '1' and BARefrFilterOutDataReg_D(EVENT_WIDTH - 2) = '1' then
				-- This is a valid column address. If the filter is enabled, we count it,
				-- and when we reach the limit of the counter, we suppress that event (skip it).
				FilterSkipCounterIncrement_S <= '1';

				SkipFilterInValidReg_S <= not FilterSkipCounterSuppress_S;
			end if;
		end process skipFilter;

		skipFilterDataRegister : entity work.SimpleRegister
			generic map(
				SIZE => EVENT_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Enable_SI => SkipFilterInValidReg_S,
				Input_SI  => SkipFilterInDataReg_D,
				Output_SO => SkipFilterOutDataReg_D);

		skipFilterValidRegister : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => SkipFilterInValidReg_S,
				Output_SO(0) => SkipFilterOutValidReg_S);
	end generate skipFilterSupportEnabled;

	rowOnlyFilter : process(SkipFilterOutDataReg_D, SkipFilterOutValidReg_S, RowOnlyFilterOutDataReg_D)
	begin
		RowOnlyFilterInDataReg_D  <= SkipFilterOutDataReg_D;
		RowOnlyFilterInValidReg_S <= SkipFilterOutValidReg_S;

		-- Bypass register and control FIFO directly.
		RowOnlyFilterPassRow_S <= '0';

		if SkipFilterOutValidReg_S = '1' then
			if SkipFilterOutDataReg_D(EVENT_WIDTH - 2) = '0' then
				-- This is a row address, we force it to be invalid, so that it is not automatically
				-- forwarded to the FIFO. We'll forward it later when encountering a column address.
				RowOnlyFilterInValidReg_S <= '0';
			else
				-- Column address, we pass the previously stored row to FIFO at this point.
				-- But only if the previously stored value was indeed a row, to avoid also
				-- sending column addresses twice.
				-- The column address will go to the register and be forwarded as usual one
				-- cycle later, due to being a valid event.
				if RowOnlyFilterOutDataReg_D(EVENT_WIDTH - 2) = '0' then
					RowOnlyFilterPassRow_S <= '1';
				end if;
			end if;
		end if;
	end process rowOnlyFilter;

	rowOnlyFilterDataRegister : entity work.SimpleRegister
		generic map(
			SIZE => EVENT_WIDTH)
		port map(
			Clock_CI  => Clock_CI,
			Reset_RI  => Reset_RI,
			Enable_SI => '1',
			Input_SI  => RowOnlyFilterInDataReg_D,
			Output_SO => RowOnlyFilterOutDataReg_D);

	rowOnlyFilterValidRegister : entity work.SimpleRegister
		generic map(
			SIZE => 1)
		port map(
			Clock_CI     => Clock_CI,
			Reset_RI     => Reset_RI,
			Enable_SI    => '1',
			Input_SI(0)  => RowOnlyFilterInValidReg_S,
			Output_SO(0) => RowOnlyFilterOutValidReg_S);

	OutFifoData_DO            <= RowOnlyFilterOutDataReg_D;
	OutFifoControl_SO.Write_S <= RowOnlyFilterOutValidReg_S or RowOnlyFilterPassRow_S;

    NOTDVSAERConfigReg_DRun_S <= not DVSAERConfigReg_D.Run_S;
	statisticsSupport : if ENABLE_STATISTICS generate
		StatisticsEventsRowReg : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => StatisticsEventsRow_SN,
				Output_SO(0) => StatisticsEventsRow_SP);

		StatisticsEventsRowCounter : entity work.Counter
			generic map(
				SIZE => TRANSACTION_COUNTER_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Clear_SI  => NOTDVSAERConfigReg_DRun_S,
				Enable_SI => StatisticsEventsRow_SP,
				Data_DO   => DVSAERConfigInfoOut_DO.StatisticsEventsRow_D);

		StatisticsEventsColumnReg : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => StatisticsEventsColumn_SN,
				Output_SO(0) => StatisticsEventsColumn_SP);

		StatisticsEventsColumnCounter : entity work.Counter
			generic map(
				SIZE => TRANSACTION_COUNTER_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Clear_SI  => NOTDVSAERConfigReg_DRun_S,
				Enable_SI => StatisticsEventsColumn_SP,
				Data_DO   => DVSAERConfigInfoOut_DO.StatisticsEventsColumn_D);

		StatisticsEventsDroppedReg : entity work.SimpleRegister
			generic map(
				SIZE => 1)
			port map(
				Clock_CI     => Clock_CI,
				Reset_RI     => Reset_RI,
				Enable_SI    => '1',
				Input_SI(0)  => StatisticsEventsDropped_SN,
				Output_SO(0) => StatisticsEventsDropped_SP);

		StatisticsEventsDroppedCounter : entity work.Counter
			generic map(
				SIZE => TRANSACTION_COUNTER_WIDTH)
			port map(
				Clock_CI  => Clock_CI,
				Reset_RI  => Reset_RI,
				Clear_SI  => NOTDVSAERConfigReg_DRun_S,
				Enable_SI => StatisticsEventsDropped_SP,
				Data_DO   => DVSAERConfigInfoOut_DO.StatisticsEventsDropped_D);

		StatisticsFilteredPixels : if ENABLE_PIXEL_FILTERING generate
		begin
			StatisticsFilteredPixelsReg : entity work.SimpleRegister
				generic map(
					SIZE => 1)
				port map(
					Clock_CI     => Clock_CI,
					Reset_RI     => Reset_RI,
					Enable_SI    => '1',
					Input_SI(0)  => StatisticsFilteredPixels_SN,
					Output_SO(0) => StatisticsFilteredPixels_SP);

			StatisticsFilteredPixelsCounter : entity work.Counter
				generic map(
					SIZE => TRANSACTION_COUNTER_WIDTH)
				port map(
					Clock_CI  => Clock_CI,
					Reset_RI  => Reset_RI,
					Clear_SI  => NOTDVSAERConfigReg_DRun_S,
					Enable_SI => StatisticsFilteredPixels_SP,
					Data_DO   => DVSAERConfigInfoOut_DO.StatisticsFilteredPixels_D);
		end generate StatisticsFilteredPixels;

		noStatisticsFilteredPixels : if not ENABLE_PIXEL_FILTERING generate
		begin
			DVSAERConfigInfoOut_DO.StatisticsFilteredPixels_D <= (others => '0');
		end generate noStatisticsFilteredPixels;

		StatisticsFilteredBackgroundActivity : if ENABLE_BA_REFR_FILTERING generate
		begin
			StatisticsFilteredBackgroundActivityReg : entity work.SimpleRegister
				generic map(
					SIZE => 1)
				port map(
					Clock_CI     => Clock_CI,
					Reset_RI     => Reset_RI,
					Enable_SI    => '1',
					Input_SI(0)  => StatisticsFilteredBackgroundActivity_SN,
					Output_SO(0) => StatisticsFilteredBackgroundActivity_SP);

			StatisticsFilteredBackgroundActivityCounter : entity work.Counter
				generic map(
					SIZE => TRANSACTION_COUNTER_WIDTH)
				port map(
					Clock_CI  => Clock_CI,
					Reset_RI  => Reset_RI,
					Clear_SI  => NOTDVSAERConfigReg_DRun_S,
					Enable_SI => StatisticsFilteredBackgroundActivity_SP,
					Data_DO   => DVSAERConfigInfoOut_DO.StatisticsFilteredBackgroundActivity_D);

			StatisticsFilteredRefractoryPeriodReg : entity work.SimpleRegister
				generic map(
					SIZE => 1)
				port map(
					Clock_CI     => Clock_CI,
					Reset_RI     => Reset_RI,
					Enable_SI    => '1',
					Input_SI(0)  => StatisticsFilteredRefractoryPeriod_SN,
					Output_SO(0) => StatisticsFilteredRefractoryPeriod_SP);

			StatisticsFilteredRefractoryPeriodCounter : entity work.Counter
				generic map(
					SIZE => TRANSACTION_COUNTER_WIDTH)
				port map(
					Clock_CI  => Clock_CI,
					Reset_RI  => Reset_RI,
					Clear_SI  => NOTDVSAERConfigReg_DRun_S,
					Enable_SI => StatisticsFilteredRefractoryPeriod_SP,
					Data_DO   => DVSAERConfigInfoOut_DO.StatisticsFilteredRefractoryPeriod_D);
		end generate StatisticsFilteredBackgroundActivity;

		noStatisticsFilteredBackgroundActivity : if not ENABLE_BA_REFR_FILTERING generate
		begin
			DVSAERConfigInfoOut_DO.StatisticsFilteredBackgroundActivity_D <= (others => '0');
			DVSAERConfigInfoOut_DO.StatisticsFilteredRefractoryPeriod_D   <= (others => '0');
		end generate noStatisticsFilteredBackgroundActivity;
	end generate statisticsSupport;

	noStatisticsSupport : if not ENABLE_STATISTICS generate
		DVSAERConfigInfoOut_DO <= tDVSAERConfigInfoOutDefault;
	end generate noStatisticsSupport;
end Behavioral;
