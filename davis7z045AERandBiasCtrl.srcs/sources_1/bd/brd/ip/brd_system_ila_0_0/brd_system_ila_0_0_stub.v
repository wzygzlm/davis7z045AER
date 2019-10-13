// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Fri Oct 11 18:02:52 2019
// Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/PhD_project/vivado_prjs/davisZynq/davis7z045AERandBiasCtrl/davis7z045AERandBiasCtrl.srcs/sources_1/bd/brd/ip/brd_system_ila_0_0/brd_system_ila_0_0_stub.v
// Design      : brd_system_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "bd_13e4,Vivado 2018.1" *)
module brd_system_ila_0_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, SLOT_0_AXIS_tid, SLOT_0_AXIS_tdest, 
  SLOT_0_AXIS_tdata, SLOT_0_AXIS_tstrb, SLOT_0_AXIS_tkeep, SLOT_0_AXIS_tlast, 
  SLOT_0_AXIS_tuser, SLOT_0_AXIS_tvalid, SLOT_0_AXIS_tready, SLOT_1_AXIS_tdata, 
  SLOT_1_AXIS_tlast, SLOT_1_AXIS_tvalid, SLOT_1_AXIS_tready, resetn)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[15:0],probe1[0:0],probe2[15:0],probe3[0:0],probe4[0:0],probe5[0:0],probe6[15:0],probe7[0:0],probe8[63:0],probe9[0:0],probe10[0:0],probe11[15:0],SLOT_0_AXIS_tid[0:0],SLOT_0_AXIS_tdest[0:0],SLOT_0_AXIS_tdata[23:0],SLOT_0_AXIS_tstrb[2:0],SLOT_0_AXIS_tkeep[2:0],SLOT_0_AXIS_tlast,SLOT_0_AXIS_tuser[1:0],SLOT_0_AXIS_tvalid,SLOT_0_AXIS_tready,SLOT_1_AXIS_tdata[15:0],SLOT_1_AXIS_tlast,SLOT_1_AXIS_tvalid,SLOT_1_AXIS_tready,resetn" */;
  input clk;
  input [15:0]probe0;
  input [0:0]probe1;
  input [15:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;
  input [0:0]probe5;
  input [15:0]probe6;
  input [0:0]probe7;
  input [63:0]probe8;
  input [0:0]probe9;
  input [0:0]probe10;
  input [15:0]probe11;
  input [0:0]SLOT_0_AXIS_tid;
  input [0:0]SLOT_0_AXIS_tdest;
  input [23:0]SLOT_0_AXIS_tdata;
  input [2:0]SLOT_0_AXIS_tstrb;
  input [2:0]SLOT_0_AXIS_tkeep;
  input SLOT_0_AXIS_tlast;
  input [1:0]SLOT_0_AXIS_tuser;
  input SLOT_0_AXIS_tvalid;
  input SLOT_0_AXIS_tready;
  input [15:0]SLOT_1_AXIS_tdata;
  input SLOT_1_AXIS_tlast;
  input SLOT_1_AXIS_tvalid;
  input SLOT_1_AXIS_tready;
  input resetn;
endmodule
