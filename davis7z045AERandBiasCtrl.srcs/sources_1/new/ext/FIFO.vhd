library ieee;
use ieee.std_logic_1164.all;
Library UNISIM;
use UNISIM.vcomponents.all;

Library UNIMACRO;
use UNIMACRO.vcomponents.all;
use work.Settings.DEVICE_FAMILY;
use work.FIFORecords.all;

entity FIFO is
	generic(
		DATA_WIDTH        : integer;
		DATA_DEPTH        : integer;
		ALMOST_EMPTY_FLAG : integer;
		ALMOST_FULL_FLAG  : integer;
		MEMORY            : string := "EBR");
	port(
		Clock_CI       : in  std_logic;
		Reset_RI       : in  std_logic;
		FifoControl_SI : in  tToFifo;
		FifoControl_SO : out tFromFifo;
		FifoData_DI    : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
		FifoData_DO    : out std_logic_vector(DATA_WIDTH - 1 downto 0));
end entity FIFO;

architecture Structural of FIFO is
	signal FIFOState_S : tFromFifoReadSide;
	signal FIFORead_S  : tToFifoReadSide;
	signal FIFOData_D  : std_logic_vector(DATA_WIDTH - 1 downto 0);
	
    signal RDERR :      std_logic := '0';
    signal WRERR :      std_logic := '0';  
    signal RDCOUNT :    std_logic_vector(9 downto 0) := (others => '0');
    signal WRCOUNT :    std_logic_vector(9 downto 0) := (others => '0');  
begin
--	fifo : component work.pmi_components.pmi_fifo
--		generic map(
--			pmi_data_width        => DATA_WIDTH,
--			pmi_data_depth        => DATA_DEPTH,
--			pmi_full_flag         => DATA_DEPTH,
--			pmi_empty_flag        => 0,
--			pmi_almost_full_flag  => DATA_DEPTH - ALMOST_FULL_FLAG,
--			pmi_almost_empty_flag => ALMOST_EMPTY_FLAG,
--			pmi_regmode           => "noreg",
--			pmi_family            => DEVICE_FAMILY,
--			pmi_implementation    => MEMORY)
--		port map(
--			Data        => FifoData_DI,
--			Clock       => Clock_CI,
--			WrEn        => FifoControl_SI.WriteSide.Write_S,
--			RdEn        => FIFORead_S.Read_S,
--			Reset       => Reset_RI,
--			Q           => FIFOData_D,
--			Empty       => FIFOState_S.Empty_S,
--			Full        => FifoControl_SO.WriteSide.Full_S,
--			AlmostEmpty => FIFOState_S.AlmostEmpty_S,
--			AlmostFull  => FifoControl_SO.WriteSide.AlmostFull_S);
  fifo : FIFO_SYNC_MACRO
     generic map (
        DEVICE => "7SERIES",            -- Target Device: "VIRTEX5, "VIRTEX6", "7SERIES" 
        ALMOST_FULL_OFFSET => X"0080",  -- Sets almost full threshold
        ALMOST_EMPTY_OFFSET => X"0080", -- Sets the almost empty threshold
        DATA_WIDTH => DATA_WIDTH,   -- Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
        FIFO_SIZE => "18Kb")            -- Target BRAM, "18Kb" or "36Kb" 
     port map (
        ALMOSTEMPTY => FIFOState_S.AlmostEmpty_S,   -- 1-bit output almost empty
        ALMOSTFULL => FifoControl_SO.WriteSide.AlmostFull_S,     -- 1-bit output almost full
        DO => FIFOData_D,                     -- Output data, width defined by DATA_WIDTH parameter
        EMPTY => FIFOState_S.Empty_S,               -- 1-bit output empty
        FULL => FifoControl_SO.WriteSide.Full_S,                 -- 1-bit output full
        RDCOUNT => RDCOUNT,           -- Output read count, width determined by FIFO depth
        RDERR => RDERR,               -- 1-bit output read error
        WRCOUNT => WRCOUNT,           -- Output write count, width determined by FIFO depth
        WRERR => WRERR,               -- 1-bit output write error
        CLK => Clock_CI,                   -- 1-bit input clock
        DI => FifoData_DI,                     -- Input data, width defined by DATA_WIDTH parameter
        RDEN => FIFORead_S.Read_S,                 -- 1-bit input read enable
        RST => Reset_RI,                   -- 1-bit input reset
        WREN => FifoControl_SI.WriteSide.Write_S                  -- 1-bit input write enable
 );

	readSideOutputDelayReg : entity work.FIFOReadSideDelay
		generic map(
			DATA_WIDTH => DATA_WIDTH)
		port map(
			Clock_CI          => Clock_CI,
			Reset_RI          => Reset_RI,
			InFifoControl_SI  => FIFOState_S,
			InFifoControl_SO  => FIFORead_S,
			OutFifoControl_SI => FifoControl_SI.ReadSide,
			OutFifoControl_SO => FifoControl_SO.ReadSide,
			FifoData_DI       => FIFOData_D,
			FifoData_DO       => FifoData_DO);
end architecture Structural;