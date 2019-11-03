-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Nov  2 19:34:46 2019
-- Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top brd_EVMUXDataToXYTSStream_0_0 -prefix
--               brd_EVMUXDataToXYTSStream_0_0_ brd_EVMUXDataToXYTSStream_0_0_sim_netlist.vhdl
-- Design      : brd_EVMUXDataToXYTSStream_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z045ffg900-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity brd_EVMUXDataToXYTSStream_0_0_EVMUXDataToXYTSStream is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    tsStreamOut_V_V_TREADY : in STD_LOGIC;
    yStreamOut_V_V_TREADY : in STD_LOGIC;
    xStreamOut_V_V_TREADY : in STD_LOGIC;
    eventFIFOIn_V : in STD_LOGIC_VECTOR ( 15 downto 0 );
    eventFIFODataValid_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    xRegReg_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    xRegReg_V_ap_vld : out STD_LOGIC;
    yRegReg_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    yRegReg_V_ap_vld : out STD_LOGIC;
    tsRegReg_V : out STD_LOGIC_VECTOR ( 63 downto 0 );
    tsRegReg_V_ap_vld : out STD_LOGIC;
    dataReg_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dataReg_V_ap_vld : out STD_LOGIC;
    xStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    xStreamOut_V_V_TVALID : out STD_LOGIC;
    yStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    yStreamOut_V_V_TVALID : out STD_LOGIC;
    tsStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    tsStreamOut_V_V_TVALID : out STD_LOGIC
  );
end brd_EVMUXDataToXYTSStream_0_0_EVMUXDataToXYTSStream;

architecture STRUCTURE of brd_EVMUXDataToXYTSStream_0_0_EVMUXDataToXYTSStream is
  signal \<const0>\ : STD_LOGIC;
  signal ap_enable_reg_pp0_iter1 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter1_i_1_n_0 : STD_LOGIC;
  signal ap_phi_reg_pp0_iter1_p_1_reg_1752 : STD_LOGIC;
  signal ap_phi_reg_pp0_iter1_p_1_reg_17539_out : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[0]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[10]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[11]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[12]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[13]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[14]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[1]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[2]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[3]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[4]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[5]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[6]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[7]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[8]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[9]_i_1_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\ : STD_LOGIC;
  signal \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\ : STD_LOGIC;
  signal \^ap_ready\ : STD_LOGIC;
  signal ap_ready_INST_0_i_1_n_0 : STD_LOGIC;
  signal ap_reg_ioackin_dataReg_V_dummy_ack_i_1_n_0 : STD_LOGIC;
  signal ap_reg_ioackin_dataReg_V_dummy_ack_reg_n_0 : STD_LOGIC;
  signal ap_rst_n_inv : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \^tsregreg_v\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal tsStreamOut_V_V_1_ack_in : STD_LOGIC;
  signal tsStreamOut_V_V_1_load_A : STD_LOGIC;
  signal tsStreamOut_V_V_1_load_B : STD_LOGIC;
  signal tsStreamOut_V_V_1_payload_A : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal tsStreamOut_V_V_1_payload_B : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal tsStreamOut_V_V_1_sel : STD_LOGIC;
  signal tsStreamOut_V_V_1_sel_rd_i_1_n_0 : STD_LOGIC;
  signal tsStreamOut_V_V_1_sel_wr : STD_LOGIC;
  signal tsStreamOut_V_V_1_sel_wr_i_1_n_0 : STD_LOGIC;
  signal tsStreamOut_V_V_1_state : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \tsStreamOut_V_V_1_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \^tsstreamout_v_v_tdata\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \^tsstreamout_v_v_tvalid\ : STD_LOGIC;
  signal ts_V : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \^xregreg_v\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \^xregreg_v_ap_vld\ : STD_LOGIC;
  signal xStreamOut_V_V_1_ack_in : STD_LOGIC;
  signal xStreamOut_V_V_1_load_A : STD_LOGIC;
  signal xStreamOut_V_V_1_load_B : STD_LOGIC;
  signal xStreamOut_V_V_1_payload_A : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal xStreamOut_V_V_1_payload_B : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal xStreamOut_V_V_1_sel : STD_LOGIC;
  signal xStreamOut_V_V_1_sel_rd_i_1_n_0 : STD_LOGIC;
  signal xStreamOut_V_V_1_sel_wr : STD_LOGIC;
  signal xStreamOut_V_V_1_sel_wr029_out : STD_LOGIC;
  signal xStreamOut_V_V_1_sel_wr_i_1_n_0 : STD_LOGIC;
  signal xStreamOut_V_V_1_state : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \xStreamOut_V_V_1_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \^xstreamout_v_v_tdata\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \^xstreamout_v_v_tvalid\ : STD_LOGIC;
  signal \x_V[12]_i_2_n_0\ : STD_LOGIC;
  signal \^yregreg_v\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal yStreamOut_V_V_1_ack_in : STD_LOGIC;
  signal yStreamOut_V_V_1_load_A : STD_LOGIC;
  signal yStreamOut_V_V_1_load_B : STD_LOGIC;
  signal yStreamOut_V_V_1_payload_A : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal yStreamOut_V_V_1_payload_B : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal yStreamOut_V_V_1_sel : STD_LOGIC;
  signal yStreamOut_V_V_1_sel_rd_i_1_n_0 : STD_LOGIC;
  signal yStreamOut_V_V_1_sel_wr : STD_LOGIC;
  signal yStreamOut_V_V_1_sel_wr_i_1_n_0 : STD_LOGIC;
  signal yStreamOut_V_V_1_state : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \yStreamOut_V_V_1_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \^ystreamout_v_v_tdata\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \^ystreamout_v_v_tvalid\ : STD_LOGIC;
  signal y_V : STD_LOGIC_VECTOR ( 11 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ap_done_INST_0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of ap_idle_INST_0 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of ap_ready_INST_0_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of dataReg_V_ap_vld_INST_0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of tsStreamOut_V_V_1_sel_rd_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[0]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[10]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[11]_INST_0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[12]_INST_0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[13]_INST_0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[14]_INST_0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[1]_INST_0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[2]_INST_0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[3]_INST_0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[4]_INST_0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[5]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[6]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[7]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[8]_INST_0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \tsStreamOut_V_V_TDATA[9]_INST_0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of xStreamOut_V_V_1_sel_rd_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[0]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[10]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[11]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[12]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[1]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[2]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[3]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[4]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[5]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[6]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[7]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[8]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \xStreamOut_V_V_TDATA[9]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of yStreamOut_V_V_1_sel_rd_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[0]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[10]_INST_0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[1]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[2]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[3]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[4]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[5]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[6]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[7]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[8]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \yStreamOut_V_V_TDATA[9]_INST_0\ : label is "soft_lutpair17";
begin
  ap_ready <= \^ap_ready\;
  dataReg_V_ap_vld <= \^xregreg_v_ap_vld\;
  tsRegReg_V(63) <= \<const0>\;
  tsRegReg_V(62) <= \<const0>\;
  tsRegReg_V(61) <= \<const0>\;
  tsRegReg_V(60) <= \<const0>\;
  tsRegReg_V(59) <= \<const0>\;
  tsRegReg_V(58) <= \<const0>\;
  tsRegReg_V(57) <= \<const0>\;
  tsRegReg_V(56) <= \<const0>\;
  tsRegReg_V(55) <= \<const0>\;
  tsRegReg_V(54) <= \<const0>\;
  tsRegReg_V(53) <= \<const0>\;
  tsRegReg_V(52) <= \<const0>\;
  tsRegReg_V(51) <= \<const0>\;
  tsRegReg_V(50) <= \<const0>\;
  tsRegReg_V(49) <= \<const0>\;
  tsRegReg_V(48) <= \<const0>\;
  tsRegReg_V(47) <= \<const0>\;
  tsRegReg_V(46) <= \<const0>\;
  tsRegReg_V(45) <= \<const0>\;
  tsRegReg_V(44) <= \<const0>\;
  tsRegReg_V(43) <= \<const0>\;
  tsRegReg_V(42) <= \<const0>\;
  tsRegReg_V(41) <= \<const0>\;
  tsRegReg_V(40) <= \<const0>\;
  tsRegReg_V(39) <= \<const0>\;
  tsRegReg_V(38) <= \<const0>\;
  tsRegReg_V(37) <= \<const0>\;
  tsRegReg_V(36) <= \<const0>\;
  tsRegReg_V(35) <= \<const0>\;
  tsRegReg_V(34) <= \<const0>\;
  tsRegReg_V(33) <= \<const0>\;
  tsRegReg_V(32) <= \<const0>\;
  tsRegReg_V(31) <= \<const0>\;
  tsRegReg_V(30) <= \<const0>\;
  tsRegReg_V(29) <= \<const0>\;
  tsRegReg_V(28) <= \<const0>\;
  tsRegReg_V(27) <= \<const0>\;
  tsRegReg_V(26) <= \<const0>\;
  tsRegReg_V(25) <= \<const0>\;
  tsRegReg_V(24) <= \<const0>\;
  tsRegReg_V(23) <= \<const0>\;
  tsRegReg_V(22) <= \<const0>\;
  tsRegReg_V(21) <= \<const0>\;
  tsRegReg_V(20) <= \<const0>\;
  tsRegReg_V(19) <= \<const0>\;
  tsRegReg_V(18) <= \<const0>\;
  tsRegReg_V(17) <= \<const0>\;
  tsRegReg_V(16) <= \<const0>\;
  tsRegReg_V(15) <= \<const0>\;
  tsRegReg_V(14 downto 0) <= \^tsregreg_v\(14 downto 0);
  tsRegReg_V_ap_vld <= \^xregreg_v_ap_vld\;
  tsStreamOut_V_V_TDATA(63) <= \<const0>\;
  tsStreamOut_V_V_TDATA(62) <= \<const0>\;
  tsStreamOut_V_V_TDATA(61) <= \<const0>\;
  tsStreamOut_V_V_TDATA(60) <= \<const0>\;
  tsStreamOut_V_V_TDATA(59) <= \<const0>\;
  tsStreamOut_V_V_TDATA(58) <= \<const0>\;
  tsStreamOut_V_V_TDATA(57) <= \<const0>\;
  tsStreamOut_V_V_TDATA(56) <= \<const0>\;
  tsStreamOut_V_V_TDATA(55) <= \<const0>\;
  tsStreamOut_V_V_TDATA(54) <= \<const0>\;
  tsStreamOut_V_V_TDATA(53) <= \<const0>\;
  tsStreamOut_V_V_TDATA(52) <= \<const0>\;
  tsStreamOut_V_V_TDATA(51) <= \<const0>\;
  tsStreamOut_V_V_TDATA(50) <= \<const0>\;
  tsStreamOut_V_V_TDATA(49) <= \<const0>\;
  tsStreamOut_V_V_TDATA(48) <= \<const0>\;
  tsStreamOut_V_V_TDATA(47) <= \<const0>\;
  tsStreamOut_V_V_TDATA(46) <= \<const0>\;
  tsStreamOut_V_V_TDATA(45) <= \<const0>\;
  tsStreamOut_V_V_TDATA(44) <= \<const0>\;
  tsStreamOut_V_V_TDATA(43) <= \<const0>\;
  tsStreamOut_V_V_TDATA(42) <= \<const0>\;
  tsStreamOut_V_V_TDATA(41) <= \<const0>\;
  tsStreamOut_V_V_TDATA(40) <= \<const0>\;
  tsStreamOut_V_V_TDATA(39) <= \<const0>\;
  tsStreamOut_V_V_TDATA(38) <= \<const0>\;
  tsStreamOut_V_V_TDATA(37) <= \<const0>\;
  tsStreamOut_V_V_TDATA(36) <= \<const0>\;
  tsStreamOut_V_V_TDATA(35) <= \<const0>\;
  tsStreamOut_V_V_TDATA(34) <= \<const0>\;
  tsStreamOut_V_V_TDATA(33) <= \<const0>\;
  tsStreamOut_V_V_TDATA(32) <= \<const0>\;
  tsStreamOut_V_V_TDATA(31) <= \<const0>\;
  tsStreamOut_V_V_TDATA(30) <= \<const0>\;
  tsStreamOut_V_V_TDATA(29) <= \<const0>\;
  tsStreamOut_V_V_TDATA(28) <= \<const0>\;
  tsStreamOut_V_V_TDATA(27) <= \<const0>\;
  tsStreamOut_V_V_TDATA(26) <= \<const0>\;
  tsStreamOut_V_V_TDATA(25) <= \<const0>\;
  tsStreamOut_V_V_TDATA(24) <= \<const0>\;
  tsStreamOut_V_V_TDATA(23) <= \<const0>\;
  tsStreamOut_V_V_TDATA(22) <= \<const0>\;
  tsStreamOut_V_V_TDATA(21) <= \<const0>\;
  tsStreamOut_V_V_TDATA(20) <= \<const0>\;
  tsStreamOut_V_V_TDATA(19) <= \<const0>\;
  tsStreamOut_V_V_TDATA(18) <= \<const0>\;
  tsStreamOut_V_V_TDATA(17) <= \<const0>\;
  tsStreamOut_V_V_TDATA(16) <= \<const0>\;
  tsStreamOut_V_V_TDATA(15) <= \<const0>\;
  tsStreamOut_V_V_TDATA(14 downto 0) <= \^tsstreamout_v_v_tdata\(14 downto 0);
  tsStreamOut_V_V_TVALID <= \^tsstreamout_v_v_tvalid\;
  xRegReg_V(15) <= \<const0>\;
  xRegReg_V(14) <= \<const0>\;
  xRegReg_V(13) <= \<const0>\;
  xRegReg_V(12 downto 0) <= \^xregreg_v\(12 downto 0);
  xRegReg_V_ap_vld <= \^xregreg_v_ap_vld\;
  xStreamOut_V_V_TDATA(15) <= \<const0>\;
  xStreamOut_V_V_TDATA(14) <= \<const0>\;
  xStreamOut_V_V_TDATA(13) <= \<const0>\;
  xStreamOut_V_V_TDATA(12 downto 0) <= \^xstreamout_v_v_tdata\(12 downto 0);
  xStreamOut_V_V_TVALID <= \^xstreamout_v_v_tvalid\;
  yRegReg_V(15) <= \<const0>\;
  yRegReg_V(14) <= \<const0>\;
  yRegReg_V(13) <= \<const0>\;
  yRegReg_V(12) <= \<const0>\;
  yRegReg_V(11 downto 0) <= \^yregreg_v\(11 downto 0);
  yRegReg_V_ap_vld <= \^xregreg_v_ap_vld\;
  yStreamOut_V_V_TDATA(15) <= \<const0>\;
  yStreamOut_V_V_TDATA(14) <= \<const0>\;
  yStreamOut_V_V_TDATA(13) <= \<const0>\;
  yStreamOut_V_V_TDATA(12) <= \<const0>\;
  yStreamOut_V_V_TDATA(11 downto 0) <= \^ystreamout_v_v_tdata\(11 downto 0);
  yStreamOut_V_V_TVALID <= \^ystreamout_v_v_tvalid\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
ap_done_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter1,
      I1 => yStreamOut_V_V_1_ack_in,
      I2 => tsStreamOut_V_V_1_ack_in,
      I3 => xStreamOut_V_V_1_ack_in,
      O => ap_done
    );
ap_enable_reg_pp0_iter1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAF8F8F8F8F8F8F8"
    )
        port map (
      I0 => ap_start,
      I1 => ap_ready_INST_0_i_1_n_0,
      I2 => ap_enable_reg_pp0_iter1,
      I3 => xStreamOut_V_V_1_ack_in,
      I4 => tsStreamOut_V_V_1_ack_in,
      I5 => yStreamOut_V_V_1_ack_in,
      O => ap_enable_reg_pp0_iter1_i_1_n_0
    );
ap_enable_reg_pp0_iter1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter1_i_1_n_0,
      Q => ap_enable_reg_pp0_iter1,
      R => ap_rst_n_inv
    );
ap_idle_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_start,
      I1 => ap_enable_reg_pp0_iter1,
      O => ap_idle
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"15110000"
    )
        port map (
      I0 => eventFIFODataValid_V(0),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => ap_enable_reg_pp0_iter1,
      I3 => ap_ready_INST_0_i_1_n_0,
      I4 => ap_start,
      O => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7500000000000000"
    )
        port map (
      I0 => \x_V[12]_i_2_n_0\,
      I1 => ap_enable_reg_pp0_iter1,
      I2 => ap_ready_INST_0_i_1_n_0,
      I3 => ap_start,
      I4 => eventFIFODataValid_V(0),
      I5 => eventFIFOIn_V(15),
      O => ap_phi_reg_pp0_iter1_p_1_reg_1752
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(0),
      Q => dataReg_V(0),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(10),
      Q => dataReg_V(10),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(11),
      Q => dataReg_V(11),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(12),
      Q => dataReg_V(12),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(13),
      Q => dataReg_V(13),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(14),
      Q => dataReg_V(14),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      Q => dataReg_V(15),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(1),
      Q => dataReg_V(1),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(2),
      Q => dataReg_V(2),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(3),
      Q => dataReg_V(3),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(4),
      Q => dataReg_V(4),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(5),
      Q => dataReg_V(5),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(6),
      Q => dataReg_V(6),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(7),
      Q => dataReg_V(7),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(8),
      Q => dataReg_V(8),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_p_1_reg_175_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => eventFIFOIn_V(9),
      Q => dataReg_V(9),
      R => \ap_phi_reg_pp0_iter1_p_1_reg_175[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(0),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(0),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[0]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(10),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(10),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[10]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(11),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(11),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[11]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(12),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(12),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[12]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(13),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(13),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[13]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(14),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(14),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[14]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(1),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(1),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[1]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(2),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(2),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[2]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(3),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(3),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[3]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(4),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(4),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[4]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(5),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(5),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[5]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(6),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(6),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[6]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(7),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(7),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[7]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(8),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(8),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[8]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7FFF780800080"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(9),
      I3 => \x_V[12]_i_2_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I5 => ts_V(9),
      O => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[9]_i_1_n_0\
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[0]_i_1_n_0\,
      Q => \^tsregreg_v\(0),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[10]_i_1_n_0\,
      Q => \^tsregreg_v\(10),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[11]_i_1_n_0\,
      Q => \^tsregreg_v\(11),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[12]_i_1_n_0\,
      Q => \^tsregreg_v\(12),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[13]_i_1_n_0\,
      Q => \^tsregreg_v\(13),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[14]_i_1_n_0\,
      Q => \^tsregreg_v\(14),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[1]_i_1_n_0\,
      Q => \^tsregreg_v\(1),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[2]_i_1_n_0\,
      Q => \^tsregreg_v\(2),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[3]_i_1_n_0\,
      Q => \^tsregreg_v\(3),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[4]_i_1_n_0\,
      Q => \^tsregreg_v\(4),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[5]_i_1_n_0\,
      Q => \^tsregreg_v\(5),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[6]_i_1_n_0\,
      Q => \^tsregreg_v\(6),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[7]_i_1_n_0\,
      Q => \^tsregreg_v\(7),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[8]_i_1_n_0\,
      Q => \^tsregreg_v\(8),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => \ap_phi_reg_pp0_iter1_ts_V_loc_1_reg_149[9]_i_1_n_0\,
      Q => \^tsregreg_v\(9),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(0),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(0),
      O => p_1_in(0)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(10),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(10),
      O => p_1_in(10)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(11),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(11),
      O => p_1_in(11)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFDFFFFF"
    )
        port map (
      I0 => eventFIFOIn_V(13),
      I1 => eventFIFOIn_V(14),
      I2 => eventFIFODataValid_V(0),
      I3 => eventFIFOIn_V(15),
      I4 => ap_start,
      I5 => ap_enable_reg_pp0_iter1,
      O => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => eventFIFOIn_V(15),
      I1 => eventFIFODataValid_V(0),
      O => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFF"
    )
        port map (
      I0 => eventFIFOIn_V(12),
      I1 => eventFIFOIn_V(13),
      I2 => eventFIFOIn_V(14),
      I3 => ap_start,
      O => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(1),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(1),
      O => p_1_in(1)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(2),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(2),
      O => p_1_in(2)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(3),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(3),
      O => p_1_in(3)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(4),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(4),
      O => p_1_in(4)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(5),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(5),
      O => p_1_in(5)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(6),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(6),
      O => p_1_in(6)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(7),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(7),
      O => p_1_in(7)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(8),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(8),
      O => p_1_in(8)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => y_V(9),
      I1 => \x_V[12]_i_2_n_0\,
      I2 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_2_n_0\,
      I3 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_3_n_0\,
      I4 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I5 => eventFIFOIn_V(9),
      O => p_1_in(9)
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(0),
      Q => \^yregreg_v\(0),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(10),
      Q => \^yregreg_v\(10),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(11),
      Q => \^yregreg_v\(11),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(1),
      Q => \^yregreg_v\(1),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(2),
      Q => \^yregreg_v\(2),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(3),
      Q => \^yregreg_v\(3),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(4),
      Q => \^yregreg_v\(4),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(5),
      Q => \^yregreg_v\(5),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(6),
      Q => \^yregreg_v\(6),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(7),
      Q => \^yregreg_v\(7),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(8),
      Q => \^yregreg_v\(8),
      R => '0'
    );
\ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \^ap_ready\,
      D => p_1_in(9),
      Q => \^yregreg_v\(9),
      R => '0'
    );
ap_ready_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08080808080808"
    )
        port map (
      I0 => ap_start,
      I1 => ap_ready_INST_0_i_1_n_0,
      I2 => ap_enable_reg_pp0_iter1,
      I3 => xStreamOut_V_V_1_ack_in,
      I4 => tsStreamOut_V_V_1_ack_in,
      I5 => yStreamOut_V_V_1_ack_in,
      O => \^ap_ready\
    );
ap_ready_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFDFFFFF"
    )
        port map (
      I0 => ap_start,
      I1 => eventFIFOIn_V(15),
      I2 => eventFIFODataValid_V(0),
      I3 => eventFIFOIn_V(14),
      I4 => eventFIFOIn_V(13),
      O => ap_ready_INST_0_i_1_n_0
    );
ap_reg_ioackin_dataReg_V_dummy_ack_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0888888888888888"
    )
        port map (
      I0 => ap_reg_ioackin_dataReg_V_dummy_ack_reg_n_0,
      I1 => ap_rst_n,
      I2 => xStreamOut_V_V_1_ack_in,
      I3 => tsStreamOut_V_V_1_ack_in,
      I4 => yStreamOut_V_V_1_ack_in,
      I5 => ap_enable_reg_pp0_iter1,
      O => ap_reg_ioackin_dataReg_V_dummy_ack_i_1_n_0
    );
ap_reg_ioackin_dataReg_V_dummy_ack_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_reg_ioackin_dataReg_V_dummy_ack_i_1_n_0,
      Q => ap_reg_ioackin_dataReg_V_dummy_ack_reg_n_0,
      R => '0'
    );
dataReg_V_ap_vld_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => xStreamOut_V_V_1_ack_in,
      I1 => tsStreamOut_V_V_1_ack_in,
      I2 => yStreamOut_V_V_1_ack_in,
      I3 => ap_enable_reg_pp0_iter1,
      I4 => ap_reg_ioackin_dataReg_V_dummy_ack_reg_n_0,
      O => \^xregreg_v_ap_vld\
    );
\tsStreamOut_V_V_1_payload_A[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => tsStreamOut_V_V_1_sel_wr,
      I1 => tsStreamOut_V_V_1_ack_in,
      I2 => \^tsstreamout_v_v_tvalid\,
      O => tsStreamOut_V_V_1_load_A
    );
\tsStreamOut_V_V_1_payload_A_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(0),
      Q => tsStreamOut_V_V_1_payload_A(0),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(10),
      Q => tsStreamOut_V_V_1_payload_A(10),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(11),
      Q => tsStreamOut_V_V_1_payload_A(11),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(12),
      Q => tsStreamOut_V_V_1_payload_A(12),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(13),
      Q => tsStreamOut_V_V_1_payload_A(13),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(14),
      Q => tsStreamOut_V_V_1_payload_A(14),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(1),
      Q => tsStreamOut_V_V_1_payload_A(1),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(2),
      Q => tsStreamOut_V_V_1_payload_A(2),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(3),
      Q => tsStreamOut_V_V_1_payload_A(3),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(4),
      Q => tsStreamOut_V_V_1_payload_A(4),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(5),
      Q => tsStreamOut_V_V_1_payload_A(5),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(6),
      Q => tsStreamOut_V_V_1_payload_A(6),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(7),
      Q => tsStreamOut_V_V_1_payload_A(7),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(8),
      Q => tsStreamOut_V_V_1_payload_A(8),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_A_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_A,
      D => ts_V(9),
      Q => tsStreamOut_V_V_1_payload_A(9),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => tsStreamOut_V_V_1_sel_wr,
      I1 => tsStreamOut_V_V_1_ack_in,
      I2 => \^tsstreamout_v_v_tvalid\,
      O => tsStreamOut_V_V_1_load_B
    );
\tsStreamOut_V_V_1_payload_B_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(0),
      Q => tsStreamOut_V_V_1_payload_B(0),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(10),
      Q => tsStreamOut_V_V_1_payload_B(10),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(11),
      Q => tsStreamOut_V_V_1_payload_B(11),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(12),
      Q => tsStreamOut_V_V_1_payload_B(12),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(13),
      Q => tsStreamOut_V_V_1_payload_B(13),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(14),
      Q => tsStreamOut_V_V_1_payload_B(14),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(1),
      Q => tsStreamOut_V_V_1_payload_B(1),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(2),
      Q => tsStreamOut_V_V_1_payload_B(2),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(3),
      Q => tsStreamOut_V_V_1_payload_B(3),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(4),
      Q => tsStreamOut_V_V_1_payload_B(4),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(5),
      Q => tsStreamOut_V_V_1_payload_B(5),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(6),
      Q => tsStreamOut_V_V_1_payload_B(6),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(7),
      Q => tsStreamOut_V_V_1_payload_B(7),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(8),
      Q => tsStreamOut_V_V_1_payload_B(8),
      R => '0'
    );
\tsStreamOut_V_V_1_payload_B_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => tsStreamOut_V_V_1_load_B,
      D => ts_V(9),
      Q => tsStreamOut_V_V_1_payload_B(9),
      R => '0'
    );
tsStreamOut_V_V_1_sel_rd_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^tsstreamout_v_v_tvalid\,
      I1 => tsStreamOut_V_V_TREADY,
      I2 => tsStreamOut_V_V_1_sel,
      O => tsStreamOut_V_V_1_sel_rd_i_1_n_0
    );
tsStreamOut_V_V_1_sel_rd_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => tsStreamOut_V_V_1_sel_rd_i_1_n_0,
      Q => tsStreamOut_V_V_1_sel,
      R => ap_rst_n_inv
    );
tsStreamOut_V_V_1_sel_wr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF4000"
    )
        port map (
      I0 => ap_ready_INST_0_i_1_n_0,
      I1 => xStreamOut_V_V_1_ack_in,
      I2 => tsStreamOut_V_V_1_ack_in,
      I3 => yStreamOut_V_V_1_ack_in,
      I4 => tsStreamOut_V_V_1_sel_wr,
      O => tsStreamOut_V_V_1_sel_wr_i_1_n_0
    );
tsStreamOut_V_V_1_sel_wr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => tsStreamOut_V_V_1_sel_wr_i_1_n_0,
      Q => tsStreamOut_V_V_1_sel_wr,
      R => ap_rst_n_inv
    );
\tsStreamOut_V_V_1_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2A002A002A00AAAA"
    )
        port map (
      I0 => ap_rst_n,
      I1 => tsStreamOut_V_V_1_ack_in,
      I2 => tsStreamOut_V_V_TREADY,
      I3 => \^tsstreamout_v_v_tvalid\,
      I4 => \x_V[12]_i_2_n_0\,
      I5 => ap_ready_INST_0_i_1_n_0,
      O => \tsStreamOut_V_V_1_state[0]_i_1_n_0\
    );
\tsStreamOut_V_V_1_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFBFBFBBBFBFBFB"
    )
        port map (
      I0 => tsStreamOut_V_V_TREADY,
      I1 => \^tsstreamout_v_v_tvalid\,
      I2 => tsStreamOut_V_V_1_ack_in,
      I3 => yStreamOut_V_V_1_ack_in,
      I4 => xStreamOut_V_V_1_ack_in,
      I5 => ap_ready_INST_0_i_1_n_0,
      O => tsStreamOut_V_V_1_state(1)
    );
\tsStreamOut_V_V_1_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \tsStreamOut_V_V_1_state[0]_i_1_n_0\,
      Q => \^tsstreamout_v_v_tvalid\,
      R => '0'
    );
\tsStreamOut_V_V_1_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => tsStreamOut_V_V_1_state(1),
      Q => tsStreamOut_V_V_1_ack_in,
      R => ap_rst_n_inv
    );
\tsStreamOut_V_V_TDATA[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(0),
      I1 => tsStreamOut_V_V_1_payload_A(0),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(0)
    );
\tsStreamOut_V_V_TDATA[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(10),
      I1 => tsStreamOut_V_V_1_payload_A(10),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(10)
    );
\tsStreamOut_V_V_TDATA[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(11),
      I1 => tsStreamOut_V_V_1_payload_A(11),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(11)
    );
\tsStreamOut_V_V_TDATA[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(12),
      I1 => tsStreamOut_V_V_1_payload_A(12),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(12)
    );
\tsStreamOut_V_V_TDATA[13]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(13),
      I1 => tsStreamOut_V_V_1_payload_A(13),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(13)
    );
\tsStreamOut_V_V_TDATA[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(14),
      I1 => tsStreamOut_V_V_1_payload_A(14),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(14)
    );
\tsStreamOut_V_V_TDATA[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(1),
      I1 => tsStreamOut_V_V_1_payload_A(1),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(1)
    );
\tsStreamOut_V_V_TDATA[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(2),
      I1 => tsStreamOut_V_V_1_payload_A(2),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(2)
    );
\tsStreamOut_V_V_TDATA[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(3),
      I1 => tsStreamOut_V_V_1_payload_A(3),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(3)
    );
\tsStreamOut_V_V_TDATA[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(4),
      I1 => tsStreamOut_V_V_1_payload_A(4),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(4)
    );
\tsStreamOut_V_V_TDATA[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(5),
      I1 => tsStreamOut_V_V_1_payload_A(5),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(5)
    );
\tsStreamOut_V_V_TDATA[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(6),
      I1 => tsStreamOut_V_V_1_payload_A(6),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(6)
    );
\tsStreamOut_V_V_TDATA[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(7),
      I1 => tsStreamOut_V_V_1_payload_A(7),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(7)
    );
\tsStreamOut_V_V_TDATA[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(8),
      I1 => tsStreamOut_V_V_1_payload_A(8),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(8)
    );
\tsStreamOut_V_V_TDATA[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => tsStreamOut_V_V_1_payload_B(9),
      I1 => tsStreamOut_V_V_1_payload_A(9),
      I2 => tsStreamOut_V_V_1_sel,
      O => \^tsstreamout_v_v_tdata\(9)
    );
\ts_V_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(0),
      Q => ts_V(0),
      R => '0'
    );
\ts_V_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(10),
      Q => ts_V(10),
      R => '0'
    );
\ts_V_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(11),
      Q => ts_V(11),
      R => '0'
    );
\ts_V_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(12),
      Q => ts_V(12),
      R => '0'
    );
\ts_V_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(13),
      Q => ts_V(13),
      R => '0'
    );
\ts_V_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(14),
      Q => ts_V(14),
      R => '0'
    );
\ts_V_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(1),
      Q => ts_V(1),
      R => '0'
    );
\ts_V_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(2),
      Q => ts_V(2),
      R => '0'
    );
\ts_V_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(3),
      Q => ts_V(3),
      R => '0'
    );
\ts_V_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(4),
      Q => ts_V(4),
      R => '0'
    );
\ts_V_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(5),
      Q => ts_V(5),
      R => '0'
    );
\ts_V_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(6),
      Q => ts_V(6),
      R => '0'
    );
\ts_V_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(7),
      Q => ts_V(7),
      R => '0'
    );
\ts_V_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(8),
      Q => ts_V(8),
      R => '0'
    );
\ts_V_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_1752,
      D => eventFIFOIn_V(9),
      Q => ts_V(9),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => xStreamOut_V_V_1_sel_wr,
      I1 => xStreamOut_V_V_1_ack_in,
      I2 => \^xstreamout_v_v_tvalid\,
      O => xStreamOut_V_V_1_load_A
    );
\xStreamOut_V_V_1_payload_A_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(0),
      Q => xStreamOut_V_V_1_payload_A(0),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(10),
      Q => xStreamOut_V_V_1_payload_A(10),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(11),
      Q => xStreamOut_V_V_1_payload_A(11),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(12),
      Q => xStreamOut_V_V_1_payload_A(12),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(1),
      Q => xStreamOut_V_V_1_payload_A(1),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(2),
      Q => xStreamOut_V_V_1_payload_A(2),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(3),
      Q => xStreamOut_V_V_1_payload_A(3),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(4),
      Q => xStreamOut_V_V_1_payload_A(4),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(5),
      Q => xStreamOut_V_V_1_payload_A(5),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(6),
      Q => xStreamOut_V_V_1_payload_A(6),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(7),
      Q => xStreamOut_V_V_1_payload_A(7),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(8),
      Q => xStreamOut_V_V_1_payload_A(8),
      R => '0'
    );
\xStreamOut_V_V_1_payload_A_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_A,
      D => eventFIFOIn_V(9),
      Q => xStreamOut_V_V_1_payload_A(9),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => xStreamOut_V_V_1_sel_wr,
      I1 => xStreamOut_V_V_1_ack_in,
      I2 => \^xstreamout_v_v_tvalid\,
      O => xStreamOut_V_V_1_load_B
    );
\xStreamOut_V_V_1_payload_B_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(0),
      Q => xStreamOut_V_V_1_payload_B(0),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(10),
      Q => xStreamOut_V_V_1_payload_B(10),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(11),
      Q => xStreamOut_V_V_1_payload_B(11),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(12),
      Q => xStreamOut_V_V_1_payload_B(12),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(1),
      Q => xStreamOut_V_V_1_payload_B(1),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(2),
      Q => xStreamOut_V_V_1_payload_B(2),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(3),
      Q => xStreamOut_V_V_1_payload_B(3),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(4),
      Q => xStreamOut_V_V_1_payload_B(4),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(5),
      Q => xStreamOut_V_V_1_payload_B(5),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(6),
      Q => xStreamOut_V_V_1_payload_B(6),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(7),
      Q => xStreamOut_V_V_1_payload_B(7),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(8),
      Q => xStreamOut_V_V_1_payload_B(8),
      R => '0'
    );
\xStreamOut_V_V_1_payload_B_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_load_B,
      D => eventFIFOIn_V(9),
      Q => xStreamOut_V_V_1_payload_B(9),
      R => '0'
    );
xStreamOut_V_V_1_sel_rd_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^xstreamout_v_v_tvalid\,
      I1 => xStreamOut_V_V_TREADY,
      I2 => xStreamOut_V_V_1_sel,
      O => xStreamOut_V_V_1_sel_rd_i_1_n_0
    );
xStreamOut_V_V_1_sel_rd_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => xStreamOut_V_V_1_sel_rd_i_1_n_0,
      Q => xStreamOut_V_V_1_sel,
      R => ap_rst_n_inv
    );
xStreamOut_V_V_1_sel_wr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF4000"
    )
        port map (
      I0 => ap_ready_INST_0_i_1_n_0,
      I1 => xStreamOut_V_V_1_ack_in,
      I2 => tsStreamOut_V_V_1_ack_in,
      I3 => yStreamOut_V_V_1_ack_in,
      I4 => xStreamOut_V_V_1_sel_wr,
      O => xStreamOut_V_V_1_sel_wr_i_1_n_0
    );
xStreamOut_V_V_1_sel_wr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => xStreamOut_V_V_1_sel_wr_i_1_n_0,
      Q => xStreamOut_V_V_1_sel_wr,
      R => ap_rst_n_inv
    );
\xStreamOut_V_V_1_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2A002A002A00AAAA"
    )
        port map (
      I0 => ap_rst_n,
      I1 => xStreamOut_V_V_1_ack_in,
      I2 => xStreamOut_V_V_TREADY,
      I3 => \^xstreamout_v_v_tvalid\,
      I4 => \x_V[12]_i_2_n_0\,
      I5 => ap_ready_INST_0_i_1_n_0,
      O => \xStreamOut_V_V_1_state[0]_i_1_n_0\
    );
\xStreamOut_V_V_1_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFBFBFBBBFBFBFB"
    )
        port map (
      I0 => xStreamOut_V_V_TREADY,
      I1 => \^xstreamout_v_v_tvalid\,
      I2 => xStreamOut_V_V_1_ack_in,
      I3 => yStreamOut_V_V_1_ack_in,
      I4 => tsStreamOut_V_V_1_ack_in,
      I5 => ap_ready_INST_0_i_1_n_0,
      O => xStreamOut_V_V_1_state(1)
    );
\xStreamOut_V_V_1_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \xStreamOut_V_V_1_state[0]_i_1_n_0\,
      Q => \^xstreamout_v_v_tvalid\,
      R => '0'
    );
\xStreamOut_V_V_1_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => xStreamOut_V_V_1_state(1),
      Q => xStreamOut_V_V_1_ack_in,
      R => ap_rst_n_inv
    );
\xStreamOut_V_V_TDATA[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(0),
      I1 => xStreamOut_V_V_1_payload_A(0),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(0)
    );
\xStreamOut_V_V_TDATA[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(10),
      I1 => xStreamOut_V_V_1_payload_A(10),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(10)
    );
\xStreamOut_V_V_TDATA[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(11),
      I1 => xStreamOut_V_V_1_payload_A(11),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(11)
    );
\xStreamOut_V_V_TDATA[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(12),
      I1 => xStreamOut_V_V_1_payload_A(12),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(12)
    );
\xStreamOut_V_V_TDATA[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(1),
      I1 => xStreamOut_V_V_1_payload_A(1),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(1)
    );
\xStreamOut_V_V_TDATA[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(2),
      I1 => xStreamOut_V_V_1_payload_A(2),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(2)
    );
\xStreamOut_V_V_TDATA[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(3),
      I1 => xStreamOut_V_V_1_payload_A(3),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(3)
    );
\xStreamOut_V_V_TDATA[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(4),
      I1 => xStreamOut_V_V_1_payload_A(4),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(4)
    );
\xStreamOut_V_V_TDATA[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(5),
      I1 => xStreamOut_V_V_1_payload_A(5),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(5)
    );
\xStreamOut_V_V_TDATA[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(6),
      I1 => xStreamOut_V_V_1_payload_A(6),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(6)
    );
\xStreamOut_V_V_TDATA[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(7),
      I1 => xStreamOut_V_V_1_payload_A(7),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(7)
    );
\xStreamOut_V_V_TDATA[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(8),
      I1 => xStreamOut_V_V_1_payload_A(8),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(8)
    );
\xStreamOut_V_V_TDATA[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => xStreamOut_V_V_1_payload_B(9),
      I1 => xStreamOut_V_V_1_payload_A(9),
      I2 => xStreamOut_V_V_1_sel,
      O => \^xstreamout_v_v_tdata\(9)
    );
\x_V[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000040000000000"
    )
        port map (
      I0 => \x_V[12]_i_2_n_0\,
      I1 => eventFIFOIn_V(13),
      I2 => eventFIFOIn_V(14),
      I3 => eventFIFODataValid_V(0),
      I4 => eventFIFOIn_V(15),
      I5 => ap_start,
      O => xStreamOut_V_V_1_sel_wr029_out
    );
\x_V[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => xStreamOut_V_V_1_ack_in,
      I1 => tsStreamOut_V_V_1_ack_in,
      I2 => yStreamOut_V_V_1_ack_in,
      O => \x_V[12]_i_2_n_0\
    );
\x_V_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(0),
      Q => \^xregreg_v\(0),
      R => '0'
    );
\x_V_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(10),
      Q => \^xregreg_v\(10),
      R => '0'
    );
\x_V_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(11),
      Q => \^xregreg_v\(11),
      R => '0'
    );
\x_V_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(12),
      Q => \^xregreg_v\(12),
      R => '0'
    );
\x_V_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(1),
      Q => \^xregreg_v\(1),
      R => '0'
    );
\x_V_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(2),
      Q => \^xregreg_v\(2),
      R => '0'
    );
\x_V_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(3),
      Q => \^xregreg_v\(3),
      R => '0'
    );
\x_V_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(4),
      Q => \^xregreg_v\(4),
      R => '0'
    );
\x_V_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(5),
      Q => \^xregreg_v\(5),
      R => '0'
    );
\x_V_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(6),
      Q => \^xregreg_v\(6),
      R => '0'
    );
\x_V_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(7),
      Q => \^xregreg_v\(7),
      R => '0'
    );
\x_V_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(8),
      Q => \^xregreg_v\(8),
      R => '0'
    );
\x_V_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => xStreamOut_V_V_1_sel_wr029_out,
      D => eventFIFOIn_V(9),
      Q => \^xregreg_v\(9),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => yStreamOut_V_V_1_sel_wr,
      I1 => yStreamOut_V_V_1_ack_in,
      I2 => \^ystreamout_v_v_tvalid\,
      O => yStreamOut_V_V_1_load_A
    );
\yStreamOut_V_V_1_payload_A_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(0),
      Q => yStreamOut_V_V_1_payload_A(0),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(10),
      Q => yStreamOut_V_V_1_payload_A(10),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(11),
      Q => yStreamOut_V_V_1_payload_A(11),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(1),
      Q => yStreamOut_V_V_1_payload_A(1),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(2),
      Q => yStreamOut_V_V_1_payload_A(2),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(3),
      Q => yStreamOut_V_V_1_payload_A(3),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(4),
      Q => yStreamOut_V_V_1_payload_A(4),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(5),
      Q => yStreamOut_V_V_1_payload_A(5),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(6),
      Q => yStreamOut_V_V_1_payload_A(6),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(7),
      Q => yStreamOut_V_V_1_payload_A(7),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(8),
      Q => yStreamOut_V_V_1_payload_A(8),
      R => '0'
    );
\yStreamOut_V_V_1_payload_A_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_A,
      D => y_V(9),
      Q => yStreamOut_V_V_1_payload_A(9),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => yStreamOut_V_V_1_sel_wr,
      I1 => yStreamOut_V_V_1_ack_in,
      I2 => \^ystreamout_v_v_tvalid\,
      O => yStreamOut_V_V_1_load_B
    );
\yStreamOut_V_V_1_payload_B_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(0),
      Q => yStreamOut_V_V_1_payload_B(0),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(10),
      Q => yStreamOut_V_V_1_payload_B(10),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(11),
      Q => yStreamOut_V_V_1_payload_B(11),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(1),
      Q => yStreamOut_V_V_1_payload_B(1),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(2),
      Q => yStreamOut_V_V_1_payload_B(2),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(3),
      Q => yStreamOut_V_V_1_payload_B(3),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(4),
      Q => yStreamOut_V_V_1_payload_B(4),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(5),
      Q => yStreamOut_V_V_1_payload_B(5),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(6),
      Q => yStreamOut_V_V_1_payload_B(6),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(7),
      Q => yStreamOut_V_V_1_payload_B(7),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(8),
      Q => yStreamOut_V_V_1_payload_B(8),
      R => '0'
    );
\yStreamOut_V_V_1_payload_B_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => yStreamOut_V_V_1_load_B,
      D => y_V(9),
      Q => yStreamOut_V_V_1_payload_B(9),
      R => '0'
    );
yStreamOut_V_V_1_sel_rd_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^ystreamout_v_v_tvalid\,
      I1 => yStreamOut_V_V_TREADY,
      I2 => yStreamOut_V_V_1_sel,
      O => yStreamOut_V_V_1_sel_rd_i_1_n_0
    );
yStreamOut_V_V_1_sel_rd_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => yStreamOut_V_V_1_sel_rd_i_1_n_0,
      Q => yStreamOut_V_V_1_sel,
      R => ap_rst_n_inv
    );
yStreamOut_V_V_1_sel_wr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF4000"
    )
        port map (
      I0 => ap_ready_INST_0_i_1_n_0,
      I1 => xStreamOut_V_V_1_ack_in,
      I2 => tsStreamOut_V_V_1_ack_in,
      I3 => yStreamOut_V_V_1_ack_in,
      I4 => yStreamOut_V_V_1_sel_wr,
      O => yStreamOut_V_V_1_sel_wr_i_1_n_0
    );
yStreamOut_V_V_1_sel_wr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => yStreamOut_V_V_1_sel_wr_i_1_n_0,
      Q => yStreamOut_V_V_1_sel_wr,
      R => ap_rst_n_inv
    );
\yStreamOut_V_V_1_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2A002A002A00AAAA"
    )
        port map (
      I0 => ap_rst_n,
      I1 => yStreamOut_V_V_1_ack_in,
      I2 => yStreamOut_V_V_TREADY,
      I3 => \^ystreamout_v_v_tvalid\,
      I4 => \x_V[12]_i_2_n_0\,
      I5 => ap_ready_INST_0_i_1_n_0,
      O => \yStreamOut_V_V_1_state[0]_i_1_n_0\
    );
\yStreamOut_V_V_1_state[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_rst_n,
      O => ap_rst_n_inv
    );
\yStreamOut_V_V_1_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFBFBFBBBFBFBFB"
    )
        port map (
      I0 => yStreamOut_V_V_TREADY,
      I1 => \^ystreamout_v_v_tvalid\,
      I2 => yStreamOut_V_V_1_ack_in,
      I3 => tsStreamOut_V_V_1_ack_in,
      I4 => xStreamOut_V_V_1_ack_in,
      I5 => ap_ready_INST_0_i_1_n_0,
      O => yStreamOut_V_V_1_state(1)
    );
\yStreamOut_V_V_1_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \yStreamOut_V_V_1_state[0]_i_1_n_0\,
      Q => \^ystreamout_v_v_tvalid\,
      R => '0'
    );
\yStreamOut_V_V_1_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => yStreamOut_V_V_1_state(1),
      Q => yStreamOut_V_V_1_ack_in,
      R => ap_rst_n_inv
    );
\yStreamOut_V_V_TDATA[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(0),
      I1 => yStreamOut_V_V_1_payload_A(0),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(0)
    );
\yStreamOut_V_V_TDATA[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(10),
      I1 => yStreamOut_V_V_1_payload_A(10),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(10)
    );
\yStreamOut_V_V_TDATA[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(11),
      I1 => yStreamOut_V_V_1_payload_A(11),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(11)
    );
\yStreamOut_V_V_TDATA[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(1),
      I1 => yStreamOut_V_V_1_payload_A(1),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(1)
    );
\yStreamOut_V_V_TDATA[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(2),
      I1 => yStreamOut_V_V_1_payload_A(2),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(2)
    );
\yStreamOut_V_V_TDATA[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(3),
      I1 => yStreamOut_V_V_1_payload_A(3),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(3)
    );
\yStreamOut_V_V_TDATA[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(4),
      I1 => yStreamOut_V_V_1_payload_A(4),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(4)
    );
\yStreamOut_V_V_TDATA[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(5),
      I1 => yStreamOut_V_V_1_payload_A(5),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(5)
    );
\yStreamOut_V_V_TDATA[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(6),
      I1 => yStreamOut_V_V_1_payload_A(6),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(6)
    );
\yStreamOut_V_V_TDATA[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(7),
      I1 => yStreamOut_V_V_1_payload_A(7),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(7)
    );
\yStreamOut_V_V_TDATA[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(8),
      I1 => yStreamOut_V_V_1_payload_A(8),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(8)
    );
\yStreamOut_V_V_TDATA[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => yStreamOut_V_V_1_payload_B(9),
      I1 => yStreamOut_V_V_1_payload_A(9),
      I2 => yStreamOut_V_V_1_sel,
      O => \^ystreamout_v_v_tdata\(9)
    );
\y_V[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000040004040404"
    )
        port map (
      I0 => \ap_phi_reg_pp0_iter1_y_V_loc_2_reg_162[11]_i_4_n_0\,
      I1 => eventFIFODataValid_V(0),
      I2 => eventFIFOIn_V(15),
      I3 => ap_ready_INST_0_i_1_n_0,
      I4 => ap_enable_reg_pp0_iter1,
      I5 => \x_V[12]_i_2_n_0\,
      O => ap_phi_reg_pp0_iter1_p_1_reg_17539_out
    );
\y_V_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(0),
      Q => y_V(0),
      R => '0'
    );
\y_V_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(10),
      Q => y_V(10),
      R => '0'
    );
\y_V_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(11),
      Q => y_V(11),
      R => '0'
    );
\y_V_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(1),
      Q => y_V(1),
      R => '0'
    );
\y_V_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(2),
      Q => y_V(2),
      R => '0'
    );
\y_V_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(3),
      Q => y_V(3),
      R => '0'
    );
\y_V_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(4),
      Q => y_V(4),
      R => '0'
    );
\y_V_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(5),
      Q => y_V(5),
      R => '0'
    );
\y_V_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(6),
      Q => y_V(6),
      R => '0'
    );
\y_V_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(7),
      Q => y_V(7),
      R => '0'
    );
\y_V_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(8),
      Q => y_V(8),
      R => '0'
    );
\y_V_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_phi_reg_pp0_iter1_p_1_reg_17539_out,
      D => eventFIFOIn_V(9),
      Q => y_V(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity brd_EVMUXDataToXYTSStream_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of brd_EVMUXDataToXYTSStream_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of brd_EVMUXDataToXYTSStream_0_0 : entity is "brd_EVMUXDataToXYTSStream_0_0,EVMUXDataToXYTSStream,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of brd_EVMUXDataToXYTSStream_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of brd_EVMUXDataToXYTSStream_0_0 : entity is "EVMUXDataToXYTSStream,Vivado 2018.1";
end brd_EVMUXDataToXYTSStream_0_0;

architecture STRUCTURE of brd_EVMUXDataToXYTSStream_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF tsStreamOut_V_V:yStreamOut_V_V:xStreamOut_V_V, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0";
  attribute x_interface_info of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute x_interface_info of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute x_interface_info of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute x_interface_info of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute x_interface_parameter of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute x_interface_parameter of ap_start : signal is "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute x_interface_info of tsStreamOut_V_V_TREADY : signal is "xilinx.com:interface:axis:1.0 tsStreamOut_V_V TREADY";
  attribute x_interface_info of tsStreamOut_V_V_TVALID : signal is "xilinx.com:interface:axis:1.0 tsStreamOut_V_V TVALID";
  attribute x_interface_parameter of tsStreamOut_V_V_TVALID : signal is "XIL_INTERFACENAME tsStreamOut_V_V, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 64}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0";
  attribute x_interface_info of xStreamOut_V_V_TREADY : signal is "xilinx.com:interface:axis:1.0 xStreamOut_V_V TREADY";
  attribute x_interface_info of xStreamOut_V_V_TVALID : signal is "xilinx.com:interface:axis:1.0 xStreamOut_V_V TVALID";
  attribute x_interface_parameter of xStreamOut_V_V_TVALID : signal is "XIL_INTERFACENAME xStreamOut_V_V, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 16}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0";
  attribute x_interface_info of yStreamOut_V_V_TREADY : signal is "xilinx.com:interface:axis:1.0 yStreamOut_V_V TREADY";
  attribute x_interface_info of yStreamOut_V_V_TVALID : signal is "xilinx.com:interface:axis:1.0 yStreamOut_V_V TVALID";
  attribute x_interface_parameter of yStreamOut_V_V_TVALID : signal is "XIL_INTERFACENAME yStreamOut_V_V, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 16}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0";
  attribute x_interface_info of dataReg_V : signal is "xilinx.com:signal:data:1.0 dataReg_V DATA";
  attribute x_interface_parameter of dataReg_V : signal is "XIL_INTERFACENAME dataReg_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute x_interface_info of eventFIFODataValid_V : signal is "xilinx.com:signal:data:1.0 eventFIFODataValid_V DATA";
  attribute x_interface_parameter of eventFIFODataValid_V : signal is "XIL_INTERFACENAME eventFIFODataValid_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute x_interface_info of eventFIFOIn_V : signal is "xilinx.com:signal:data:1.0 eventFIFOIn_V DATA";
  attribute x_interface_parameter of eventFIFOIn_V : signal is "XIL_INTERFACENAME eventFIFOIn_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute x_interface_info of tsRegReg_V : signal is "xilinx.com:signal:data:1.0 tsRegReg_V DATA";
  attribute x_interface_parameter of tsRegReg_V : signal is "XIL_INTERFACENAME tsRegReg_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute x_interface_info of tsStreamOut_V_V_TDATA : signal is "xilinx.com:interface:axis:1.0 tsStreamOut_V_V TDATA";
  attribute x_interface_info of xRegReg_V : signal is "xilinx.com:signal:data:1.0 xRegReg_V DATA";
  attribute x_interface_parameter of xRegReg_V : signal is "XIL_INTERFACENAME xRegReg_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute x_interface_info of xStreamOut_V_V_TDATA : signal is "xilinx.com:interface:axis:1.0 xStreamOut_V_V TDATA";
  attribute x_interface_info of yRegReg_V : signal is "xilinx.com:signal:data:1.0 yRegReg_V DATA";
  attribute x_interface_parameter of yRegReg_V : signal is "XIL_INTERFACENAME yRegReg_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute x_interface_info of yStreamOut_V_V_TDATA : signal is "xilinx.com:interface:axis:1.0 yStreamOut_V_V TDATA";
begin
U0: entity work.brd_EVMUXDataToXYTSStream_0_0_EVMUXDataToXYTSStream
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      dataReg_V(15 downto 0) => dataReg_V(15 downto 0),
      dataReg_V_ap_vld => dataReg_V_ap_vld,
      eventFIFODataValid_V(0) => eventFIFODataValid_V(0),
      eventFIFOIn_V(15 downto 0) => eventFIFOIn_V(15 downto 0),
      tsRegReg_V(63 downto 0) => tsRegReg_V(63 downto 0),
      tsRegReg_V_ap_vld => tsRegReg_V_ap_vld,
      tsStreamOut_V_V_TDATA(63 downto 0) => tsStreamOut_V_V_TDATA(63 downto 0),
      tsStreamOut_V_V_TREADY => tsStreamOut_V_V_TREADY,
      tsStreamOut_V_V_TVALID => tsStreamOut_V_V_TVALID,
      xRegReg_V(15 downto 0) => xRegReg_V(15 downto 0),
      xRegReg_V_ap_vld => xRegReg_V_ap_vld,
      xStreamOut_V_V_TDATA(15 downto 0) => xStreamOut_V_V_TDATA(15 downto 0),
      xStreamOut_V_V_TREADY => xStreamOut_V_V_TREADY,
      xStreamOut_V_V_TVALID => xStreamOut_V_V_TVALID,
      yRegReg_V(15 downto 0) => yRegReg_V(15 downto 0),
      yRegReg_V_ap_vld => yRegReg_V_ap_vld,
      yStreamOut_V_V_TDATA(15 downto 0) => yStreamOut_V_V_TDATA(15 downto 0),
      yStreamOut_V_V_TREADY => yStreamOut_V_V_TREADY,
      yStreamOut_V_V_TVALID => yStreamOut_V_V_TVALID
    );
end STRUCTURE;
