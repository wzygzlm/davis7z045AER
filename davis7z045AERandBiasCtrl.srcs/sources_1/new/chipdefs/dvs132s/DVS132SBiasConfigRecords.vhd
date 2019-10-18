library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.DVS132S.BIAS_REG_LENGTH;

package DVS132SBiasConfigRecords is
	constant BIAS_CONFIG_MODULE_ADDRESS : unsigned(6 downto 0) := to_unsigned(5, 7);

	type tDVS132SBiasConfigParamAddresses is record
		Bias_D      : unsigned(7 downto 0);
		BiasWrite_S : unsigned(7 downto 0);
	end record tDVS132SBiasConfigParamAddresses;

	constant DVS132S_BIAS_CONFIG_PARAM_ADDRESSES : tDVS132SBiasConfigParamAddresses := (
		Bias_D      => to_unsigned(0, 8),
		BiasWrite_S => to_unsigned(1, 8));

	type tDVS132SBiasConfig is record
		Bias_D      : std_logic_vector(BIAS_REG_LENGTH - 1 downto 0);
		BiasWrite_S : std_logic;
	end record tDVS132SBiasConfig;

	constant tDVS132SBiasConfigDefault : tDVS132SBiasConfig := (
		Bias_D      => (others => '0'),
		BiasWrite_S => '0');
end package DVS132SBiasConfigRecords;
