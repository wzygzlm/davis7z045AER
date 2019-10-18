library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.DVS132SBiasConfigRecords.all;
-------------------------------------------------------------------------------

entity DVS132SBias_tb is
end entity DVS132SBias_tb;

-------------------------------------------------------------------------------

architecture Testbench of DVS132SBias_tb is
	-- component ports
	signal Clock_C               : std_logic;
	signal Reset_R               : std_logic;
	signal BiasClock_C           : std_logic;
	signal BiasData_D            : std_logic;
	signal BiasUpdate_S          : std_logic;
	signal BiasDrive_S           : std_logic;
	signal BiasTie_SB            : std_logic;
	signal BiasEnable_S          : std_logic;
	signal ConfigBiasEnable_S    : std_logic;
	signal ConfigModuleAddress_D : unsigned(6 downto 0);
	signal ConfigParamAddress_D  : unsigned(7 downto 0);
	signal ConfigParamInput_D    : std_logic_vector(31 downto 0);
	signal ConfigLatchInput_S    : std_logic;

	-- clock
	signal Clk_C : std_logic := '1';
begin                                   -- architecture Testbench
-- component instantiation
	DUT : entity work.DVS132SBiasStateMachine
		port map(
			Clock_CI               => Clock_C,
			Reset_RI               => Reset_R,
			BiasClock_CO           => BiasClock_C,
			BiasData_DO            => BiasData_D,
			BiasUpdate_SO          => BiasUpdate_S,
			BiasDrive_SO           => BiasDrive_S,
			BiasTie_SBO            => BiasTie_SB,
			BiasEnable_SO          => BiasEnable_S,
			ConfigBiasEnable_SI    => ConfigBiasEnable_S,
			ConfigModuleAddress_DI => ConfigModuleAddress_D,
			ConfigParamAddress_DI  => ConfigParamAddress_D,
			ConfigParamInput_DI    => ConfigParamInput_D,
			ConfigLatchInput_SI    => ConfigLatchInput_S);

	-- clock generation
	Clk_C   <= not Clk_C after 0.5 ns;
	Clock_C <= Clk_C;

	-- waveform generation
	WaveGen_Proc : process
	begin
		Reset_R               <= '0';
		ConfigModuleAddress_D <= (others => '0');
		ConfigParamAddress_D  <= (others => '0');
		ConfigParamInput_D    <= (others => '0');
		ConfigLatchInput_S    <= '0';

		-- pulse reset
		wait for 2 ns;
		Reset_R <= '1';
		wait for 3 ns;
		Reset_R <= '0';

		-- should remain at zero for 5 cycles
		wait for 50 ns;

		-- enable biases
		ConfigBiasEnable_S <= '1';
		wait for 200 ms;

		-- disable biases again
		ConfigBiasEnable_S <= '0';
		wait for 200 ms;

		wait;
	end process WaveGen_Proc;
end architecture Testbench;
