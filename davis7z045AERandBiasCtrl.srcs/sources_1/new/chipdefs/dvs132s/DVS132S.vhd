library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package DVS132S is
	constant CHIP_IDENTIFIER : unsigned(3 downto 0) := to_unsigned(15, 4);

	constant CHIP_DVS_SIZE_ROWS    : unsigned(7 downto 0) := to_unsigned(132, 8);
	constant CHIP_DVS_SIZE_COLUMNS : unsigned(6 downto 0) := to_unsigned(104, 7);

	constant DVS_BUS_SIZE  : integer                                     := 8;
	constant DVS_ADDR_SIZE : integer                                     := maximum(CHIP_DVS_SIZE_ROWS'length, CHIP_DVS_SIZE_COLUMNS'length);
	constant DVS_YEND      : std_logic_vector(DVS_BUS_SIZE - 1 downto 0) := "10111000";
	constant DVS_XEND      : std_logic_vector(DVS_BUS_SIZE - 1 downto 0) := "10110010";

	constant ARRAY_CFG_REG_LENGTH : integer := 123;

	constant ARRAY_PIXEL_GROUP_SIZE : integer := 4;

	constant BIAS_REG_LENGTH : integer := 24;
end package DVS132S;
