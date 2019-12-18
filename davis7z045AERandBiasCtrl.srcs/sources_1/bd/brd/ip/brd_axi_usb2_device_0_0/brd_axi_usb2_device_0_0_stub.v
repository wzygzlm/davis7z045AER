// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Dec 18 10:33:43 2019
// Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/PhD_project/vivado_prjs/davisZynq/davis7z045AERandBiasCtrl/davis7z045AERandBiasCtrl.srcs/sources_1/bd/brd/ip/brd_axi_usb2_device_0_0/brd_axi_usb2_device_0_0_stub.v
// Design      : brd_axi_usb2_device_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axi_usb2_device,Vivado 2018.1" *)
module brd_axi_usb2_device_0_0(m_axi_aclk, m_axi_aresetn, s_axi_aclk, 
  s_axi_aresetn, m_axi_awid, m_axi_awaddr, m_axi_awlen, m_axi_awsize, m_axi_awburst, 
  m_axi_awcache, m_axi_awprot, m_axi_awvalid, m_axi_awready, m_axi_awlock, m_axi_wdata, 
  m_axi_wstrb, m_axi_wlast, m_axi_wvalid, m_axi_wready, m_axi_bid, m_axi_bresp, m_axi_bvalid, 
  m_axi_bready, m_axi_arid, m_axi_araddr, m_axi_arlen, m_axi_arsize, m_axi_arburst, 
  m_axi_arcache, m_axi_arprot, m_axi_arvalid, m_axi_arready, m_axi_arlock, m_axi_rid, 
  m_axi_rdata, m_axi_rresp, m_axi_rlast, m_axi_rvalid, m_axi_rready, s_axi_awaddr, s_axi_awlen, 
  s_axi_awsize, s_axi_awburst, s_axi_awlock, s_axi_awcache, s_axi_awprot, s_axi_awvalid, 
  s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wlast, s_axi_wvalid, s_axi_wready, 
  s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arlen, s_axi_arsize, 
  s_axi_arburst, s_axi_arlock, s_axi_arcache, s_axi_arprot, s_axi_arvalid, s_axi_arready, 
  s_axi_rdata, s_axi_rresp, s_axi_rlast, s_axi_rvalid, s_axi_rready, usb_irpt, ulpi_clock, 
  ulpi_dir, ulpi_next, ulpi_stop, ulpi_reset, ulpi_data_i, ulpi_data_o, ulpi_data_t)
/* synthesis syn_black_box black_box_pad_pin="m_axi_aclk,m_axi_aresetn,s_axi_aclk,s_axi_aresetn,m_axi_awid[0:0],m_axi_awaddr[31:0],m_axi_awlen[7:0],m_axi_awsize[2:0],m_axi_awburst[1:0],m_axi_awcache[3:0],m_axi_awprot[2:0],m_axi_awvalid,m_axi_awready,m_axi_awlock,m_axi_wdata[31:0],m_axi_wstrb[3:0],m_axi_wlast,m_axi_wvalid,m_axi_wready,m_axi_bid[0:0],m_axi_bresp[1:0],m_axi_bvalid,m_axi_bready,m_axi_arid[0:0],m_axi_araddr[31:0],m_axi_arlen[7:0],m_axi_arsize[2:0],m_axi_arburst[1:0],m_axi_arcache[3:0],m_axi_arprot[2:0],m_axi_arvalid,m_axi_arready,m_axi_arlock,m_axi_rid[0:0],m_axi_rdata[31:0],m_axi_rresp[1:0],m_axi_rlast,m_axi_rvalid,m_axi_rready,s_axi_awaddr[15:0],s_axi_awlen[7:0],s_axi_awsize[2:0],s_axi_awburst[1:0],s_axi_awlock,s_axi_awcache[3:0],s_axi_awprot[2:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wlast,s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[15:0],s_axi_arlen[7:0],s_axi_arsize[2:0],s_axi_arburst[1:0],s_axi_arlock,s_axi_arcache[3:0],s_axi_arprot[2:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rlast,s_axi_rvalid,s_axi_rready,usb_irpt,ulpi_clock,ulpi_dir,ulpi_next,ulpi_stop,ulpi_reset,ulpi_data_i[7:0],ulpi_data_o[7:0],ulpi_data_t" */;
  input m_axi_aclk;
  input m_axi_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output m_axi_awvalid;
  input m_axi_awready;
  output m_axi_awlock;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output m_axi_arvalid;
  input m_axi_arready;
  output m_axi_arlock;
  input [0:0]m_axi_rid;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;
  input [15:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [15:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output usb_irpt;
  input ulpi_clock;
  input ulpi_dir;
  input ulpi_next;
  output ulpi_stop;
  output ulpi_reset;
  input [7:0]ulpi_data_i;
  output [7:0]ulpi_data_o;
  output ulpi_data_t;
endmodule
