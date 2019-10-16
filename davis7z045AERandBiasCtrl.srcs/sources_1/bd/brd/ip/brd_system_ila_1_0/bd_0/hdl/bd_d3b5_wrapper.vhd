--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_d3b5_wrapper.bd
--Design : bd_d3b5_wrapper
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_d3b5_wrapper is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe9 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end bd_d3b5_wrapper;

architecture STRUCTURE of bd_d3b5_wrapper is
  component bd_d3b5 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe9 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_d3b5;
begin
bd_d3b5_i: component bd_d3b5
     port map (
      clk => clk,
      probe0(0) => probe0(0),
      probe1(0) => probe1(0),
      probe2(0) => probe2(0),
      probe3(0) => probe3(0),
      probe4(2 downto 0) => probe4(2 downto 0),
      probe5(31 downto 0) => probe5(31 downto 0),
      probe6(5 downto 0) => probe6(5 downto 0),
      probe7(2 downto 0) => probe7(2 downto 0),
      probe8(0) => probe8(0),
      probe9(0) => probe9(0)
    );
end STRUCTURE;