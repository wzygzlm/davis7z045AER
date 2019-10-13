// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module brd_v_tpg_0_0_tpgPatternDPColorRam (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        y,
        x,
        color,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_ce
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] y;
input  [15:0] x;
input  [7:0] color;
output  [7:0] ap_return_0;
output  [7:0] ap_return_1;
output  [7:0] ap_return_2;
input   ap_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] rampVal_2;
wire   [15:0] tmp_79_fu_228_p2;
wire   [0:0] tmp_s_fu_62_p2;
wire   [7:0] tmp_84_fu_58_p1;
wire   [6:0] tmp_85_fu_90_p4;
wire   [6:0] tmp_86_fu_106_p4;
wire   [15:0] p_rampVal_2_load_fu_72_p3;
wire   [1:0] Sel_fu_80_p4;
wire   [0:0] sel_tmp_fu_126_p2;
wire   [7:0] tmp_val_1_V_fu_122_p1;
wire   [0:0] sel_tmp2_fu_140_p2;
wire   [7:0] sel_tmp1_fu_132_p3;
wire   [0:0] sel_tmp4_fu_154_p2;
wire   [7:0] sel_tmp3_fu_146_p3;
wire   [0:0] tmp_fu_168_p2;
wire   [7:0] sel_tmp5_fu_182_p3;
wire   [0:0] tmp_88_fu_198_p1;
wire   [0:0] icmp6_fu_116_p2;
wire   [0:0] sel_tmp6_fu_202_p2;
wire   [0:0] icmp_fu_100_p2;
wire   [0:0] sel_tmp7_fu_208_p2;
wire   [0:0] sel_tmp8_fu_214_p2;
wire   [7:0] tmp_val_V_1_fu_160_p3;
wire   [7:0] tmp_val_2_V_fu_174_p3;
wire   [7:0] Scalar_val_0_V_writ_fu_190_p3;
wire   [7:0] Scalar_val_1_V_writ_fu_220_p3;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 rampVal_2 = 16'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1))) begin
        rampVal_2 <= tmp_79_fu_228_p2;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_start == 1'b1) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Scalar_val_0_V_writ_fu_190_p3 = ((sel_tmp4_fu_154_p2[0:0] === 1'b1) ? tmp_val_1_V_fu_122_p1 : sel_tmp5_fu_182_p3);

assign Scalar_val_1_V_writ_fu_220_p3 = ((sel_tmp8_fu_214_p2[0:0] === 1'b1) ? tmp_val_V_1_fu_160_p3 : tmp_val_2_V_fu_174_p3);

assign Sel_fu_80_p4 = {{y[7:6]}};

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_return_0 = Scalar_val_0_V_writ_fu_190_p3;

assign ap_return_1 = Scalar_val_1_V_writ_fu_220_p3;

assign ap_return_2 = tmp_val_2_V_fu_174_p3;

assign icmp6_fu_116_p2 = ((tmp_86_fu_106_p4 != 7'd0) ? 1'b1 : 1'b0);

assign icmp_fu_100_p2 = ((tmp_85_fu_90_p4 == 7'd0) ? 1'b1 : 1'b0);

assign p_rampVal_2_load_fu_72_p3 = ((tmp_s_fu_62_p2[0:0] === 1'b1) ? 16'd0 : rampVal_2);

assign sel_tmp1_fu_132_p3 = ((sel_tmp_fu_126_p2[0:0] === 1'b1) ? 8'd0 : tmp_val_1_V_fu_122_p1);

assign sel_tmp2_fu_140_p2 = ((Sel_fu_80_p4 == 2'd1) ? 1'b1 : 1'b0);

assign sel_tmp3_fu_146_p3 = ((sel_tmp2_fu_140_p2[0:0] === 1'b1) ? tmp_val_1_V_fu_122_p1 : sel_tmp1_fu_132_p3);

assign sel_tmp4_fu_154_p2 = ((Sel_fu_80_p4 == 2'd0) ? 1'b1 : 1'b0);

assign sel_tmp5_fu_182_p3 = ((sel_tmp2_fu_140_p2[0:0] === 1'b1) ? 8'd0 : sel_tmp1_fu_132_p3);

assign sel_tmp6_fu_202_p2 = (tmp_88_fu_198_p1 ^ 1'd1);

assign sel_tmp7_fu_208_p2 = (sel_tmp6_fu_202_p2 & icmp6_fu_116_p2);

assign sel_tmp8_fu_214_p2 = (sel_tmp7_fu_208_p2 | icmp_fu_100_p2);

assign sel_tmp_fu_126_p2 = ((Sel_fu_80_p4 == 2'd2) ? 1'b1 : 1'b0);

assign tmp_79_fu_228_p2 = (16'd1 + p_rampVal_2_load_fu_72_p3);

assign tmp_84_fu_58_p1 = x[7:0];

assign tmp_85_fu_90_p4 = {{color[7:1]}};

assign tmp_86_fu_106_p4 = {{color[7:1]}};

assign tmp_88_fu_198_p1 = x[0:0];

assign tmp_fu_168_p2 = (sel_tmp4_fu_154_p2 | sel_tmp2_fu_140_p2);

assign tmp_s_fu_62_p2 = ((tmp_84_fu_58_p1 == 8'd0) ? 1'b1 : 1'b0);

assign tmp_val_1_V_fu_122_p1 = p_rampVal_2_load_fu_72_p3[7:0];

assign tmp_val_2_V_fu_174_p3 = ((tmp_fu_168_p2[0:0] === 1'b1) ? 8'd0 : tmp_val_1_V_fu_122_p1);

assign tmp_val_V_1_fu_160_p3 = ((sel_tmp4_fu_154_p2[0:0] === 1'b1) ? 8'd0 : sel_tmp3_fu_146_p3);

endmodule //brd_v_tpg_0_0_tpgPatternDPColorRam
