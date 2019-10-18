-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 17 10:53:21 2019
-- Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top brd_eventStreamToConstEn_0_1 -prefix
--               brd_eventStreamToConstEn_0_1_ brd_eventStreamToConstEn_0_1_stub.vhdl
-- Design      : brd_eventStreamToConstEn_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045ffg900-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity brd_eventStreamToConstEn_0_1 is
  Port ( 
    count_V_ap_vld : out STD_LOGIC;
    vgaEn_V_ap_vld : out STD_LOGIC;
    vCnt_V_ap_vld : out STD_LOGIC;
    hCnt_V_ap_vld : out STD_LOGIC;
    regX_V_ap_vld : out STD_LOGIC;
    regY_V_ap_vld : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    frameStream_TVALID : out STD_LOGIC;
    frameStream_TREADY : in STD_LOGIC;
    frameStream_TDEST : out STD_LOGIC_VECTOR ( 0 to 0 );
    frameStream_TDATA : out STD_LOGIC_VECTOR ( 23 downto 0 );
    frameStream_TKEEP : out STD_LOGIC_VECTOR ( 2 downto 0 );
    frameStream_TSTRB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    frameStream_TUSER : out STD_LOGIC_VECTOR ( 1 downto 0 );
    frameStream_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    frameStream_TID : out STD_LOGIC_VECTOR ( 0 to 0 );
    xStream_V_V_TVALID : in STD_LOGIC;
    xStream_V_V_TREADY : out STD_LOGIC;
    xStream_V_V_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    yStream_V_V_TVALID : in STD_LOGIC;
    yStream_V_V_TREADY : out STD_LOGIC;
    yStream_V_V_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    count_V : out STD_LOGIC_VECTOR ( 63 downto 0 );
    vgaEn_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    vCnt_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    hCnt_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    regX_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    regY_V : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end brd_eventStreamToConstEn_0_1;

architecture stub of brd_eventStreamToConstEn_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "count_V_ap_vld,vgaEn_V_ap_vld,vCnt_V_ap_vld,hCnt_V_ap_vld,regX_V_ap_vld,regY_V_ap_vld,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,frameStream_TVALID,frameStream_TREADY,frameStream_TDEST[0:0],frameStream_TDATA[23:0],frameStream_TKEEP[2:0],frameStream_TSTRB[2:0],frameStream_TUSER[1:0],frameStream_TLAST[0:0],frameStream_TID[0:0],xStream_V_V_TVALID,xStream_V_V_TREADY,xStream_V_V_TDATA[15:0],yStream_V_V_TVALID,yStream_V_V_TREADY,yStream_V_V_TDATA[15:0],count_V[63:0],vgaEn_V[0:0],vCnt_V[15:0],hCnt_V[15:0],regX_V[15:0],regY_V[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "eventStreamToConstEncntFrameStream,Vivado 2018.1";
begin
end;
