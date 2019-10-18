library ieee;
use ieee.std_logic_1164.all;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.Settings.DEVICE_FAMILY;

entity PLL is
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
end entity PLL;

architecture Structural of PLL is
	signal OutClock_C : std_logic;
begin
--	pll : component work.pmi_components.pmi_pll
--		generic map(
--			pmi_freq_clki    => CLOCK_FREQ,
--			pmi_freq_clkfb   => OUT_CLOCK_FREQ,
--			pmi_freq_clkop   => OUT_CLOCK_FREQ,
--			pmi_freq_clkos   => OUT_CLOCK_FREQ / 2,
--			pmi_freq_clkok   => OUT_CLOCK_FREQ,
--			pmi_family       => DEVICE_FAMILY,
--			pmi_phase_adj    => PHASE_ADJUST,
--			pmi_duty_cycle   => 50,
--			pmi_clkfb_source => "CLKOP",
--			pmi_fdel         => "off",
--			pmi_fdel_val     => 0)
--		port map(
--			CLKI   => Clock_CI,
--			CLKFB  => OutClock_C,
--			RESET  => Reset_RI,
--			CLKOP  => OutClock_C,
--			CLKOS  => OutClockHalf_CO,
--			CLKOK  => open,
--			CLKOK2 => open,
--			LOCK   => PLLLock_SO);
   pll : PLLE2_BASE
        generic map (
           BANDWIDTH => "OPTIMIZED",  -- OPTIMIZED, HIGH, LOW
           CLKFBOUT_MULT => 12,        -- Multiply value for all CLKOUT, (2-64)
           CLKFBOUT_PHASE => 0.0,     -- Phase offset in degrees of CLKFB, (-360.000-360.000).
           CLKIN1_PERIOD => 10.0,    --100MHz      -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
           -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
           CLKOUT0_DIVIDE => 10,     --100MHz*12/10 = 120MHz   
           CLKOUT1_DIVIDE => 20,     --100MHz*12/20 = 60MHz   
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
           DIVCLK_DIVIDE => 1,        -- Master division value, (1-56)
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
end architecture Structural;
