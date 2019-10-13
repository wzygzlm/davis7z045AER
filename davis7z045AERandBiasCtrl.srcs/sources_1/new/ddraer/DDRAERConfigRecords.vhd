library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package DDRAERConfigRecords is
	constant DDR_AER_CONFIG_MODULE_ADDRESS : unsigned(6 downto 0) := to_unsigned(9, 7);

	type tDDRAERConfigParamAddresses is record
		Run_S : unsigned(7 downto 0);
	end record tDDRAERConfigParamAddresses;

	constant DDR_AER_CONFIG_PARAM_ADDRESSES : tDDRAERConfigParamAddresses := (
		Run_S => to_unsigned(0, 8));

	type tDDRAERConfig is record
		Run_S : std_logic;
	end record tDDRAERConfig;

	constant tDDRAERConfigDefault : tDDRAERConfig := (
		Run_S => '0');
end package DDRAERConfigRecords;
