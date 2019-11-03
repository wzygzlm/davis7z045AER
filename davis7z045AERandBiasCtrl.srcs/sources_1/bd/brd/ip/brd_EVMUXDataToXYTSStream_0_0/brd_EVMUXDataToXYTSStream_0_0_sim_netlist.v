// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Nov  2 19:34:46 2019
// Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top brd_EVMUXDataToXYTSStream_0_0 -prefix
//               brd_EVMUXDataToXYTSStream_0_0_ brd_EVMUXDataToXYTSStream_0_0_sim_netlist.v
// Design      : brd_EVMUXDataToXYTSStream_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z045ffg900-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module brd_EVMUXDataToXYTSStream_0_0_EVMUXDataToXYTSStream
   (ap_clk,
    ap_rst_n,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    tsStreamOut_V_V_TREADY,
    yStreamOut_V_V_TREADY,
    xStreamOut_V_V_TREADY,
    eventFIFOIn_V,
    eventFIFODataValid_V,
    xRegReg_V,
    xRegReg_V_ap_vld,
    yRegReg_V,
    yRegReg_V_ap_vld,
    tsRegReg_V,
    tsRegReg_V_ap_vld,
    dataReg_V,
    dataReg_V_ap_vld,
    xStreamOut_V_V_TDATA,
    xStreamOut_V_V_TVALID,
    yStreamOut_V_V_TDATA,
    yStreamOut_V_V_TVALID,
    tsStreamOut_V_V_TDATA,
    tsStreamOut_V_V_TVALID);
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input tsStreamOut_V_V_TREADY;
  input yStreamOut_V_V_TREADY;
  input xStreamOut_V_V_TREADY;
  input [15:0]eventFIFOIn_V;
  input [0:0]eventFIFODataValid_V;
  output [15:0]xRegReg_V;
  output xRegReg_V_ap_vld;
  output [15:0]yRegReg_V;
  output yRegReg_V_ap_vld;
  output [63:0]tsRegReg_V;
  output tsRegReg_V_ap_vld;
  output [15:0]dataReg_V;
  output dataReg_V_ap_vld;
  output [15:0]xStreamOut_V_V_TDATA;
  output xStreamOut_V_V_TVALID;
  output [15:0]yStreamOut_V_V_TDATA;
  output yStreamOut_V_V_TVALID;
  output [63:0]tsStreamOut_V_V_TDATA;
  output tsStreamOut_V_V_TVALID;

  wire \<const0> ;
  wire ap_clk;
  wire ap_done;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter1_i_1_n_0;
  wire ap_idle;
  wire ap_phi_reg_pp0_iter1_p_1_reg_1752;
  wire ap_phi_reg_pp0_iter1_p_1_reg_17539_out;
  wire \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[0]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[10]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[11]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[12]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[13]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[14]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[1]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[2]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[3]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[4]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[5]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[6]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[7]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[8]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[9]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ;
  wire \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ;
  wire \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ;
  wire ap_ready;
  wire ap_ready_INST_0_i_1_n_0;
  wire ap_reg_ioackin_dataReg_V_dummy_ack_i_1_n_0;
  wire ap_reg_ioackin_dataReg_V_dummy_ack_reg_n_0;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire ap_start;
  wire [15:0]dataReg_V;
  wire [0:0]eventFIFODataValid_V;
  wire [15:0]eventFIFOIn_V;
  wire [11:0]p_1_in;
  wire [14:0]\^tsRegReg_V ;
  wire tsStreamOut_V_V_1_ack_in;
  wire tsStreamOut_V_V_1_load_A;
  wire tsStreamOut_V_V_1_load_B;
  wire [14:0]tsStreamOut_V_V_1_payload_A;
  wire [14:0]tsStreamOut_V_V_1_payload_B;
  wire tsStreamOut_V_V_1_sel;
  wire tsStreamOut_V_V_1_sel_rd_i_1_n_0;
  wire tsStreamOut_V_V_1_sel_wr;
  wire tsStreamOut_V_V_1_sel_wr_i_1_n_0;
  wire [1:1]tsStreamOut_V_V_1_state;
  wire \tsStreamOut_V_V_1_state[0]_i_1_n_0 ;
  wire [14:0]\^tsStreamOut_V_V_TDATA ;
  wire tsStreamOut_V_V_TREADY;
  wire tsStreamOut_V_V_TVALID;
  wire [14:0]ts_V;
  wire [12:0]\^xRegReg_V ;
  wire xRegReg_V_ap_vld;
  wire xStreamOut_V_V_1_ack_in;
  wire xStreamOut_V_V_1_load_A;
  wire xStreamOut_V_V_1_load_B;
  wire [12:0]xStreamOut_V_V_1_payload_A;
  wire [12:0]xStreamOut_V_V_1_payload_B;
  wire xStreamOut_V_V_1_sel;
  wire xStreamOut_V_V_1_sel_rd_i_1_n_0;
  wire xStreamOut_V_V_1_sel_wr;
  wire xStreamOut_V_V_1_sel_wr029_out;
  wire xStreamOut_V_V_1_sel_wr_i_1_n_0;
  wire [1:1]xStreamOut_V_V_1_state;
  wire \xStreamOut_V_V_1_state[0]_i_1_n_0 ;
  wire [12:0]\^xStreamOut_V_V_TDATA ;
  wire xStreamOut_V_V_TREADY;
  wire xStreamOut_V_V_TVALID;
  wire \x_V[12]_i_2_n_0 ;
  wire [11:0]\^yRegReg_V ;
  wire yStreamOut_V_V_1_ack_in;
  wire yStreamOut_V_V_1_load_A;
  wire yStreamOut_V_V_1_load_B;
  wire [11:0]yStreamOut_V_V_1_payload_A;
  wire [11:0]yStreamOut_V_V_1_payload_B;
  wire yStreamOut_V_V_1_sel;
  wire yStreamOut_V_V_1_sel_rd_i_1_n_0;
  wire yStreamOut_V_V_1_sel_wr;
  wire yStreamOut_V_V_1_sel_wr_i_1_n_0;
  wire [1:1]yStreamOut_V_V_1_state;
  wire \yStreamOut_V_V_1_state[0]_i_1_n_0 ;
  wire [11:0]\^yStreamOut_V_V_TDATA ;
  wire yStreamOut_V_V_TREADY;
  wire yStreamOut_V_V_TVALID;
  wire [11:0]y_V;

  assign dataReg_V_ap_vld = xRegReg_V_ap_vld;
  assign tsRegReg_V[63] = \<const0> ;
  assign tsRegReg_V[62] = \<const0> ;
  assign tsRegReg_V[61] = \<const0> ;
  assign tsRegReg_V[60] = \<const0> ;
  assign tsRegReg_V[59] = \<const0> ;
  assign tsRegReg_V[58] = \<const0> ;
  assign tsRegReg_V[57] = \<const0> ;
  assign tsRegReg_V[56] = \<const0> ;
  assign tsRegReg_V[55] = \<const0> ;
  assign tsRegReg_V[54] = \<const0> ;
  assign tsRegReg_V[53] = \<const0> ;
  assign tsRegReg_V[52] = \<const0> ;
  assign tsRegReg_V[51] = \<const0> ;
  assign tsRegReg_V[50] = \<const0> ;
  assign tsRegReg_V[49] = \<const0> ;
  assign tsRegReg_V[48] = \<const0> ;
  assign tsRegReg_V[47] = \<const0> ;
  assign tsRegReg_V[46] = \<const0> ;
  assign tsRegReg_V[45] = \<const0> ;
  assign tsRegReg_V[44] = \<const0> ;
  assign tsRegReg_V[43] = \<const0> ;
  assign tsRegReg_V[42] = \<const0> ;
  assign tsRegReg_V[41] = \<const0> ;
  assign tsRegReg_V[40] = \<const0> ;
  assign tsRegReg_V[39] = \<const0> ;
  assign tsRegReg_V[38] = \<const0> ;
  assign tsRegReg_V[37] = \<const0> ;
  assign tsRegReg_V[36] = \<const0> ;
  assign tsRegReg_V[35] = \<const0> ;
  assign tsRegReg_V[34] = \<const0> ;
  assign tsRegReg_V[33] = \<const0> ;
  assign tsRegReg_V[32] = \<const0> ;
  assign tsRegReg_V[31] = \<const0> ;
  assign tsRegReg_V[30] = \<const0> ;
  assign tsRegReg_V[29] = \<const0> ;
  assign tsRegReg_V[28] = \<const0> ;
  assign tsRegReg_V[27] = \<const0> ;
  assign tsRegReg_V[26] = \<const0> ;
  assign tsRegReg_V[25] = \<const0> ;
  assign tsRegReg_V[24] = \<const0> ;
  assign tsRegReg_V[23] = \<const0> ;
  assign tsRegReg_V[22] = \<const0> ;
  assign tsRegReg_V[21] = \<const0> ;
  assign tsRegReg_V[20] = \<const0> ;
  assign tsRegReg_V[19] = \<const0> ;
  assign tsRegReg_V[18] = \<const0> ;
  assign tsRegReg_V[17] = \<const0> ;
  assign tsRegReg_V[16] = \<const0> ;
  assign tsRegReg_V[15] = \<const0> ;
  assign tsRegReg_V[14:0] = \^tsRegReg_V [14:0];
  assign tsRegReg_V_ap_vld = xRegReg_V_ap_vld;
  assign tsStreamOut_V_V_TDATA[63] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[62] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[61] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[60] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[59] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[58] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[57] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[56] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[55] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[54] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[53] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[52] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[51] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[50] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[49] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[48] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[47] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[46] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[45] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[44] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[43] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[42] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[41] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[40] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[39] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[38] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[37] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[36] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[35] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[34] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[33] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[32] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[31] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[30] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[29] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[28] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[27] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[26] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[25] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[24] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[23] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[22] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[21] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[20] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[19] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[18] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[17] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[16] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[15] = \<const0> ;
  assign tsStreamOut_V_V_TDATA[14:0] = \^tsStreamOut_V_V_TDATA [14:0];
  assign xRegReg_V[15] = \<const0> ;
  assign xRegReg_V[14] = \<const0> ;
  assign xRegReg_V[13] = \<const0> ;
  assign xRegReg_V[12:0] = \^xRegReg_V [12:0];
  assign xStreamOut_V_V_TDATA[15] = \<const0> ;
  assign xStreamOut_V_V_TDATA[14] = \<const0> ;
  assign xStreamOut_V_V_TDATA[13] = \<const0> ;
  assign xStreamOut_V_V_TDATA[12:0] = \^xStreamOut_V_V_TDATA [12:0];
  assign yRegReg_V[15] = \<const0> ;
  assign yRegReg_V[14] = \<const0> ;
  assign yRegReg_V[13] = \<const0> ;
  assign yRegReg_V[12] = \<const0> ;
  assign yRegReg_V[11:0] = \^yRegReg_V [11:0];
  assign yRegReg_V_ap_vld = xRegReg_V_ap_vld;
  assign yStreamOut_V_V_TDATA[15] = \<const0> ;
  assign yStreamOut_V_V_TDATA[14] = \<const0> ;
  assign yStreamOut_V_V_TDATA[13] = \<const0> ;
  assign yStreamOut_V_V_TDATA[12] = \<const0> ;
  assign yStreamOut_V_V_TDATA[11:0] = \^yStreamOut_V_V_TDATA [11:0];
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    ap_done_INST_0
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(yStreamOut_V_V_1_ack_in),
        .I2(tsStreamOut_V_V_1_ack_in),
        .I3(xStreamOut_V_V_1_ack_in),
        .O(ap_done));
  LUT6 #(
    .INIT(64'hAAF8F8F8F8F8F8F8)) 
    ap_enable_reg_pp0_iter1_i_1
       (.I0(ap_start),
        .I1(ap_ready_INST_0_i_1_n_0),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(xStreamOut_V_V_1_ack_in),
        .I4(tsStreamOut_V_V_1_ack_in),
        .I5(yStreamOut_V_V_1_ack_in),
        .O(ap_enable_reg_pp0_iter1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter1_i_1_n_0),
        .Q(ap_enable_reg_pp0_iter1),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    ap_idle_INST_0
       (.I0(ap_start),
        .I1(ap_enable_reg_pp0_iter1),
        .O(ap_idle));
  LUT5 #(
    .INIT(32'h15110000)) 
    \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1 
       (.I0(eventFIFODataValid_V),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(ap_ready_INST_0_i_1_n_0),
        .I4(ap_start),
        .O(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7500000000000000)) 
    \ap_phi_reg_pp0_iter1_p_1_reg_175[15]_i_1 
       (.I0(\x_V[12]_i_2_n_0 ),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(ap_ready_INST_0_i_1_n_0),
        .I3(ap_start),
        .I4(eventFIFODataValid_V),
        .I5(eventFIFOIn_V[15]),
        .O(ap_phi_reg_pp0_iter1_p_1_reg_1752));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[0]),
        .Q(dataReg_V[0]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[10] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[10]),
        .Q(dataReg_V[10]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[11] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[11]),
        .Q(dataReg_V[11]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[12] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[12]),
        .Q(dataReg_V[12]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[13] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[13]),
        .Q(dataReg_V[13]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[14] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[14]),
        .Q(dataReg_V[14]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[15] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .Q(dataReg_V[15]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[1] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[1]),
        .Q(dataReg_V[1]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[2] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[2]),
        .Q(dataReg_V[2]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[3] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[3]),
        .Q(dataReg_V[3]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[4] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[4]),
        .Q(dataReg_V[4]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[5] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[5]),
        .Q(dataReg_V[5]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[6] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[6]),
        .Q(dataReg_V[6]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[7] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[7]),
        .Q(dataReg_V[7]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[8] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[8]),
        .Q(dataReg_V[8]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_p_1_reg_175_reg[9] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(eventFIFOIn_V[9]),
        .Q(dataReg_V[9]),
        .R(\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[0]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[0]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[0]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[10]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[10]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[10]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[11]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[11]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[11]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[12]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[12]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[12]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[13]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[13]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[13]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[14]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[14]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[14]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[1]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[1]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[1]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[2]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[2]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[2]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[3]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[3]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[3]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[4]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[4]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[4]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[5]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[5]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[5]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[6]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[6]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[6]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[7]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[7]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[7]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[8]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[8]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[8]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7FFF780800080)) 
    \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[9]_i_1 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[9]),
        .I3(\x_V[12]_i_2_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I5(ts_V[9]),
        .O(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[9]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[0]_i_1_n_0 ),
        .Q(\^tsRegReg_V [0]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[10] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[10]_i_1_n_0 ),
        .Q(\^tsRegReg_V [10]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[11] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[11]_i_1_n_0 ),
        .Q(\^tsRegReg_V [11]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[12] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[12]_i_1_n_0 ),
        .Q(\^tsRegReg_V [12]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[13] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[13]_i_1_n_0 ),
        .Q(\^tsRegReg_V [13]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[14] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[14]_i_1_n_0 ),
        .Q(\^tsRegReg_V [14]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[1] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[1]_i_1_n_0 ),
        .Q(\^tsRegReg_V [1]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[2] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[2]_i_1_n_0 ),
        .Q(\^tsRegReg_V [2]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[3] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[3]_i_1_n_0 ),
        .Q(\^tsRegReg_V [3]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[4] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[4]_i_1_n_0 ),
        .Q(\^tsRegReg_V [4]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[5] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[5]_i_1_n_0 ),
        .Q(\^tsRegReg_V [5]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[6] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[6]_i_1_n_0 ),
        .Q(\^tsRegReg_V [6]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[7] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[7]_i_1_n_0 ),
        .Q(\^tsRegReg_V [7]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[8] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[8]_i_1_n_0 ),
        .Q(\^tsRegReg_V [8]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[9] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[9]_i_1_n_0 ),
        .Q(\^tsRegReg_V [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[0]_i_1 
       (.I0(y_V[0]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[0]),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[10]_i_1 
       (.I0(y_V[10]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[10]),
        .O(p_1_in[10]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_1 
       (.I0(y_V[11]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[11]),
        .O(p_1_in[11]));
  LUT6 #(
    .INIT(64'h00000000FFDFFFFF)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2 
       (.I0(eventFIFOIn_V[13]),
        .I1(eventFIFOIn_V[14]),
        .I2(eventFIFODataValid_V),
        .I3(eventFIFOIn_V[15]),
        .I4(ap_start),
        .I5(ap_enable_reg_pp0_iter1),
        .O(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3 
       (.I0(eventFIFOIn_V[15]),
        .I1(eventFIFODataValid_V),
        .O(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4 
       (.I0(eventFIFOIn_V[12]),
        .I1(eventFIFOIn_V[13]),
        .I2(eventFIFOIn_V[14]),
        .I3(ap_start),
        .O(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[1]_i_1 
       (.I0(y_V[1]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[1]),
        .O(p_1_in[1]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[2]_i_1 
       (.I0(y_V[2]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[2]),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[3]_i_1 
       (.I0(y_V[3]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[3]),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[4]_i_1 
       (.I0(y_V[4]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[4]),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[5]_i_1 
       (.I0(y_V[5]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[5]),
        .O(p_1_in[5]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[6]_i_1 
       (.I0(y_V[6]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[6]),
        .O(p_1_in[6]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[7]_i_1 
       (.I0(y_V[7]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[7]),
        .O(p_1_in[7]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[8]_i_1 
       (.I0(y_V[8]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[8]),
        .O(p_1_in[8]));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[9]_i_1 
       (.I0(y_V[9]),
        .I1(\x_V[12]_i_2_n_0 ),
        .I2(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0 ),
        .I3(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0 ),
        .I4(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I5(eventFIFOIn_V[9]),
        .O(p_1_in[9]));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[0] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[0]),
        .Q(\^yRegReg_V [0]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[10] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[10]),
        .Q(\^yRegReg_V [10]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[11] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[11]),
        .Q(\^yRegReg_V [11]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[1] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[1]),
        .Q(\^yRegReg_V [1]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[2] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[2]),
        .Q(\^yRegReg_V [2]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[3] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[3]),
        .Q(\^yRegReg_V [3]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[4] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[4]),
        .Q(\^yRegReg_V [4]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[5] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[5]),
        .Q(\^yRegReg_V [5]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[6] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[6]),
        .Q(\^yRegReg_V [6]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[7] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[7]),
        .Q(\^yRegReg_V [7]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[8] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[8]),
        .Q(\^yRegReg_V [8]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[9] 
       (.C(ap_clk),
        .CE(ap_ready),
        .D(p_1_in[9]),
        .Q(\^yRegReg_V [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAA08080808080808)) 
    ap_ready_INST_0
       (.I0(ap_start),
        .I1(ap_ready_INST_0_i_1_n_0),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(xStreamOut_V_V_1_ack_in),
        .I4(tsStreamOut_V_V_1_ack_in),
        .I5(yStreamOut_V_V_1_ack_in),
        .O(ap_ready));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFDFFFFF)) 
    ap_ready_INST_0_i_1
       (.I0(ap_start),
        .I1(eventFIFOIn_V[15]),
        .I2(eventFIFODataValid_V),
        .I3(eventFIFOIn_V[14]),
        .I4(eventFIFOIn_V[13]),
        .O(ap_ready_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h0888888888888888)) 
    ap_reg_ioackin_dataReg_V_dummy_ack_i_1
       (.I0(ap_reg_ioackin_dataReg_V_dummy_ack_reg_n_0),
        .I1(ap_rst_n),
        .I2(xStreamOut_V_V_1_ack_in),
        .I3(tsStreamOut_V_V_1_ack_in),
        .I4(yStreamOut_V_V_1_ack_in),
        .I5(ap_enable_reg_pp0_iter1),
        .O(ap_reg_ioackin_dataReg_V_dummy_ack_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_reg_ioackin_dataReg_V_dummy_ack_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_reg_ioackin_dataReg_V_dummy_ack_i_1_n_0),
        .Q(ap_reg_ioackin_dataReg_V_dummy_ack_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    dataReg_V_ap_vld_INST_0
       (.I0(xStreamOut_V_V_1_ack_in),
        .I1(tsStreamOut_V_V_1_ack_in),
        .I2(yStreamOut_V_V_1_ack_in),
        .I3(ap_enable_reg_pp0_iter1),
        .I4(ap_reg_ioackin_dataReg_V_dummy_ack_reg_n_0),
        .O(xRegReg_V_ap_vld));
  LUT3 #(
    .INIT(8'h45)) 
    \tsStreamOut_V_V_1_payload_A[14]_i_1 
       (.I0(tsStreamOut_V_V_1_sel_wr),
        .I1(tsStreamOut_V_V_1_ack_in),
        .I2(tsStreamOut_V_V_TVALID),
        .O(tsStreamOut_V_V_1_load_A));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[0] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[0]),
        .Q(tsStreamOut_V_V_1_payload_A[0]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[10] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[10]),
        .Q(tsStreamOut_V_V_1_payload_A[10]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[11] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[11]),
        .Q(tsStreamOut_V_V_1_payload_A[11]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[12] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[12]),
        .Q(tsStreamOut_V_V_1_payload_A[12]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[13] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[13]),
        .Q(tsStreamOut_V_V_1_payload_A[13]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[14] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[14]),
        .Q(tsStreamOut_V_V_1_payload_A[14]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[1] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[1]),
        .Q(tsStreamOut_V_V_1_payload_A[1]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[2] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[2]),
        .Q(tsStreamOut_V_V_1_payload_A[2]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[3] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[3]),
        .Q(tsStreamOut_V_V_1_payload_A[3]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[4] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[4]),
        .Q(tsStreamOut_V_V_1_payload_A[4]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[5] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[5]),
        .Q(tsStreamOut_V_V_1_payload_A[5]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[6] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[6]),
        .Q(tsStreamOut_V_V_1_payload_A[6]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[7] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[7]),
        .Q(tsStreamOut_V_V_1_payload_A[7]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[8] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[8]),
        .Q(tsStreamOut_V_V_1_payload_A[8]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_A_reg[9] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_A),
        .D(ts_V[9]),
        .Q(tsStreamOut_V_V_1_payload_A[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h8A)) 
    \tsStreamOut_V_V_1_payload_B[14]_i_1 
       (.I0(tsStreamOut_V_V_1_sel_wr),
        .I1(tsStreamOut_V_V_1_ack_in),
        .I2(tsStreamOut_V_V_TVALID),
        .O(tsStreamOut_V_V_1_load_B));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[0] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[0]),
        .Q(tsStreamOut_V_V_1_payload_B[0]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[10] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[10]),
        .Q(tsStreamOut_V_V_1_payload_B[10]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[11] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[11]),
        .Q(tsStreamOut_V_V_1_payload_B[11]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[12] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[12]),
        .Q(tsStreamOut_V_V_1_payload_B[12]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[13] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[13]),
        .Q(tsStreamOut_V_V_1_payload_B[13]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[14] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[14]),
        .Q(tsStreamOut_V_V_1_payload_B[14]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[1] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[1]),
        .Q(tsStreamOut_V_V_1_payload_B[1]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[2] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[2]),
        .Q(tsStreamOut_V_V_1_payload_B[2]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[3] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[3]),
        .Q(tsStreamOut_V_V_1_payload_B[3]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[4] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[4]),
        .Q(tsStreamOut_V_V_1_payload_B[4]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[5] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[5]),
        .Q(tsStreamOut_V_V_1_payload_B[5]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[6] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[6]),
        .Q(tsStreamOut_V_V_1_payload_B[6]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[7] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[7]),
        .Q(tsStreamOut_V_V_1_payload_B[7]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[8] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[8]),
        .Q(tsStreamOut_V_V_1_payload_B[8]),
        .R(1'b0));
  FDRE \tsStreamOut_V_V_1_payload_B_reg[9] 
       (.C(ap_clk),
        .CE(tsStreamOut_V_V_1_load_B),
        .D(ts_V[9]),
        .Q(tsStreamOut_V_V_1_payload_B[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    tsStreamOut_V_V_1_sel_rd_i_1
       (.I0(tsStreamOut_V_V_TVALID),
        .I1(tsStreamOut_V_V_TREADY),
        .I2(tsStreamOut_V_V_1_sel),
        .O(tsStreamOut_V_V_1_sel_rd_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tsStreamOut_V_V_1_sel_rd_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(tsStreamOut_V_V_1_sel_rd_i_1_n_0),
        .Q(tsStreamOut_V_V_1_sel),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    tsStreamOut_V_V_1_sel_wr_i_1
       (.I0(ap_ready_INST_0_i_1_n_0),
        .I1(xStreamOut_V_V_1_ack_in),
        .I2(tsStreamOut_V_V_1_ack_in),
        .I3(yStreamOut_V_V_1_ack_in),
        .I4(tsStreamOut_V_V_1_sel_wr),
        .O(tsStreamOut_V_V_1_sel_wr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tsStreamOut_V_V_1_sel_wr_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(tsStreamOut_V_V_1_sel_wr_i_1_n_0),
        .Q(tsStreamOut_V_V_1_sel_wr),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'h2A002A002A00AAAA)) 
    \tsStreamOut_V_V_1_state[0]_i_1 
       (.I0(ap_rst_n),
        .I1(tsStreamOut_V_V_1_ack_in),
        .I2(tsStreamOut_V_V_TREADY),
        .I3(tsStreamOut_V_V_TVALID),
        .I4(\x_V[12]_i_2_n_0 ),
        .I5(ap_ready_INST_0_i_1_n_0),
        .O(\tsStreamOut_V_V_1_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFBFBFBBBFBFBFB)) 
    \tsStreamOut_V_V_1_state[1]_i_1 
       (.I0(tsStreamOut_V_V_TREADY),
        .I1(tsStreamOut_V_V_TVALID),
        .I2(tsStreamOut_V_V_1_ack_in),
        .I3(yStreamOut_V_V_1_ack_in),
        .I4(xStreamOut_V_V_1_ack_in),
        .I5(ap_ready_INST_0_i_1_n_0),
        .O(tsStreamOut_V_V_1_state));
  FDRE #(
    .INIT(1'b0)) 
    \tsStreamOut_V_V_1_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\tsStreamOut_V_V_1_state[0]_i_1_n_0 ),
        .Q(tsStreamOut_V_V_TVALID),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tsStreamOut_V_V_1_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(tsStreamOut_V_V_1_state),
        .Q(tsStreamOut_V_V_1_ack_in),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[0]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[0]),
        .I1(tsStreamOut_V_V_1_payload_A[0]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[10]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[10]),
        .I1(tsStreamOut_V_V_1_payload_A[10]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [10]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[11]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[11]),
        .I1(tsStreamOut_V_V_1_payload_A[11]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [11]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[12]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[12]),
        .I1(tsStreamOut_V_V_1_payload_A[12]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [12]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[13]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[13]),
        .I1(tsStreamOut_V_V_1_payload_A[13]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [13]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[14]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[14]),
        .I1(tsStreamOut_V_V_1_payload_A[14]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [14]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[1]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[1]),
        .I1(tsStreamOut_V_V_1_payload_A[1]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [1]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[2]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[2]),
        .I1(tsStreamOut_V_V_1_payload_A[2]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [2]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[3]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[3]),
        .I1(tsStreamOut_V_V_1_payload_A[3]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[4]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[4]),
        .I1(tsStreamOut_V_V_1_payload_A[4]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [4]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[5]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[5]),
        .I1(tsStreamOut_V_V_1_payload_A[5]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [5]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[6]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[6]),
        .I1(tsStreamOut_V_V_1_payload_A[6]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [6]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[7]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[7]),
        .I1(tsStreamOut_V_V_1_payload_A[7]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [7]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[8]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[8]),
        .I1(tsStreamOut_V_V_1_payload_A[8]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [8]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \tsStreamOut_V_V_TDATA[9]_INST_0 
       (.I0(tsStreamOut_V_V_1_payload_B[9]),
        .I1(tsStreamOut_V_V_1_payload_A[9]),
        .I2(tsStreamOut_V_V_1_sel),
        .O(\^tsStreamOut_V_V_TDATA [9]));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[0] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[0]),
        .Q(ts_V[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[10] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[10]),
        .Q(ts_V[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[11] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[11]),
        .Q(ts_V[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[12] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[12]),
        .Q(ts_V[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[13] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[13]),
        .Q(ts_V[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[14] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[14]),
        .Q(ts_V[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[1] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[1]),
        .Q(ts_V[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[2] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[2]),
        .Q(ts_V[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[3] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[3]),
        .Q(ts_V[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[4] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[4]),
        .Q(ts_V[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[5] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[5]),
        .Q(ts_V[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[6] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[6]),
        .Q(ts_V[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[7] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[7]),
        .Q(ts_V[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[8] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[8]),
        .Q(ts_V[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ts_V_reg[9] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_1752),
        .D(eventFIFOIn_V[9]),
        .Q(ts_V[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h45)) 
    \xStreamOut_V_V_1_payload_A[12]_i_1 
       (.I0(xStreamOut_V_V_1_sel_wr),
        .I1(xStreamOut_V_V_1_ack_in),
        .I2(xStreamOut_V_V_TVALID),
        .O(xStreamOut_V_V_1_load_A));
  FDRE \xStreamOut_V_V_1_payload_A_reg[0] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[0]),
        .Q(xStreamOut_V_V_1_payload_A[0]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[10] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[10]),
        .Q(xStreamOut_V_V_1_payload_A[10]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[11] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[11]),
        .Q(xStreamOut_V_V_1_payload_A[11]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[12] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[12]),
        .Q(xStreamOut_V_V_1_payload_A[12]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[1] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[1]),
        .Q(xStreamOut_V_V_1_payload_A[1]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[2] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[2]),
        .Q(xStreamOut_V_V_1_payload_A[2]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[3] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[3]),
        .Q(xStreamOut_V_V_1_payload_A[3]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[4] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[4]),
        .Q(xStreamOut_V_V_1_payload_A[4]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[5] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[5]),
        .Q(xStreamOut_V_V_1_payload_A[5]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[6] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[6]),
        .Q(xStreamOut_V_V_1_payload_A[6]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[7] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[7]),
        .Q(xStreamOut_V_V_1_payload_A[7]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[8] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[8]),
        .Q(xStreamOut_V_V_1_payload_A[8]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_A_reg[9] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_A),
        .D(eventFIFOIn_V[9]),
        .Q(xStreamOut_V_V_1_payload_A[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h8A)) 
    \xStreamOut_V_V_1_payload_B[12]_i_1 
       (.I0(xStreamOut_V_V_1_sel_wr),
        .I1(xStreamOut_V_V_1_ack_in),
        .I2(xStreamOut_V_V_TVALID),
        .O(xStreamOut_V_V_1_load_B));
  FDRE \xStreamOut_V_V_1_payload_B_reg[0] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[0]),
        .Q(xStreamOut_V_V_1_payload_B[0]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[10] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[10]),
        .Q(xStreamOut_V_V_1_payload_B[10]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[11] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[11]),
        .Q(xStreamOut_V_V_1_payload_B[11]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[12] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[12]),
        .Q(xStreamOut_V_V_1_payload_B[12]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[1] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[1]),
        .Q(xStreamOut_V_V_1_payload_B[1]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[2] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[2]),
        .Q(xStreamOut_V_V_1_payload_B[2]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[3] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[3]),
        .Q(xStreamOut_V_V_1_payload_B[3]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[4] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[4]),
        .Q(xStreamOut_V_V_1_payload_B[4]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[5] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[5]),
        .Q(xStreamOut_V_V_1_payload_B[5]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[6] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[6]),
        .Q(xStreamOut_V_V_1_payload_B[6]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[7] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[7]),
        .Q(xStreamOut_V_V_1_payload_B[7]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[8] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[8]),
        .Q(xStreamOut_V_V_1_payload_B[8]),
        .R(1'b0));
  FDRE \xStreamOut_V_V_1_payload_B_reg[9] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_load_B),
        .D(eventFIFOIn_V[9]),
        .Q(xStreamOut_V_V_1_payload_B[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    xStreamOut_V_V_1_sel_rd_i_1
       (.I0(xStreamOut_V_V_TVALID),
        .I1(xStreamOut_V_V_TREADY),
        .I2(xStreamOut_V_V_1_sel),
        .O(xStreamOut_V_V_1_sel_rd_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    xStreamOut_V_V_1_sel_rd_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(xStreamOut_V_V_1_sel_rd_i_1_n_0),
        .Q(xStreamOut_V_V_1_sel),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    xStreamOut_V_V_1_sel_wr_i_1
       (.I0(ap_ready_INST_0_i_1_n_0),
        .I1(xStreamOut_V_V_1_ack_in),
        .I2(tsStreamOut_V_V_1_ack_in),
        .I3(yStreamOut_V_V_1_ack_in),
        .I4(xStreamOut_V_V_1_sel_wr),
        .O(xStreamOut_V_V_1_sel_wr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    xStreamOut_V_V_1_sel_wr_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(xStreamOut_V_V_1_sel_wr_i_1_n_0),
        .Q(xStreamOut_V_V_1_sel_wr),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'h2A002A002A00AAAA)) 
    \xStreamOut_V_V_1_state[0]_i_1 
       (.I0(ap_rst_n),
        .I1(xStreamOut_V_V_1_ack_in),
        .I2(xStreamOut_V_V_TREADY),
        .I3(xStreamOut_V_V_TVALID),
        .I4(\x_V[12]_i_2_n_0 ),
        .I5(ap_ready_INST_0_i_1_n_0),
        .O(\xStreamOut_V_V_1_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFBFBFBBBFBFBFB)) 
    \xStreamOut_V_V_1_state[1]_i_1 
       (.I0(xStreamOut_V_V_TREADY),
        .I1(xStreamOut_V_V_TVALID),
        .I2(xStreamOut_V_V_1_ack_in),
        .I3(yStreamOut_V_V_1_ack_in),
        .I4(tsStreamOut_V_V_1_ack_in),
        .I5(ap_ready_INST_0_i_1_n_0),
        .O(xStreamOut_V_V_1_state));
  FDRE #(
    .INIT(1'b0)) 
    \xStreamOut_V_V_1_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\xStreamOut_V_V_1_state[0]_i_1_n_0 ),
        .Q(xStreamOut_V_V_TVALID),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \xStreamOut_V_V_1_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(xStreamOut_V_V_1_state),
        .Q(xStreamOut_V_V_1_ack_in),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[0]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[0]),
        .I1(xStreamOut_V_V_1_payload_A[0]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[10]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[10]),
        .I1(xStreamOut_V_V_1_payload_A[10]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [10]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[11]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[11]),
        .I1(xStreamOut_V_V_1_payload_A[11]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [11]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[12]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[12]),
        .I1(xStreamOut_V_V_1_payload_A[12]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[1]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[1]),
        .I1(xStreamOut_V_V_1_payload_A[1]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[2]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[2]),
        .I1(xStreamOut_V_V_1_payload_A[2]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[3]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[3]),
        .I1(xStreamOut_V_V_1_payload_A[3]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[4]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[4]),
        .I1(xStreamOut_V_V_1_payload_A[4]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[5]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[5]),
        .I1(xStreamOut_V_V_1_payload_A[5]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[6]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[6]),
        .I1(xStreamOut_V_V_1_payload_A[6]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[7]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[7]),
        .I1(xStreamOut_V_V_1_payload_A[7]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[8]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[8]),
        .I1(xStreamOut_V_V_1_payload_A[8]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \xStreamOut_V_V_TDATA[9]_INST_0 
       (.I0(xStreamOut_V_V_1_payload_B[9]),
        .I1(xStreamOut_V_V_1_payload_A[9]),
        .I2(xStreamOut_V_V_1_sel),
        .O(\^xStreamOut_V_V_TDATA [9]));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \x_V[12]_i_1 
       (.I0(\x_V[12]_i_2_n_0 ),
        .I1(eventFIFOIn_V[13]),
        .I2(eventFIFOIn_V[14]),
        .I3(eventFIFODataValid_V),
        .I4(eventFIFOIn_V[15]),
        .I5(ap_start),
        .O(xStreamOut_V_V_1_sel_wr029_out));
  LUT3 #(
    .INIT(8'h7F)) 
    \x_V[12]_i_2 
       (.I0(xStreamOut_V_V_1_ack_in),
        .I1(tsStreamOut_V_V_1_ack_in),
        .I2(yStreamOut_V_V_1_ack_in),
        .O(\x_V[12]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[0] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[0]),
        .Q(\^xRegReg_V [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[10] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[10]),
        .Q(\^xRegReg_V [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[11] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[11]),
        .Q(\^xRegReg_V [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[12] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[12]),
        .Q(\^xRegReg_V [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[1] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[1]),
        .Q(\^xRegReg_V [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[2] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[2]),
        .Q(\^xRegReg_V [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[3] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[3]),
        .Q(\^xRegReg_V [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[4] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[4]),
        .Q(\^xRegReg_V [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[5] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[5]),
        .Q(\^xRegReg_V [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[6] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[6]),
        .Q(\^xRegReg_V [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[7] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[7]),
        .Q(\^xRegReg_V [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[8] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[8]),
        .Q(\^xRegReg_V [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_V_reg[9] 
       (.C(ap_clk),
        .CE(xStreamOut_V_V_1_sel_wr029_out),
        .D(eventFIFOIn_V[9]),
        .Q(\^xRegReg_V [9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h45)) 
    \yStreamOut_V_V_1_payload_A[11]_i_1 
       (.I0(yStreamOut_V_V_1_sel_wr),
        .I1(yStreamOut_V_V_1_ack_in),
        .I2(yStreamOut_V_V_TVALID),
        .O(yStreamOut_V_V_1_load_A));
  FDRE \yStreamOut_V_V_1_payload_A_reg[0] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[0]),
        .Q(yStreamOut_V_V_1_payload_A[0]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[10] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[10]),
        .Q(yStreamOut_V_V_1_payload_A[10]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[11] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[11]),
        .Q(yStreamOut_V_V_1_payload_A[11]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[1] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[1]),
        .Q(yStreamOut_V_V_1_payload_A[1]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[2] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[2]),
        .Q(yStreamOut_V_V_1_payload_A[2]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[3] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[3]),
        .Q(yStreamOut_V_V_1_payload_A[3]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[4] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[4]),
        .Q(yStreamOut_V_V_1_payload_A[4]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[5] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[5]),
        .Q(yStreamOut_V_V_1_payload_A[5]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[6] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[6]),
        .Q(yStreamOut_V_V_1_payload_A[6]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[7] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[7]),
        .Q(yStreamOut_V_V_1_payload_A[7]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[8] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[8]),
        .Q(yStreamOut_V_V_1_payload_A[8]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_A_reg[9] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_A),
        .D(y_V[9]),
        .Q(yStreamOut_V_V_1_payload_A[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h8A)) 
    \yStreamOut_V_V_1_payload_B[11]_i_1 
       (.I0(yStreamOut_V_V_1_sel_wr),
        .I1(yStreamOut_V_V_1_ack_in),
        .I2(yStreamOut_V_V_TVALID),
        .O(yStreamOut_V_V_1_load_B));
  FDRE \yStreamOut_V_V_1_payload_B_reg[0] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[0]),
        .Q(yStreamOut_V_V_1_payload_B[0]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[10] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[10]),
        .Q(yStreamOut_V_V_1_payload_B[10]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[11] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[11]),
        .Q(yStreamOut_V_V_1_payload_B[11]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[1] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[1]),
        .Q(yStreamOut_V_V_1_payload_B[1]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[2] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[2]),
        .Q(yStreamOut_V_V_1_payload_B[2]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[3] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[3]),
        .Q(yStreamOut_V_V_1_payload_B[3]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[4] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[4]),
        .Q(yStreamOut_V_V_1_payload_B[4]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[5] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[5]),
        .Q(yStreamOut_V_V_1_payload_B[5]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[6] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[6]),
        .Q(yStreamOut_V_V_1_payload_B[6]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[7] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[7]),
        .Q(yStreamOut_V_V_1_payload_B[7]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[8] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[8]),
        .Q(yStreamOut_V_V_1_payload_B[8]),
        .R(1'b0));
  FDRE \yStreamOut_V_V_1_payload_B_reg[9] 
       (.C(ap_clk),
        .CE(yStreamOut_V_V_1_load_B),
        .D(y_V[9]),
        .Q(yStreamOut_V_V_1_payload_B[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    yStreamOut_V_V_1_sel_rd_i_1
       (.I0(yStreamOut_V_V_TVALID),
        .I1(yStreamOut_V_V_TREADY),
        .I2(yStreamOut_V_V_1_sel),
        .O(yStreamOut_V_V_1_sel_rd_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    yStreamOut_V_V_1_sel_rd_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(yStreamOut_V_V_1_sel_rd_i_1_n_0),
        .Q(yStreamOut_V_V_1_sel),
        .R(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    yStreamOut_V_V_1_sel_wr_i_1
       (.I0(ap_ready_INST_0_i_1_n_0),
        .I1(xStreamOut_V_V_1_ack_in),
        .I2(tsStreamOut_V_V_1_ack_in),
        .I3(yStreamOut_V_V_1_ack_in),
        .I4(yStreamOut_V_V_1_sel_wr),
        .O(yStreamOut_V_V_1_sel_wr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    yStreamOut_V_V_1_sel_wr_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(yStreamOut_V_V_1_sel_wr_i_1_n_0),
        .Q(yStreamOut_V_V_1_sel_wr),
        .R(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'h2A002A002A00AAAA)) 
    \yStreamOut_V_V_1_state[0]_i_1 
       (.I0(ap_rst_n),
        .I1(yStreamOut_V_V_1_ack_in),
        .I2(yStreamOut_V_V_TREADY),
        .I3(yStreamOut_V_V_TVALID),
        .I4(\x_V[12]_i_2_n_0 ),
        .I5(ap_ready_INST_0_i_1_n_0),
        .O(\yStreamOut_V_V_1_state[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \yStreamOut_V_V_1_state[1]_i_1 
       (.I0(ap_rst_n),
        .O(ap_rst_n_inv));
  LUT6 #(
    .INIT(64'hFBFBFBFBBBFBFBFB)) 
    \yStreamOut_V_V_1_state[1]_i_2 
       (.I0(yStreamOut_V_V_TREADY),
        .I1(yStreamOut_V_V_TVALID),
        .I2(yStreamOut_V_V_1_ack_in),
        .I3(tsStreamOut_V_V_1_ack_in),
        .I4(xStreamOut_V_V_1_ack_in),
        .I5(ap_ready_INST_0_i_1_n_0),
        .O(yStreamOut_V_V_1_state));
  FDRE #(
    .INIT(1'b0)) 
    \yStreamOut_V_V_1_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\yStreamOut_V_V_1_state[0]_i_1_n_0 ),
        .Q(yStreamOut_V_V_TVALID),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \yStreamOut_V_V_1_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(yStreamOut_V_V_1_state),
        .Q(yStreamOut_V_V_1_ack_in),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[0]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[0]),
        .I1(yStreamOut_V_V_1_payload_A[0]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[10]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[10]),
        .I1(yStreamOut_V_V_1_payload_A[10]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [10]));
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[11]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[11]),
        .I1(yStreamOut_V_V_1_payload_A[11]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [11]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[1]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[1]),
        .I1(yStreamOut_V_V_1_payload_A[1]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[2]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[2]),
        .I1(yStreamOut_V_V_1_payload_A[2]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[3]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[3]),
        .I1(yStreamOut_V_V_1_payload_A[3]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[4]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[4]),
        .I1(yStreamOut_V_V_1_payload_A[4]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [4]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[5]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[5]),
        .I1(yStreamOut_V_V_1_payload_A[5]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [5]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[6]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[6]),
        .I1(yStreamOut_V_V_1_payload_A[6]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [6]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[7]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[7]),
        .I1(yStreamOut_V_V_1_payload_A[7]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [7]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[8]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[8]),
        .I1(yStreamOut_V_V_1_payload_A[8]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [8]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \yStreamOut_V_V_TDATA[9]_INST_0 
       (.I0(yStreamOut_V_V_1_payload_B[9]),
        .I1(yStreamOut_V_V_1_payload_A[9]),
        .I2(yStreamOut_V_V_1_sel),
        .O(\^yStreamOut_V_V_TDATA [9]));
  LUT6 #(
    .INIT(64'h0000040004040404)) 
    \y_V[11]_i_1 
       (.I0(\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0 ),
        .I1(eventFIFODataValid_V),
        .I2(eventFIFOIn_V[15]),
        .I3(ap_ready_INST_0_i_1_n_0),
        .I4(ap_enable_reg_pp0_iter1),
        .I5(\x_V[12]_i_2_n_0 ),
        .O(ap_phi_reg_pp0_iter1_p_1_reg_17539_out));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[0] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[0]),
        .Q(y_V[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[10] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[10]),
        .Q(y_V[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[11] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[11]),
        .Q(y_V[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[1] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[1]),
        .Q(y_V[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[2] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[2]),
        .Q(y_V[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[3] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[3]),
        .Q(y_V[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[4] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[4]),
        .Q(y_V[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[5] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[5]),
        .Q(y_V[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[6] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[6]),
        .Q(y_V[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[7] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[7]),
        .Q(y_V[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[8] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[8]),
        .Q(y_V[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_V_reg[9] 
       (.C(ap_clk),
        .CE(ap_phi_reg_pp0_iter1_p_1_reg_17539_out),
        .D(eventFIFOIn_V[9]),
        .Q(y_V[9]),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "brd_EVMUXDataToXYTSStream_0_0,EVMUXDataToXYTSStream,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "EVMUXDataToXYTSStream,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module brd_EVMUXDataToXYTSStream_0_0
   (xRegReg_V_ap_vld,
    yRegReg_V_ap_vld,
    tsRegReg_V_ap_vld,
    dataReg_V_ap_vld,
    ap_clk,
    ap_rst_n,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    tsStreamOut_V_V_TVALID,
    tsStreamOut_V_V_TREADY,
    tsStreamOut_V_V_TDATA,
    yStreamOut_V_V_TVALID,
    yStreamOut_V_V_TREADY,
    yStreamOut_V_V_TDATA,
    xStreamOut_V_V_TVALID,
    xStreamOut_V_V_TREADY,
    xStreamOut_V_V_TDATA,
    eventFIFOIn_V,
    eventFIFODataValid_V,
    xRegReg_V,
    yRegReg_V,
    tsRegReg_V,
    dataReg_V);
  output xRegReg_V_ap_vld;
  output yRegReg_V_ap_vld;
  output tsRegReg_V_ap_vld;
  output dataReg_V_ap_vld;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF tsStreamOut_V_V:yStreamOut_V_V:xStreamOut_V_V, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0" *) input ap_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input ap_rst_n;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input ap_start;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 tsStreamOut_V_V TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME tsStreamOut_V_V, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 64}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0" *) output tsStreamOut_V_V_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 tsStreamOut_V_V TREADY" *) input tsStreamOut_V_V_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 tsStreamOut_V_V TDATA" *) output [63:0]tsStreamOut_V_V_TDATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 yStreamOut_V_V TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME yStreamOut_V_V, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 16}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0" *) output yStreamOut_V_V_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 yStreamOut_V_V TREADY" *) input yStreamOut_V_V_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 yStreamOut_V_V TDATA" *) output [15:0]yStreamOut_V_V_TDATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 xStreamOut_V_V TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME xStreamOut_V_V, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 16}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0" *) output xStreamOut_V_V_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 xStreamOut_V_V TREADY" *) input xStreamOut_V_V_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 xStreamOut_V_V TDATA" *) output [15:0]xStreamOut_V_V_TDATA;
  (* x_interface_info = "xilinx.com:signal:data:1.0 eventFIFOIn_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME eventFIFOIn_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) input [15:0]eventFIFOIn_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 eventFIFODataValid_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME eventFIFODataValid_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) input [0:0]eventFIFODataValid_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 xRegReg_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME xRegReg_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) output [15:0]xRegReg_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 yRegReg_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME yRegReg_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) output [15:0]yRegReg_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 tsRegReg_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME tsRegReg_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) output [63:0]tsRegReg_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 dataReg_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME dataReg_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) output [15:0]dataReg_V;

  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst_n;
  wire ap_start;
  wire [15:0]dataReg_V;
  wire dataReg_V_ap_vld;
  wire [0:0]eventFIFODataValid_V;
  wire [15:0]eventFIFOIn_V;
  wire [63:0]tsRegReg_V;
  wire tsRegReg_V_ap_vld;
  wire [63:0]tsStreamOut_V_V_TDATA;
  wire tsStreamOut_V_V_TREADY;
  wire tsStreamOut_V_V_TVALID;
  wire [15:0]xRegReg_V;
  wire xRegReg_V_ap_vld;
  wire [15:0]xStreamOut_V_V_TDATA;
  wire xStreamOut_V_V_TREADY;
  wire xStreamOut_V_V_TVALID;
  wire [15:0]yRegReg_V;
  wire yRegReg_V_ap_vld;
  wire [15:0]yStreamOut_V_V_TDATA;
  wire yStreamOut_V_V_TREADY;
  wire yStreamOut_V_V_TVALID;

  brd_EVMUXDataToXYTSStream_0_0_EVMUXDataToXYTSStream U0
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .dataReg_V(dataReg_V),
        .dataReg_V_ap_vld(dataReg_V_ap_vld),
        .eventFIFODataValid_V(eventFIFODataValid_V),
        .eventFIFOIn_V(eventFIFOIn_V),
        .tsRegReg_V(tsRegReg_V),
        .tsRegReg_V_ap_vld(tsRegReg_V_ap_vld),
        .tsStreamOut_V_V_TDATA(tsStreamOut_V_V_TDATA),
        .tsStreamOut_V_V_TREADY(tsStreamOut_V_V_TREADY),
        .tsStreamOut_V_V_TVALID(tsStreamOut_V_V_TVALID),
        .xRegReg_V(xRegReg_V),
        .xRegReg_V_ap_vld(xRegReg_V_ap_vld),
        .xStreamOut_V_V_TDATA(xStreamOut_V_V_TDATA),
        .xStreamOut_V_V_TREADY(xStreamOut_V_V_TREADY),
        .xStreamOut_V_V_TVALID(xStreamOut_V_V_TVALID),
        .yRegReg_V(yRegReg_V),
        .yRegReg_V_ap_vld(yRegReg_V_ap_vld),
        .yStreamOut_V_V_TDATA(yStreamOut_V_V_TDATA),
        .yStreamOut_V_V_TREADY(yStreamOut_V_V_TREADY),
        .yStreamOut_V_V_TVALID(yStreamOut_V_V_TVALID));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
