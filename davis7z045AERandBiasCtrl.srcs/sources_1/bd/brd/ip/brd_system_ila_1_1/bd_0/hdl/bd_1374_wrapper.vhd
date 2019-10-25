--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_1374_wrapper.bd
--Design : bd_1374_wrapper
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_1374_wrapper is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end bd_1374_wrapper;

architecture STRUCTURE of bd_1374_wrapper is
  component bd_1374 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_1374;
begin
bd_1374_i: component bd_1374
     port map (
      clk => clk,
      probe0(0) => probe0(0)
    );
end STRUCTURE;
