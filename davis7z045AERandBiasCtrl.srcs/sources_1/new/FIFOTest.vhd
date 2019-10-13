----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2019 07:42:46 PM
-- Design Name: 
-- Module Name: FIFOTest - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.Settings.DEVICE_FAMILY;
use work.FIFORecords.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFOTest is
	generic(
    DATA_WIDTH        : integer :=16;
    DATA_DEPTH        : integer;
    ALMOST_EMPTY_FLAG : integer;
    ALMOST_FULL_FLAG  : integer;
    MEMORY            : string := "EBR");
port(
    WrClock_CI     : in  std_logic;
    WrReset_RI     : in  std_logic;
    RdClock_CI     : in  std_logic;
    RdReset_RI     : in  std_logic;
    WriteEN        : in  std_logic;
    AlmostFull_S   : out  std_logic;
    Full_S         : out  std_logic;
    FifoData_DI    : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
    FifoData_DO    : out std_logic_vector(DATA_WIDTH - 1 downto 0));
end FIFOTest;

architecture Behavioral of FIFOTest is
    signal FIFOState_S : tFromFifoReadSide;
    signal FIFORead_S  : tToFifoReadSide;
    signal FIFOData_D  : std_logic_vector(DATA_WIDTH - 1 downto 0);
begin
-- Use double-clock FIFO from the Lattice Portable Module Interfaces.
-- This is a more portable variation than what you'd get with the other tools,
-- but slightly less configurable. It has everything we need though, and allows
-- for easy switching between underlying hardware implementations and tuning.
--    fifoDualClock : component work.pmi_components.pmi_fifo_dc
--        generic map(
--            pmi_data_width_w      => DATA_WIDTH,
--            pmi_data_width_r      => DATA_WIDTH,
--            pmi_data_depth_w      => DATA_DEPTH,
--            pmi_data_depth_r      => DATA_DEPTH,
--            pmi_full_flag         => DATA_DEPTH,
--            pmi_empty_flag        => 0,
--            pmi_almost_full_flag  => DATA_DEPTH - ALMOST_FULL_FLAG,
--            pmi_almost_empty_flag => ALMOST_EMPTY_FLAG,
--            pmi_regmode           => "noreg",
--            pmi_resetmode         => "async",
--            pmi_family            => DEVICE_FAMILY,
--            pmi_implementation    => MEMORY)
--        port map(
--            Data        => FifoData_DI,
--            WrClock     => WrClock_CI,
--            RdClock     => RdClock_CI,
--            WrEn        => FifoControl_SI.WriteSide.Write_S,
--            RdEn        => FIFORead_S.Read_S,
--            Reset       => WrReset_RI,
--            RPReset     => WrReset_RI,
--            Q           => FIFOData_D,
--            Empty       => FIFOState_S.Empty_S,
--            Full        => FifoControl_SO.WriteSide.Full_S,
--            AlmostEmpty => FIFOState_S.AlmostEmpty_S,
--            AlmostFull  => FifoControl_SO.WriteSide.AlmostFull_S);
    fifoDualClock : FIFO18E1
    generic map (
    ALMOST_EMPTY_OFFSET => X"0080",   -- Sets the almost empty threshold
    ALMOST_FULL_OFFSET => X"0080",    -- Sets almost full threshold
    DATA_WIDTH => DATA_WIDTH,                  -- Sets data width to 4-36
    DO_REG => 1,                      -- Enable output register (1-0) Must be 1 if EN_SYN = FALSE
    EN_SYN => FALSE,                  -- Specifies FIFO as dual-clock (FALSE) or Synchronous (TRUE)
    FIFO_MODE => "FIFO18",            -- Sets mode to FIFO18 or FIFO18_36
    FIRST_WORD_FALL_THROUGH => FALSE, -- Sets the FIFO FWFT to FALSE, TRUE
    INIT => X"0000",             -- Initial values on output port
    SIM_DEVICE => "7SERIES",          -- Must be set to "7SERIES" for simulation behavior
    SRVAL => X"0000"             -- Set/Reset value for output port
    )
    port map (
    -- Read Data: 32-bit (each) output: Read output data
    DO => FIFOData_D,                   -- 32-bit output: Data output
    DOP => open,                 -- 4-bit output: Parity data output
    -- Status: 1-bit (each) output: Flags and other FIFO status outputs
    ALMOSTEMPTY => FIFOState_S.AlmostEmpty_S, -- 1-bit output: Almost empty flag
    ALMOSTFULL => AlmostFull_S,   -- 1-bit output: Almost full flag
    EMPTY => FIFOState_S.Empty_S,             -- 1-bit output: Empty flag
    FULL => Full_S,               -- 1-bit output: Full flag
    RDCOUNT => open,         -- 12-bit output: Read count
    RDERR => open,             -- 1-bit output: Read error
    WRCOUNT => open,         -- 12-bit output: Write count
    WRERR => open,             -- 1-bit output: Write error
    -- Read Control Signals: 1-bit (each) input: Read clock, enable and reset input signals
    RDCLK => RdClock_CI,             -- 1-bit input: Read clock
    RDEN => FIFORead_S.Read_S,               -- 1-bit input: Read enable
    REGCE => '1',             -- 1-bit input: Clock enable
    RST => WrReset_RI,                 -- 1-bit input: Asynchronous Reset
    RSTREG => WrReset_RI,           -- 1-bit input: Output register set/reset
    -- Write Control Signals: 1-bit (each) input: Write clock and enable input signals
    WRCLK => WrClock_CI,             -- 1-bit input: Write clock
    WREN => WriteEN,               -- 1-bit input: Write enable
    -- Write Data: 32-bit (each) input: Write input data
    DI => FifoData_DI,                   -- 32-bit input: Data input
    DIP => X"0"                  -- 4-bit input: Parity input
    );


end Behavioral;
