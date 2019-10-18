library ieee;
use ieee.std_logic_1164.all;
Library UNISIM;
use UNISIM.vcomponents.all;

Library UNIMACRO;
use UNIMACRO.vcomponents.all;
use work.Settings.DEVICE_FAMILY;
use work.FIFORecords.all;

entity FIFODualClock is
	generic(
		DATA_WIDTH        : integer;
		DATA_DEPTH        : integer;
		ALMOST_EMPTY_FLAG : integer;
		ALMOST_FULL_FLAG  : integer;
		MEMORY            : string := "EBR");
	port(
		WrClock_CI     : in  std_logic;
		WrReset_RI     : in  std_logic;
		RdClock_CI     : in  std_logic;
		RdReset_RI     : in  std_logic;
		FifoControl_SI : in  tToFifo;
		FifoControl_SO : out tFromFifo;
		FifoData_DI    : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
		FifoData_DO    : out std_logic_vector(DATA_WIDTH - 1 downto 0));
end entity FIFODualClock;

architecture Structural of FIFODualClock is
	signal FIFOState_S : tFromFifoReadSide;
	signal FIFORead_S  : tToFifoReadSide;
	signal FIFOData_D  : std_logic_vector(DATA_WIDTH - 1 downto 0);
begin
	-- Use double-clock FIFO from the Lattice Portable Module Interfaces.
	-- This is a more portable variation than what you'd get with the other tools,
	-- but slightly less configurable. It has everything we need though, and allows
	-- for easy switching between underlying hardware implementations and tuning.
--	fifoDualClock : component work.pmi_components.pmi_fifo_dc
--		generic map(
--			pmi_data_width_w      => DATA_WIDTH,
--			pmi_data_width_r      => DATA_WIDTH,
--			pmi_data_depth_w      => DATA_DEPTH,
--			pmi_data_depth_r      => DATA_DEPTH,
--			pmi_full_flag         => DATA_DEPTH,
--			pmi_empty_flag        => 0,
--			pmi_almost_full_flag  => DATA_DEPTH - ALMOST_FULL_FLAG,
--			pmi_almost_empty_flag => ALMOST_EMPTY_FLAG,
--			pmi_regmode           => "noreg",
--			pmi_resetmode         => "async",
--			pmi_family            => DEVICE_FAMILY,
--			pmi_implementation    => MEMORY)
--		port map(
--			Data        => FifoData_DI,
--			WrClock     => WrClock_CI,
--			RdClock     => RdClock_CI,
--			WrEn        => FifoControl_SI.WriteSide.Write_S,
--			RdEn        => FIFORead_S.Read_S,
--			Reset       => WrReset_RI,
--			RPReset     => WrReset_RI,
--			Q           => FIFOData_D,
--			Empty       => FIFOState_S.Empty_S,
--			Full        => FifoControl_SO.WriteSide.Full_S,
--			AlmostEmpty => FIFOState_S.AlmostEmpty_S,
--			AlmostFull  => FifoControl_SO.WriteSide.AlmostFull_S);
   fifoDualClock : FIFO_DUALCLOCK_MACRO
        generic map (
           DEVICE => "7SERIES",            -- Target Device: "VIRTEX5", "VIRTEX6", "7SERIES" 
           ALMOST_FULL_OFFSET => X"0080",  -- Sets almost full threshold
           ALMOST_EMPTY_OFFSET => X"0080", -- Sets the almost empty threshold
           DATA_WIDTH => DATA_WIDTH,   -- Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
           FIFO_SIZE => "18Kb",            -- Target BRAM, "18Kb" or "36Kb" 
           FIRST_WORD_FALL_THROUGH => FALSE) -- Sets the FIFO FWFT to TRUE or FALSE
        port map (
           ALMOSTEMPTY => FIFOState_S.AlmostEmpty_S,   -- 1-bit output almost empty
           ALMOSTFULL => FifoControl_SO.WriteSide.AlmostFull_S,     -- 1-bit output almost full
           DO => FIFOData_D,                     -- Output data, width defined by DATA_WIDTH parameter
           EMPTY => FIFOState_S.Empty_S,               -- 1-bit output empty
           FULL => FifoControl_SO.WriteSide.Full_S,                 -- 1-bit output full
           RDCOUNT => open,           -- Output read count, width determined by FIFO depth
           RDERR => open,               -- 1-bit output read error
           WRCOUNT => open,           -- Output write count, width determined by FIFO depth
           WRERR => open,               -- 1-bit output write error
           DI => FifoData_DI,                     -- Input data, width defined by DATA_WIDTH parameter
           RDCLK => RdClock_CI,               -- 1-bit input read clock
           RDEN => FIFORead_S.Read_S,                 -- 1-bit input read enable
           RST => WrReset_RI,                   -- 1-bit input reset
           WRCLK => WrClock_CI,               -- 1-bit input write clock
           WREN => FifoControl_SI.WriteSide.Write_S                  -- 1-bit input write enable
        );
	readSideOutputDelayReg : entity work.FIFOReadSideDelay
		generic map(
			DATA_WIDTH => DATA_WIDTH)
		port map(
			Clock_CI          => RdClock_CI,
			Reset_RI          => RdReset_RI,
			InFifoControl_SI  => FIFOState_S,
			InFifoControl_SO  => FIFORead_S,
			OutFifoControl_SI => FifoControl_SI.ReadSide,
			OutFifoControl_SO => FifoControl_SO.ReadSide,
			FifoData_DI       => FIFOData_D,
			FifoData_DO       => FifoData_DO);
end architecture Structural;