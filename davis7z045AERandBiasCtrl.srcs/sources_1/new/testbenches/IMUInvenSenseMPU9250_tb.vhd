library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.FIFORecords.all;
use work.IMUInvenSenseMPU9250ConfigRecords.all;
-------------------------------------------------------------------------------

entity IMUInvenSenseMPU9250_tb is
end entity IMUInvenSenseMPU9250_tb;

-------------------------------------------------------------------------------

architecture Testbench of IMUInvenSenseMPU9250_tb is
	-- component ports
	signal Clock_C              : std_logic;
	signal Reset_R              : std_logic;
	signal FIFOControl_S        : tFromFifoWriteSide;
	signal IMUSPISlaveSelect_SB : std_logic;
	signal IMUSPIClock_C        : std_logic;
	signal IMUSPIMOSI_D         : std_logic;
	signal IMUSPIMISO_S         : std_logic;
	signal IMUInterrupt_S       : std_logic;
	signal IMUConfig_D          : tIMUConfig;

	-- clock
	signal Clk_C : std_logic := '1';
begin                                   -- architecture Testbench
-- component instantiation
	DUT : entity work.IMUInvenSenseMPU9250StateMachine
		port map(
			Clock_CI              => Clock_C,
			Reset_RI              => Reset_R,
			OutFifoControl_SI     => FIFOControl_S,
			OutFifoControl_SO     => open,
			OutFifoData_DO        => open,
			IMUSPISlaveSelect_SBO => IMUSPISlaveSelect_SB,
			IMUSPIClock_CO        => IMUSPIClock_C,
			IMUSPIMOSI_DO         => IMUSPIMOSI_D,
			IMUSPIMISO_SI         => IMUSPIMISO_S,
			IMUInterrupt_SI       => IMUInterrupt_S,
			IMUConfig_DI          => IMUConfig_D);

	-- clock generation
	Clk_C   <= not Clk_C after 0.5 ns;
	Clock_C <= Clk_C;

	-- waveform generation
	WaveGen_Proc : process
	begin
		Reset_R                    <= '0';
		FIFOControl_S.AlmostFull_S <= '0';
		FIFOControl_S.Full_S       <= '0';
		IMUSPIMISO_S               <= '0';
		IMUInterrupt_S             <= '0';
		IMUConfig_D                <= tIMUConfigDefault;

		-- pulse reset
		wait for 2 ns;
		Reset_R <= '1';
		wait for 3 ns;
		Reset_R <= '0';

		-- should remain at zero for 5 cycles
		wait for 50 ns;

		-- enable IMU
		IMUConfig_D.RunAccel_S <= '1';
		IMUConfig_D.RunGyro_S  <= '1';
		IMUConfig_D.RunTemp_S  <= '1';
		wait for 1 ms;

		-- send an interrupt to start a read
		IMUInterrupt_S <= '1';
		wait for 1 us;
		IMUInterrupt_S <= '0';

		-- disable IMU again
		IMUConfig_D.RunAccel_S <= '0';
		IMUConfig_D.RunGyro_S  <= '0';
		IMUConfig_D.RunTemp_S  <= '0';
		wait for 1 ms;

		wait;
	end process WaveGen_Proc;
end architecture Testbench;
