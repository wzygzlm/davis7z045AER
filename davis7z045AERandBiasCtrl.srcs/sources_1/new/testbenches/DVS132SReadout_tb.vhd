library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.FIFORecords.all;
use work.EventCodes.all;
use work.DVS132SConfigRecords.all;
-------------------------------------------------------------------------------

entity DVS132SReadout_tb is
end entity DVS132SReadout_tb;

-------------------------------------------------------------------------------

architecture Testbench of DVS132SReadout_tb is
	-- component ports
	signal Clock_C               : std_logic;
	signal Reset_R               : std_logic;
	signal OutFifoControlIn_S    : tFromFifoWriteSide;
	signal OutFifoControlOut_S   : tToFifoWriteSide;
	signal OutFifoData_D         : std_logic_vector(EVENT_WIDTH - 1 downto 0);
	signal DVSArrayConfigData_D  : std_logic;
	signal DVSArrayConfigClock_C : std_logic;
	signal DVSArraySample_S      : std_logic;
	signal DVSArrayRestart_S     : std_logic;
	signal DVSArraySenseY_S      : std_logic;
	signal DVSXYSelect_S         : std_logic;
	signal DVSXReset_SB          : std_logic;
	signal DVSXClock_C           : std_logic;
	signal DVSYReset_SB          : std_logic;
	signal DVSYClock_C           : std_logic;
	signal DVSXYAddress_A        : std_logic_vector(7 downto 0);
	signal DVSOnPolarity_A       : std_logic_vector(3 downto 0);
	signal DVSOffPolarity_A      : std_logic_vector(3 downto 0);
	signal DVS132SConfig_D       : tDVS132SConfig;

	-- clock
	signal Clk_C : std_logic := '1';
begin                                   -- architecture Testbench
-- component instantiation
	DUT : entity work.DVS132SStateMachine
		generic map(
			ENABLE_STATISTICS => false)
		port map(
			Clock_CI                => Clock_C,
			Reset_RI                => Reset_R,
			OutFifoControl_SI       => OutFifoControlIn_S,
			OutFifoControl_SO       => OutFifoControlOut_S,
			OutFifoData_DO          => OutFifoData_D,
			DVSArrayConfigData_DO   => DVSArrayConfigData_D,
			DVSArrayConfigClock_CO  => DVSArrayConfigClock_C,
			DVSArraySample_SO       => DVSArraySample_S,
			DVSArrayRestart_SO      => DVSArrayRestart_S,
			DVSArraySenseY_SO       => DVSArraySenseY_S,
			DVSXYSelect_SO          => DVSXYSelect_S,
			DVSXReset_SBO           => DVSXReset_SB,
			DVSXClock_CO            => DVSXClock_C,
			DVSYReset_SBO           => DVSYReset_SB,
			DVSYClock_CO            => DVSYClock_C,
			DVSXYAddress_AI         => DVSXYAddress_A,
			DVSOnPolarity_AI        => DVSOnPolarity_A,
			DVSOffPolarity_AI       => DVSOffPolarity_A,
			DVS132SConfig_DI        => DVS132SConfig_D,
			DVS132SConfigInfoOut_DO => open);

	-- clock generation
	Clk_C   <= not Clk_C after 0.5 ns;
	Clock_C <= Clk_C;

	-- waveform generation
	WaveGen_Proc : process
	begin
		Reset_R                         <= '0';
		OutFifoControlIn_S.AlmostFull_S <= '0';
		OutFifoControlIn_S.Full_S       <= '0';

		DVSXYAddress_A   <= (others => '0');
		DVSOnPolarity_A  <= (others => '0');
		DVSOffPolarity_A <= (others => '0');

		DVS132SConfig_D                   <= tDVSConfigDefault;
		DVS132SConfig_D.RestartTime_D     <= to_unsigned(10, tDVS132SConfig.RestartTime_D'length);
		DVS132SConfig_D.CaptureInterval_D <= to_unsigned(10000, tDVS132SConfig.CaptureInterval_D'length);

		-- pulse reset
		wait for 2 ns;
		Reset_R <= '1';
		wait for 3 ns;
		Reset_R <= '0';

		-- should remain at zero for 5 cycles
		wait for 50 ns;

		-- enable readout
		DVS132SConfig_D.Run_S <= '1';

		wait for 14 us;

		-- Valid Y address.
		DVSXYAddress_A <= "00010111";

		wait for 3 ns;

		DVSXYAddress_A <= (others => '0');

		wait for 20 ns;

		-- Valid X address and polarities.
		DVSXYAddress_A   <= "10000111";
		DVSOnPolarity_A  <= "1000";
		DVSOffPolarity_A <= "0001";

		wait for 2 ns;

		DVSXYAddress_A   <= (others => '0');
		DVSOnPolarity_A  <= (others => '0');
		DVSOffPolarity_A <= (others => '0');

		wait for 20 ns;

		-- XEND
		DVSXYAddress_A <= "10110010";

		wait for 2 ns;

		DVSXYAddress_A <= (others => '0');

		wait for 20 ns;

		-- YEND
		DVSXYAddress_A <= "10111000";

		wait for 3 ns;

		DVSXYAddress_A <= (others => '0');

		wait;
	end process WaveGen_Proc;
end architecture Testbench;
