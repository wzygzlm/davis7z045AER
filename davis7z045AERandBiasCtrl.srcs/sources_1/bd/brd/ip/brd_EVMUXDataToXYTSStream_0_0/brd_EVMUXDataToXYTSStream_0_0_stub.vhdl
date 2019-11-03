-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Nov  2 19:34:46 2019
-- Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top brd_EVMUXDataToXYTSStream_0_0 -prefix
--               brd_EVMUXDataToXYTSStream_0_0_ brd_EVMUXDataToXYTSStream_0_0_stub.vhdl
-- Design      : brd_EVMUXDataToXYTSStream_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045ffg900-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity brd_EVMUXDataToXYTSStream_0_0 is
  Port ( 
    xRegReg_V_ap_vld : out STD_LOGIC;
    yRegReg_V_ap_vld : out STD_LOGIC;
    tsRegReg_V_ap_vld : out STD_LOGIC;
    dataReg_V_ap_vld : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    tsStreamOut_V_V_TVALID : out STD_LOGIC;
    tsStreamOut_V_V_TREADY : in STD_LOGIC;
    tsStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    yStreamOut_V_V_TVALID : out STD_LOGIC;
    yStreamOut_V_V_TREADY : in STD_LOGIC;
    yStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    xStreamOut_V_V_TVALID : out STD_LOGIC;
    xStreamOut_V_V_TREADY : in STD_LOGIC;
    xStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    eventFIFOIn_V : in STD_LOGIC_VECTOR ( 15 downto 0 );
    eventFIFODataValid_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    xRegReg_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    yRegReg_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    tsRegReg_V : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dataReg_V : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end brd_EVMUXDataToXYTSStream_0_0;

architecture stub of brd_EVMUXDataToXYTSStream_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "xRegReg_V_ap_vld,yRegReg_V_ap_vld,tsRegReg_V_ap_vld,dataReg_V_ap_vld,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,tsStreamOut_V_V_TVALID,tsStreamOut_V_V_TREADY,tsStreamOut_V_V_TDATA[63:0],yStreamOut_V_V_TVALID,yStreamOut_V_V_TREADY,yStreamOut_V_V_TDATA[15:0],xStreamOut_V_V_TVALID,xStreamOut_V_V_TREADY,xStreamOut_V_V_TDATA[15:0],eventFIFOIn_V[15:0],eventFIFODataValid_V[0:0],xRegReg_V[15:0],yRegReg_V[15:0],tsRegReg_V[63:0],dataReg_V[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "EVMUXDataToXYTSStream,Vivado 2018.1";
begin
end;
