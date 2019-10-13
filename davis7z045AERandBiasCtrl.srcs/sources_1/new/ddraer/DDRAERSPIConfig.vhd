library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.DDRAERConfigRecords.all;

entity DDRAERSPIConfig is
	port(
		Clock_CI                   : in  std_logic;
		Reset_RI                   : in  std_logic;
		DDRAERConfig_DO            : out tDDRAERConfig;

		-- SPI configuration inputs and outputs.
		ConfigModuleAddress_DI     : in  unsigned(6 downto 0);
		ConfigParamAddress_DI      : in  unsigned(7 downto 0);
		ConfigParamInput_DI        : in  std_logic_vector(31 downto 0);
		ConfigLatchInput_SI        : in  std_logic;
		DDRAERConfigParamOutput_DO : out std_logic_vector(31 downto 0));
end entity DDRAERSPIConfig;

architecture Behavioral of DDRAERSPIConfig is
	signal LatchDDRAERReg_S                       : std_logic;
	signal DDRAEROutput_DP, DDRAEROutput_DN       : std_logic_vector(31 downto 0);
	signal DDRAERConfigReg_DP, DDRAERConfigReg_DN : tDDRAERConfig;
begin
	DDRAERConfig_DO            <= DDRAERConfigReg_DP;
	DDRAERConfigParamOutput_DO <= DDRAEROutput_DP;

	LatchDDRAERReg_S <= '1' when (ConfigModuleAddress_DI = DDR_AER_CONFIG_MODULE_ADDRESS) else '0';

	ddrAerIO : process(ConfigParamAddress_DI, ConfigParamInput_DI, DDRAERConfigReg_DP)
	begin
		DDRAERConfigReg_DN <= DDRAERConfigReg_DP;
		DDRAEROutput_DN    <= (others => '0');

		case ConfigParamAddress_DI is
			when DDR_AER_CONFIG_PARAM_ADDRESSES.Run_S =>
				DDRAERConfigReg_DN.Run_S <= ConfigParamInput_DI(0);
				DDRAEROutput_DN(0)       <= DDRAERConfigReg_DP.Run_S;

			when others => null;
		end case;
	end process ddrAerIO;

	ddrAerUpdate : process(Clock_CI, Reset_RI) is
	begin
		if Reset_RI then                -- asynchronous reset (active high)
			DDRAEROutput_DP <= (others => '0');

			DDRAERConfigReg_DP <= tDDRAERConfigDefault;
		elsif rising_edge(Clock_CI) then -- rising clock edge
			DDRAEROutput_DP <= DDRAEROutput_DN;

			if LatchDDRAERReg_S and ConfigLatchInput_SI then
				DDRAERConfigReg_DP <= DDRAERConfigReg_DN;
			end if;
		end if;
	end process ddrAerUpdate;
end architecture Behavioral;
