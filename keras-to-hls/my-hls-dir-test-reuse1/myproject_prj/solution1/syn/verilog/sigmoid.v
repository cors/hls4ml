// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module sigmoid (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        data_V_read,
        ap_return
);

parameter    ap_ST_fsm_pp0_stage0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_11 = 32'b10001;
parameter    ap_const_lv6_0 = 6'b000000;
parameter    ap_const_lv10_0 = 10'b0000000000;
parameter    ap_const_lv15_1 = 15'b1;
parameter    ap_const_lv15_200 = 15'b1000000000;
parameter    ap_const_lv14_200 = 14'b1000000000;
parameter    ap_const_lv32_E = 32'b1110;
parameter    ap_const_lv14_0 = 14'b00000000000000;
parameter    ap_const_lv32_A = 32'b1010;
parameter    ap_const_lv32_D = 32'b1101;
parameter    ap_const_lv4_0 = 4'b0000;
parameter    ap_const_lv10_3FF = 10'b1111111111;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [17:0] data_V_read;
output  [9:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire   [0:0] ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
wire   [9:0] sigmoid_table2_address0;
reg    sigmoid_table2_ce0;
wire   [9:0] sigmoid_table2_q0;
wire   [9:0] tmp_7_fu_172_p1;
reg   [9:0] tmp_7_reg_203;
reg   [3:0] tmp_8_reg_208;
wire   [63:0] tmp_s_fu_198_p1;
wire   [13:0] tmp_1_fu_78_p4;
wire   [3:0] tmp_3_fu_100_p1;
wire   [9:0] p_Result_2_fu_104_p3;
wire  signed [14:0] ret_V_cast_fu_88_p1;
wire   [0:0] tmp_5_fu_112_p2;
wire   [14:0] ret_V_fu_118_p2;
wire   [0:0] tmp_2_fu_92_p3;
wire   [14:0] p_s_fu_124_p3;
wire   [14:0] p_2_fu_132_p3;
wire   [13:0] tmp_4_fu_140_p1;
wire   [14:0] index_fu_144_p2;
wire   [0:0] tmp_6_fu_156_p3;
wire   [13:0] index_cast_fu_150_p2;
wire   [13:0] p_1_fu_164_p3;
wire   [0:0] icmp_fu_186_p2;
wire   [9:0] index_1_fu_191_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_pipeline_idle_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'b1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

sigmoid_sigmoid_tmb6 #(
    .DataWidth( 10 ),
    .AddressRange( 1024 ),
    .AddressWidth( 10 ))
sigmoid_table2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(sigmoid_table2_address0),
    .ce0(sigmoid_table2_ce0),
    .q0(sigmoid_table2_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)))) begin
        tmp_7_reg_203 <= tmp_7_fu_172_p1;
        tmp_8_reg_208 <= {{p_1_fu_164_p3[ap_const_lv32_D : ap_const_lv32_A]}};
    end
end

always @ (*) begin
    if ((((1'b0 == ap_start) & (ap_CS_fsm_pp0_stage0 == 1'b1) & (1'b1 == ap_enable_reg_pp0_iter0)) | (~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)) & (1'b1 == ap_enable_reg_pp0_iter2)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (ap_CS_fsm_pp0_stage0 == 1'b1) & (1'b0 == ap_enable_reg_pp0_iter0) & (1'b0 == ap_enable_reg_pp0_iter1) & (1'b0 == ap_enable_reg_pp0_iter2))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b0 == ap_enable_reg_pp0_iter0) & (1'b0 == ap_enable_reg_pp0_iter1))) begin
        ap_pipeline_idle_pp0 = 1'b1;
    end else begin
        ap_pipeline_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & (1'b1 == ap_enable_reg_pp0_iter0) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)) & (1'b1 == ap_enable_reg_pp0_iter1))) begin
        sigmoid_table2_ce0 = 1'b1;
    end else begin
        sigmoid_table2_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[ap_const_lv32_0];

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_return = sigmoid_table2_q0;

assign icmp_fu_186_p2 = ((tmp_8_reg_208 != ap_const_lv4_0) ? 1'b1 : 1'b0);

assign index_1_fu_191_p3 = ((icmp_fu_186_p2[0:0] === 1'b1) ? ap_const_lv10_3FF : tmp_7_reg_203);

assign index_cast_fu_150_p2 = (ap_const_lv14_200 + tmp_4_fu_140_p1);

assign index_fu_144_p2 = (ap_const_lv15_200 + p_2_fu_132_p3);

assign p_1_fu_164_p3 = ((tmp_6_fu_156_p3[0:0] === 1'b1) ? ap_const_lv14_0 : index_cast_fu_150_p2);

assign p_2_fu_132_p3 = ((tmp_2_fu_92_p3[0:0] === 1'b1) ? p_s_fu_124_p3 : ret_V_cast_fu_88_p1);

assign p_Result_2_fu_104_p3 = {{tmp_3_fu_100_p1}, {ap_const_lv6_0}};

assign p_s_fu_124_p3 = ((tmp_5_fu_112_p2[0:0] === 1'b1) ? ret_V_cast_fu_88_p1 : ret_V_fu_118_p2);

assign ret_V_cast_fu_88_p1 = $signed(tmp_1_fu_78_p4);

assign ret_V_fu_118_p2 = ($signed(ap_const_lv15_1) + $signed(ret_V_cast_fu_88_p1));

assign sigmoid_table2_address0 = tmp_s_fu_198_p1;

assign tmp_1_fu_78_p4 = {{data_V_read[ap_const_lv32_11 : ap_const_lv32_4]}};

assign tmp_2_fu_92_p3 = data_V_read[ap_const_lv32_11];

assign tmp_3_fu_100_p1 = data_V_read[3:0];

assign tmp_4_fu_140_p1 = p_2_fu_132_p3[13:0];

assign tmp_5_fu_112_p2 = ((p_Result_2_fu_104_p3 == ap_const_lv10_0) ? 1'b1 : 1'b0);

assign tmp_6_fu_156_p3 = index_fu_144_p2[ap_const_lv32_E];

assign tmp_7_fu_172_p1 = p_1_fu_164_p3[9:0];

assign tmp_s_fu_198_p1 = index_1_fu_191_p3;

endmodule //sigmoid