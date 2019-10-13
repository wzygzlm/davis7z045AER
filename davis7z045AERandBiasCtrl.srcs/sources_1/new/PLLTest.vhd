----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2019 05:48:12 PM
-- Design Name: 
-- Module Name: PLLTest - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PLLTest is
	generic(
    CLOCK_FREQ     : integer;
    OUT_CLOCK_FREQ : integer;
    PHASE_ADJUST   : integer := 0);
port(
    Clock_CI        : in  std_logic;
    Reset_RI        : in  std_logic;
    OutClock_CO     : out std_logic;
    OutClockHalf_CO : out std_logic;
    PLLLock_SO      : out std_logic);
end PLLTest;

architecture Behavioral of PLLTest is
	signal OutClock_C : std_logic;
begin


   pll : PLLE2_BASE
        generic map (
           BANDWIDTH => "OPTIMIZED",  -- OPTIMIZED, HIGH, LOW
           CLKFBOUT_MULT => 5,        -- Multiply value for all CLKOUT, (2-64)
           CLKFBOUT_PHASE => 0.0,     -- Phase offset in degrees of CLKFB, (-360.000-360.000).
           CLKIN1_PERIOD => 20.0,      -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
           -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
           CLKOUT0_DIVIDE => 1,
           CLKOUT1_DIVIDE => 1,
           CLKOUT2_DIVIDE => 1,
           CLKOUT3_DIVIDE => 1,
           CLKOUT4_DIVIDE => 1,
           CLKOUT5_DIVIDE => 1,
           -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
           CLKOUT0_DUTY_CYCLE => 0.5,
           CLKOUT1_DUTY_CYCLE => 0.5,
           CLKOUT2_DUTY_CYCLE => 0.5,
           CLKOUT3_DUTY_CYCLE => 0.5,
           CLKOUT4_DUTY_CYCLE => 0.5,
           CLKOUT5_DUTY_CYCLE => 0.5,
           -- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
           CLKOUT0_PHASE => 0.0,
           CLKOUT1_PHASE => 0.0,
           CLKOUT2_PHASE => 0.0,
           CLKOUT3_PHASE => 0.0,
           CLKOUT4_PHASE => 0.0,
           CLKOUT5_PHASE => 0.0,
           DIVCLK_DIVIDE => 5,        -- Master division value, (1-56)
           REF_JITTER1 => 0.0,        -- Reference input jitter in UI, (0.000-0.999).
           STARTUP_WAIT => "FALSE"    -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
        )
        port map (
           -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
           CLKOUT0 => OutClock_C,   -- 1-bit output: CLKOUT0
           CLKOUT1 => OutClockHalf_CO,   -- 1-bit output: CLKOUT1
           CLKOUT2 => open,   -- 1-bit output: CLKOUT2
           CLKOUT3 => open,   -- 1-bit output: CLKOUT3
           CLKOUT4 => open,   -- 1-bit output: CLKOUT4
           CLKOUT5 => open,   -- 1-bit output: CLKOUT5
           -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
           CLKFBOUT => open, -- 1-bit output: Feedback clock
           LOCKED => PLLLock_SO,     -- 1-bit output: LOCK
           CLKIN1 => Clock_CI,     -- 1-bit input: Input clock
           -- Control Ports: 1-bit (each) input: PLL control ports
           PWRDWN => '0',     -- 1-bit input: Power-down
           RST => Reset_RI,           -- 1-bit input: Reset
           -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
           CLKFBIN => OutClock_C    -- 1-bit input: Feedback clock
        );
	OutClock_CO <= OutClock_C;
end architecture Behavioral;
