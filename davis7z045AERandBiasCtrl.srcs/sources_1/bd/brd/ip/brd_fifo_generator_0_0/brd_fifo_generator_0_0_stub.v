// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 17 10:55:20 2019
// Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top brd_fifo_generator_0_0 -prefix
//               brd_fifo_generator_0_0_ brd_fifo_generator_0_0_stub.v
// Design      : brd_fifo_generator_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_2,Vivado 2018.1" *)
module brd_fifo_generator_0_0(clk, srst, din, wr_en, rd_en, dout, full, almost_full, 
  empty, almost_empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[15:0],wr_en,rd_en,dout[15:0],full,almost_full,empty,almost_empty" */;
  input clk;
  input srst;
  input [15:0]din;
  input wr_en;
  input rd_en;
  output [15:0]dout;
  output full;
  output almost_full;
  output empty;
  output almost_empty;
endmodule
