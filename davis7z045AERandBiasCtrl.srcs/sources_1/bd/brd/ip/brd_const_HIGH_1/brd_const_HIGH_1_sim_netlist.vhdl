-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 17 10:50:37 2019
-- Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top brd_const_HIGH_1 -prefix
--               brd_const_HIGH_1_ brd_const_HIGH_1_sim_netlist.vhdl
-- Design      : brd_const_HIGH_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z045ffg900-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity brd_const_HIGH_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of brd_const_HIGH_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of brd_const_HIGH_1 : entity is "brd_const_HIGH_1,xlconstant_v1_1_4_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of brd_const_HIGH_1 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of brd_const_HIGH_1 : entity is "xlconstant_v1_1_4_xlconstant,Vivado 2018.1";
end brd_const_HIGH_1;

architecture STRUCTURE of brd_const_HIGH_1 is
  signal \<const0>\ : STD_LOGIC;
begin
  dout(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
end STRUCTURE;
