-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Fri Oct 25 18:47:02 2019
-- Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               E:/PhD_project/vivado_prjs/davisZynq/davis7z045AERandBiasCtrl/davis7z045AERandBiasCtrl.srcs/sources_1/bd/brd/ip/brd_system_ila_0_0_1/brd_system_ila_0_0_stub.vhdl
-- Design      : brd_system_ila_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045ffg900-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity brd_system_ila_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe8 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    SLOT_0_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_0_AXIS_tlast : in STD_LOGIC;
    SLOT_0_AXIS_tvalid : in STD_LOGIC;
    SLOT_0_AXIS_tready : in STD_LOGIC;
    SLOT_1_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_1_AXIS_tlast : in STD_LOGIC;
    SLOT_1_AXIS_tvalid : in STD_LOGIC;
    SLOT_1_AXIS_tready : in STD_LOGIC;
    SLOT_2_AXIS_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXIS_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXIS_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    SLOT_2_AXIS_tstrb : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXIS_tkeep : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXIS_tlast : in STD_LOGIC;
    SLOT_2_AXIS_tuser : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXIS_tvalid : in STD_LOGIC;
    SLOT_2_AXIS_tready : in STD_LOGIC;
    resetn : in STD_LOGIC
  );

end brd_system_ila_0_0;

architecture stub of brd_system_ila_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[15:0],probe1[0:0],probe2[0:0],probe3[15:0],probe4[15:0],probe5[15:0],probe6[15:0],probe7[0:0],probe8[63:0],SLOT_0_AXIS_tdata[15:0],SLOT_0_AXIS_tlast,SLOT_0_AXIS_tvalid,SLOT_0_AXIS_tready,SLOT_1_AXIS_tdata[15:0],SLOT_1_AXIS_tlast,SLOT_1_AXIS_tvalid,SLOT_1_AXIS_tready,SLOT_2_AXIS_tid[0:0],SLOT_2_AXIS_tdest[0:0],SLOT_2_AXIS_tdata[23:0],SLOT_2_AXIS_tstrb[2:0],SLOT_2_AXIS_tkeep[2:0],SLOT_2_AXIS_tlast,SLOT_2_AXIS_tuser[1:0],SLOT_2_AXIS_tvalid,SLOT_2_AXIS_tready,resetn";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "bd_13e4,Vivado 2018.1";
begin
end;
