// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Nov  3 20:29:40 2019
// Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/PhD_project/vivado_prjs/davisZynq/davis7z045AERandBiasCtrl/davis7z045AERandBiasCtrl.srcs/sources_1/bd/brd/ip/brd_EVMUXDataToXYTSStream_0_0/brd_EVMUXDataToXYTSStream_0_0_stub.v
// Design      : brd_EVMUXDataToXYTSStream_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "EVMUXDataToXYTSStream,Vivado 2018.1" *)
module brd_EVMUXDataToXYTSStream_0_0(dataReg_V_ap_vld, xRegReg_V_ap_vld, 
  yRegReg_V_ap_vld, tsRegReg_V_ap_vld, polRegReg_V_ap_vld, tsWrapRegReg_V_ap_vld, ap_clk, 
  ap_rst_n, ap_start, ap_done, ap_idle, ap_ready, tsStreamOut_V_V_TVALID, 
  tsStreamOut_V_V_TREADY, tsStreamOut_V_V_TDATA, yStreamOut_V_V_TVALID, 
  yStreamOut_V_V_TREADY, yStreamOut_V_V_TDATA, xStreamOut_V_V_TVALID, 
  xStreamOut_V_V_TREADY, xStreamOut_V_V_TDATA, polStreamOut_V_V_TVALID, 
  polStreamOut_V_V_TREADY, polStreamOut_V_V_TDATA, eventFIFOIn_V, eventFIFODataValid_V, 
  dataReg_V, xRegReg_V, yRegReg_V, tsRegReg_V, polRegReg_V, tsWrapRegReg_V)
/* synthesis syn_black_box black_box_pad_pin="dataReg_V_ap_vld,xRegReg_V_ap_vld,yRegReg_V_ap_vld,tsRegReg_V_ap_vld,polRegReg_V_ap_vld,tsWrapRegReg_V_ap_vld,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,tsStreamOut_V_V_TVALID,tsStreamOut_V_V_TREADY,tsStreamOut_V_V_TDATA[63:0],yStreamOut_V_V_TVALID,yStreamOut_V_V_TREADY,yStreamOut_V_V_TDATA[15:0],xStreamOut_V_V_TVALID,xStreamOut_V_V_TREADY,xStreamOut_V_V_TDATA[15:0],polStreamOut_V_V_TVALID,polStreamOut_V_V_TREADY,polStreamOut_V_V_TDATA[7:0],eventFIFOIn_V[15:0],eventFIFODataValid_V[0:0],dataReg_V[15:0],xRegReg_V[15:0],yRegReg_V[15:0],tsRegReg_V[63:0],polRegReg_V[0:0],tsWrapRegReg_V[47:0]" */;
  output dataReg_V_ap_vld;
  output xRegReg_V_ap_vld;
  output yRegReg_V_ap_vld;
  output tsRegReg_V_ap_vld;
  output polRegReg_V_ap_vld;
  output tsWrapRegReg_V_ap_vld;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output tsStreamOut_V_V_TVALID;
  input tsStreamOut_V_V_TREADY;
  output [63:0]tsStreamOut_V_V_TDATA;
  output yStreamOut_V_V_TVALID;
  input yStreamOut_V_V_TREADY;
  output [15:0]yStreamOut_V_V_TDATA;
  output xStreamOut_V_V_TVALID;
  input xStreamOut_V_V_TREADY;
  output [15:0]xStreamOut_V_V_TDATA;
  output polStreamOut_V_V_TVALID;
  input polStreamOut_V_V_TREADY;
  output [7:0]polStreamOut_V_V_TDATA;
  input [15:0]eventFIFOIn_V;
  input [0:0]eventFIFODataValid_V;
  output [15:0]dataReg_V;
  output [15:0]xRegReg_V;
  output [15:0]yRegReg_V;
  output [63:0]tsRegReg_V;
  output [0:0]polRegReg_V;
  output [47:0]tsWrapRegReg_V;
endmodule
