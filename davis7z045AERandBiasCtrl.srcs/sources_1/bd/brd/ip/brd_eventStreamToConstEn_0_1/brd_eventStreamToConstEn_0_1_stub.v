// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 17 10:53:21 2019
// Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top brd_eventStreamToConstEn_0_1 -prefix
//               brd_eventStreamToConstEn_0_1_ brd_eventStreamToConstEn_0_1_stub.v
// Design      : brd_eventStreamToConstEn_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "eventStreamToConstEncntFrameStream,Vivado 2018.1" *)
module brd_eventStreamToConstEn_0_1(count_V_ap_vld, vgaEn_V_ap_vld, 
  vCnt_V_ap_vld, hCnt_V_ap_vld, regX_V_ap_vld, regY_V_ap_vld, ap_clk, ap_rst_n, ap_start, 
  ap_done, ap_idle, ap_ready, frameStream_TVALID, frameStream_TREADY, frameStream_TDEST, 
  frameStream_TDATA, frameStream_TKEEP, frameStream_TSTRB, frameStream_TUSER, 
  frameStream_TLAST, frameStream_TID, xStream_V_V_TVALID, xStream_V_V_TREADY, 
  xStream_V_V_TDATA, yStream_V_V_TVALID, yStream_V_V_TREADY, yStream_V_V_TDATA, count_V, 
  vgaEn_V, vCnt_V, hCnt_V, regX_V, regY_V)
/* synthesis syn_black_box black_box_pad_pin="count_V_ap_vld,vgaEn_V_ap_vld,vCnt_V_ap_vld,hCnt_V_ap_vld,regX_V_ap_vld,regY_V_ap_vld,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,frameStream_TVALID,frameStream_TREADY,frameStream_TDEST[0:0],frameStream_TDATA[23:0],frameStream_TKEEP[2:0],frameStream_TSTRB[2:0],frameStream_TUSER[1:0],frameStream_TLAST[0:0],frameStream_TID[0:0],xStream_V_V_TVALID,xStream_V_V_TREADY,xStream_V_V_TDATA[15:0],yStream_V_V_TVALID,yStream_V_V_TREADY,yStream_V_V_TDATA[15:0],count_V[63:0],vgaEn_V[0:0],vCnt_V[15:0],hCnt_V[15:0],regX_V[15:0],regY_V[15:0]" */;
  output count_V_ap_vld;
  output vgaEn_V_ap_vld;
  output vCnt_V_ap_vld;
  output hCnt_V_ap_vld;
  output regX_V_ap_vld;
  output regY_V_ap_vld;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output frameStream_TVALID;
  input frameStream_TREADY;
  output [0:0]frameStream_TDEST;
  output [23:0]frameStream_TDATA;
  output [2:0]frameStream_TKEEP;
  output [2:0]frameStream_TSTRB;
  output [1:0]frameStream_TUSER;
  output [0:0]frameStream_TLAST;
  output [0:0]frameStream_TID;
  input xStream_V_V_TVALID;
  output xStream_V_V_TREADY;
  input [15:0]xStream_V_V_TDATA;
  input yStream_V_V_TVALID;
  output yStream_V_V_TREADY;
  input [15:0]yStream_V_V_TDATA;
  output [63:0]count_V;
  output [0:0]vgaEn_V;
  output [15:0]vCnt_V;
  output [15:0]hCnt_V;
  output [15:0]regX_V;
  output [15:0]regY_V;
endmodule
