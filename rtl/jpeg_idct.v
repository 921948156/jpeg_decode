`include "timescale.v"
`include "jpeg_defines.v"

module jpeg_idct(
input clk,rst,


input [1:0] dq_state,
input [1:0] idct1_state,
input [1:0] idct2_state,

input [23:0] qt_out_00,qt_out_01,qt_out_02,qt_out_03,qt_out_04,qt_out_05,qt_out_06,qt_out_07,
input [23:0] qt_out_10,qt_out_11,qt_out_12,qt_out_13,qt_out_14,qt_out_15,qt_out_16,qt_out_17,
input [23:0] qt_out_20,qt_out_21,qt_out_22,qt_out_23,qt_out_24,qt_out_25,qt_out_26,qt_out_27,
input [23:0] qt_out_30,qt_out_31,qt_out_32,qt_out_33,qt_out_34,qt_out_35,qt_out_36,qt_out_37,
input [23:0] qt_out_40,qt_out_41,qt_out_42,qt_out_43,qt_out_44,qt_out_45,qt_out_46,qt_out_47,
input [23:0] qt_out_50,qt_out_51,qt_out_52,qt_out_53,qt_out_54,qt_out_55,qt_out_56,qt_out_57,
input [23:0] qt_out_60,qt_out_61,qt_out_62,qt_out_63,qt_out_64,qt_out_65,qt_out_66,qt_out_67,
input [23:0] qt_out_70,qt_out_71,qt_out_72,qt_out_73,qt_out_74,qt_out_75,qt_out_76,qt_out_77,

output [15:0] out_00,out_01,out_02,out_03,out_04,out_05,out_06,out_07,
output [15:0] out_10,out_11,out_12,out_13,out_14,out_15,out_16,out_17,
output [15:0] out_20,out_21,out_22,out_23,out_24,out_25,out_26,out_27,
output [15:0] out_30,out_31,out_32,out_33,out_34,out_35,out_36,out_37,
output [15:0] out_40,out_41,out_42,out_43,out_44,out_45,out_46,out_47,
output [15:0] out_50,out_51,out_52,out_53,out_54,out_55,out_56,out_57,
output [15:0] out_60,out_61,out_62,out_63,out_64,out_65,out_66,out_67,
output [15:0] out_70,out_71,out_72,out_73,out_74,out_75,out_76,out_77
);

wire [23:0] i1_00,i1_01,i1_02,i1_03,i1_04,i1_05,i1_06,i1_07;
wire [23:0] i1_10,i1_11,i1_12,i1_13,i1_14,i1_15,i1_16,i1_17;
wire [23:0] i1_20,i1_21,i1_22,i1_23,i1_24,i1_25,i1_26,i1_27;
wire [23:0] i1_30,i1_31,i1_32,i1_33,i1_34,i1_35,i1_36,i1_37;
wire [23:0] i1_40,i1_41,i1_42,i1_43,i1_44,i1_45,i1_46,i1_47;
wire [23:0] i1_50,i1_51,i1_52,i1_53,i1_54,i1_55,i1_56,i1_57;
wire [23:0] i1_60,i1_61,i1_62,i1_63,i1_64,i1_65,i1_66,i1_67;
wire [23:0] i1_70,i1_71,i1_72,i1_73,i1_74,i1_75,i1_76,i1_77;



idct1 idct1(
  .clk(clk),.rst(rst),
  .dq_state(dq_state),.idct1_state(idct1_state),

  .in_00({{11{qt_out_00[23]}},qt_out_00}),.in_01({{11{qt_out_01[23]}},qt_out_01}),
  .in_02({{11{qt_out_02[23]}},qt_out_02}),.in_03({{11{qt_out_03[23]}},qt_out_03}),
  .in_04({{11{qt_out_04[23]}},qt_out_04}),.in_05({{11{qt_out_05[23]}},qt_out_05}),
  .in_06({{11{qt_out_06[23]}},qt_out_06}),.in_07({{11{qt_out_07[23]}},qt_out_07}),
  .in_10({{11{qt_out_10[23]}},qt_out_10}),.in_11({{11{qt_out_11[23]}},qt_out_11}),
  .in_12({{11{qt_out_12[23]}},qt_out_12}),.in_13({{11{qt_out_13[23]}},qt_out_13}),
  .in_14({{11{qt_out_14[23]}},qt_out_14}),.in_15({{11{qt_out_15[23]}},qt_out_15}),
  .in_16({{11{qt_out_16[23]}},qt_out_16}),.in_17({{11{qt_out_17[23]}},qt_out_17}),
  .in_20({{11{qt_out_20[23]}},qt_out_20}),.in_21({{11{qt_out_21[23]}},qt_out_21}),
  .in_22({{11{qt_out_22[23]}},qt_out_22}),.in_23({{11{qt_out_23[23]}},qt_out_23}),
  .in_24({{11{qt_out_24[23]}},qt_out_24}),.in_25({{11{qt_out_25[23]}},qt_out_25}),
  .in_26({{11{qt_out_26[23]}},qt_out_26}),.in_27({{11{qt_out_27[23]}},qt_out_27}),
  .in_30({{11{qt_out_30[23]}},qt_out_30}),.in_31({{11{qt_out_31[23]}},qt_out_31}),
  .in_32({{11{qt_out_32[23]}},qt_out_32}),.in_33({{11{qt_out_33[23]}},qt_out_33}),
  .in_34({{11{qt_out_34[23]}},qt_out_34}),.in_35({{11{qt_out_35[23]}},qt_out_35}),
  .in_36({{11{qt_out_36[23]}},qt_out_36}),.in_37({{11{qt_out_37[23]}},qt_out_37}),  
  .in_40({{11{qt_out_40[23]}},qt_out_40}),.in_41({{11{qt_out_41[23]}},qt_out_41}),
  .in_42({{11{qt_out_42[23]}},qt_out_42}),.in_43({{11{qt_out_43[23]}},qt_out_43}),
  .in_44({{11{qt_out_44[23]}},qt_out_44}),.in_45({{11{qt_out_45[23]}},qt_out_45}),
  .in_46({{11{qt_out_46[23]}},qt_out_46}),.in_47({{11{qt_out_47[23]}},qt_out_47}), 
  .in_50({{11{qt_out_50[23]}},qt_out_50}),.in_51({{11{qt_out_51[23]}},qt_out_51}),
  .in_52({{11{qt_out_52[23]}},qt_out_52}),.in_53({{11{qt_out_53[23]}},qt_out_53}),
  .in_54({{11{qt_out_54[23]}},qt_out_54}),.in_55({{11{qt_out_55[23]}},qt_out_55}),
  .in_56({{11{qt_out_56[23]}},qt_out_56}),.in_57({{11{qt_out_57[23]}},qt_out_57}),
  .in_60({{11{qt_out_60[23]}},qt_out_60}),.in_61({{11{qt_out_61[23]}},qt_out_61}),
  .in_62({{11{qt_out_62[23]}},qt_out_62}),.in_63({{11{qt_out_63[23]}},qt_out_63}),
  .in_64({{11{qt_out_64[23]}},qt_out_64}),.in_65({{11{qt_out_65[23]}},qt_out_65}),
  .in_66({{11{qt_out_66[23]}},qt_out_66}),.in_67({{11{qt_out_67[23]}},qt_out_67}),
  .in_70({{11{qt_out_70[23]}},qt_out_70}),.in_71({{11{qt_out_71[23]}},qt_out_71}),
  .in_72({{11{qt_out_72[23]}},qt_out_72}),.in_73({{11{qt_out_73[23]}},qt_out_73}),
  .in_74({{11{qt_out_74[23]}},qt_out_74}),.in_75({{11{qt_out_75[23]}},qt_out_75}),
  .in_76({{11{qt_out_76[23]}},qt_out_76}),.in_77({{11{qt_out_77[23]}},qt_out_77}),
  
  .i1_00(i1_00),.i1_01(i1_01),.i1_02(i1_02),.i1_03(i1_03),.i1_04(i1_04),.i1_05(i1_05),.i1_06(i1_06),.i1_07(i1_07),
  .i1_10(i1_10),.i1_11(i1_11),.i1_12(i1_12),.i1_13(i1_13),.i1_14(i1_14),.i1_15(i1_15),.i1_16(i1_16),.i1_17(i1_17),
  .i1_20(i1_20),.i1_21(i1_21),.i1_22(i1_22),.i1_23(i1_23),.i1_24(i1_24),.i1_25(i1_25),.i1_26(i1_26),.i1_27(i1_27),
  .i1_30(i1_30),.i1_31(i1_31),.i1_32(i1_32),.i1_33(i1_33),.i1_34(i1_34),.i1_35(i1_35),.i1_36(i1_36),.i1_37(i1_37),
  .i1_40(i1_40),.i1_41(i1_41),.i1_42(i1_42),.i1_43(i1_43),.i1_44(i1_44),.i1_45(i1_45),.i1_46(i1_46),.i1_47(i1_47),
  .i1_50(i1_50),.i1_51(i1_51),.i1_52(i1_52),.i1_53(i1_53),.i1_54(i1_54),.i1_55(i1_55),.i1_56(i1_56),.i1_57(i1_57),
  .i1_60(i1_60),.i1_61(i1_61),.i1_62(i1_62),.i1_63(i1_63),.i1_64(i1_64),.i1_65(i1_65),.i1_66(i1_66),.i1_67(i1_67),
  .i1_70(i1_70),.i1_71(i1_71),.i1_72(i1_72),.i1_73(i1_73),.i1_74(i1_74),.i1_75(i1_75),.i1_76(i1_76),.i1_77(i1_77)

);

idct2 idct2(
  .clk(clk),.rst(rst),
  .idct1_state(idct1_state),.idct2_state(idct2_state),
  .i1_00({{11{i1_00[23]}},i1_00}),.i1_01({{11{i1_01[23]}},i1_01}),
  .i1_02({{11{i1_02[23]}},i1_02}),.i1_03({{11{i1_03[23]}},i1_03}),
  .i1_04({{11{i1_04[23]}},i1_04}),.i1_05({{11{i1_05[23]}},i1_05}),
  .i1_06({{11{i1_06[23]}},i1_06}),.i1_07({{11{i1_07[23]}},i1_07}),
  .i1_10({{11{i1_10[23]}},i1_10}),.i1_11({{11{i1_11[23]}},i1_11}),
  .i1_12({{11{i1_12[23]}},i1_12}),.i1_13({{11{i1_13[23]}},i1_13}),
  .i1_14({{11{i1_14[23]}},i1_14}),.i1_15({{11{i1_15[23]}},i1_15}),
  .i1_16({{11{i1_16[23]}},i1_16}),.i1_17({{11{i1_17[23]}},i1_17}),
  .i1_20({{11{i1_20[23]}},i1_20}),.i1_21({{11{i1_21[23]}},i1_21}),
  .i1_22({{11{i1_22[23]}},i1_22}),.i1_23({{11{i1_23[23]}},i1_23}),
  .i1_24({{11{i1_24[23]}},i1_24}),.i1_25({{11{i1_25[23]}},i1_25}),
  .i1_26({{11{i1_26[23]}},i1_26}),.i1_27({{11{i1_27[23]}},i1_27}),
  .i1_30({{11{i1_30[23]}},i1_30}),.i1_31({{11{i1_31[23]}},i1_31}),
  .i1_32({{11{i1_32[23]}},i1_32}),.i1_33({{11{i1_33[23]}},i1_33}),
  .i1_34({{11{i1_34[23]}},i1_34}),.i1_35({{11{i1_35[23]}},i1_35}),
  .i1_36({{11{i1_36[23]}},i1_36}),.i1_37({{11{i1_37[23]}},i1_37}),  
  .i1_40({{11{i1_40[23]}},i1_40}),.i1_41({{11{i1_41[23]}},i1_41}),
  .i1_42({{11{i1_42[23]}},i1_42}),.i1_43({{11{i1_43[23]}},i1_43}),
  .i1_44({{11{i1_44[23]}},i1_44}),.i1_45({{11{i1_45[23]}},i1_45}),
  .i1_46({{11{i1_46[23]}},i1_46}),.i1_47({{11{i1_47[23]}},i1_47}), 
  .i1_50({{11{i1_50[23]}},i1_50}),.i1_51({{11{i1_51[23]}},i1_51}),
  .i1_52({{11{i1_52[23]}},i1_52}),.i1_53({{11{i1_53[23]}},i1_53}),
  .i1_54({{11{i1_54[23]}},i1_54}),.i1_55({{11{i1_55[23]}},i1_55}),
  .i1_56({{11{i1_56[23]}},i1_56}),.i1_57({{11{i1_57[23]}},i1_57}),
  .i1_60({{11{i1_60[23]}},i1_60}),.i1_61({{11{i1_61[23]}},i1_61}),
  .i1_62({{11{i1_62[23]}},i1_62}),.i1_63({{11{i1_63[23]}},i1_63}),
  .i1_64({{11{i1_64[23]}},i1_64}),.i1_65({{11{i1_65[23]}},i1_65}),
  .i1_66({{11{i1_66[23]}},i1_66}),.i1_67({{11{i1_67[23]}},i1_67}),
  .i1_70({{11{i1_70[23]}},i1_70}),.i1_71({{11{i1_71[23]}},i1_71}),
  .i1_72({{11{i1_72[23]}},i1_72}),.i1_73({{11{i1_73[23]}},i1_73}),
  .i1_74({{11{i1_74[23]}},i1_74}),.i1_75({{11{i1_75[23]}},i1_75}),
  .i1_76({{11{i1_76[23]}},i1_76}),.i1_77({{11{i1_77[23]}},i1_77}),
  
  .out_00(out_00),.out_01(out_01),.out_02(out_02),.out_03(out_03),
  .out_04(out_04),.out_05(out_05),.out_06(out_06),.out_07(out_07),
  .out_10(out_10),.out_11(out_11),.out_12(out_12),.out_13(out_13),
  .out_14(out_14),.out_15(out_15),.out_16(out_16),.out_17(out_17),
  .out_20(out_20),.out_21(out_21),.out_22(out_22),.out_23(out_23),
  .out_24(out_24),.out_25(out_25),.out_26(out_26),.out_27(out_27),
  .out_30(out_30),.out_31(out_31),.out_32(out_32),.out_33(out_33),
  .out_34(out_34),.out_35(out_35),.out_36(out_36),.out_37(out_37),
  .out_40(out_40),.out_41(out_41),.out_42(out_42),.out_43(out_43),
  .out_44(out_44),.out_45(out_45),.out_46(out_46),.out_47(out_47),
  .out_50(out_50),.out_51(out_51),.out_52(out_52),.out_53(out_53),
  .out_54(out_54),.out_55(out_55),.out_56(out_56),.out_57(out_57),
  .out_60(out_60),.out_61(out_61),.out_62(out_62),.out_63(out_63),
  .out_64(out_64),.out_65(out_65),.out_66(out_66),.out_67(out_67),
  .out_70(out_70),.out_71(out_71),.out_72(out_72),.out_73(out_73),
  .out_74(out_74),.out_75(out_75),.out_76(out_76),.out_77(out_77)

);

endmodule

module idct1(
input clk,rst,
input [1:0] dq_state,
input [1:0] idct1_state,

input [34:0] in_00,in_01,in_02,in_03,in_04,in_05,in_06,in_07,
input [34:0] in_10,in_11,in_12,in_13,in_14,in_15,in_16,in_17,
input [34:0] in_20,in_21,in_22,in_23,in_24,in_25,in_26,in_27,
input [34:0] in_30,in_31,in_32,in_33,in_34,in_35,in_36,in_37,
input [34:0] in_40,in_41,in_42,in_43,in_44,in_45,in_46,in_47,
input [34:0] in_50,in_51,in_52,in_53,in_54,in_55,in_56,in_57,
input [34:0] in_60,in_61,in_62,in_63,in_64,in_65,in_66,in_67,
input [34:0] in_70,in_71,in_72,in_73,in_74,in_75,in_76,in_77,

output reg [23:0] i1_00,i1_01,i1_02,i1_03,i1_04,i1_05,i1_06,i1_07,
output reg [23:0] i1_10,i1_11,i1_12,i1_13,i1_14,i1_15,i1_16,i1_17,
output reg [23:0] i1_20,i1_21,i1_22,i1_23,i1_24,i1_25,i1_26,i1_27,
output reg [23:0] i1_30,i1_31,i1_32,i1_33,i1_34,i1_35,i1_36,i1_37,
output reg [23:0] i1_40,i1_41,i1_42,i1_43,i1_44,i1_45,i1_46,i1_47,
output reg [23:0] i1_50,i1_51,i1_52,i1_53,i1_54,i1_55,i1_56,i1_57,
output reg [23:0] i1_60,i1_61,i1_62,i1_63,i1_64,i1_65,i1_66,i1_67,
output reg [23:0] i1_70,i1_71,i1_72,i1_73,i1_74,i1_75,i1_76,i1_77

);
function [34:0] x_c1;
  input [34:0] in;
  x_c1 = (in << 11) + (in << 10) + (in << 9) + (in << 8) + 
         (in << 7) + (in << 5) + (in << 4) + (in << 1) + in;
endfunction

function [34:0] x_c2;
  input [34:0] in;
  x_c2 = (in << 11) + (in << 10) + (in << 9) + (in << 7) + (in << 6) + (in << 3);
endfunction

function [34:0] x_c3;
  input [34:0] in;
  x_c3 = (in << 11) + (in << 10) + (in << 8) + (in << 6) + (in << 3) + (in << 2) + (in << 1);
endfunction

function [34:0] x_c4;
  input [34:0] in;
  x_c4 = (in << 11) + (in << 9) + (in << 8) + (in << 6) + (in << 4);
endfunction

function [34:0] x_c5;
  input [34:0] in;
  x_c5 = (in << 11) + (in << 7) + (in << 6) + (in << 5) + (in << 2);
endfunction

function [34:0] x_c6;
  input [34:0] in;
  x_c6 = (in << 10) + (in << 9) + (in << 5) - in;
endfunction

function [34:0] x_c7;
  input [34:0] in;
  x_c7 = (in << 9) + (in << 8) + (in << 5) - in;
endfunction


reg [34:0] s0 [7:0];
reg [34:0] s1 [7:0];
reg [34:0] s2 [7:0];
reg [34:0] s3 [7:0];
reg [34:0] s4 [7:0];
reg [34:0] s5 [7:0];
reg [34:0] s6 [7:0];
reg [34:0] s7 [7:0];

always@(posedge clk)
  if(dq_state == `dq_state_wait & idct1_state == `idct1_state_idle)begin
  	s0[0] <= x_c4(in_00 + in_04);  s0[1] <= x_c4(in_10 + in_14);
  	s0[2] <= x_c4(in_20 + in_24);  s0[3] <= x_c4(in_30 + in_34);
  	s0[4] <= x_c4(in_40 + in_44);  s0[5] <= x_c4(in_50 + in_54);
  	s0[6] <= x_c4(in_60 + in_64);  s0[7] <= x_c4(in_70 + in_74);
  end 

always@(posedge clk)
  if(dq_state == `dq_state_wait & idct1_state == `idct1_state_idle)begin
  	s1[0] <= x_c4(in_00 - in_04);  s1[1] <= x_c4(in_10 - in_14);
  	s1[2] <= x_c4(in_20 - in_24);  s1[3] <= x_c4(in_30 - in_34);
  	s1[4] <= x_c4(in_40 - in_44);  s1[5] <= x_c4(in_50 - in_54);
  	s1[6] <= x_c4(in_60 - in_64);  s1[7] <= x_c4(in_70 - in_74);
  end
  
always@(posedge clk)
  if(dq_state == `dq_state_wait & idct1_state == `idct1_state_idle)begin
  	s2[0] <= x_c6(in_02) - x_c2(in_06);
  	s2[1] <= x_c6(in_12) - x_c2(in_16);
  	s2[2] <= x_c6(in_22) - x_c2(in_26);
  	s2[3] <= x_c6(in_32) - x_c2(in_36);
  	s2[4] <= x_c6(in_42) - x_c2(in_46);
  	s2[5] <= x_c6(in_52) - x_c2(in_56);
  	s2[6] <= x_c6(in_62) - x_c2(in_66);
  	s2[7] <= x_c6(in_72) - x_c2(in_76);
  end
  
always@(posedge clk)
  if(dq_state == `dq_state_wait & idct1_state == `idct1_state_idle)begin
  	s3[0] <= x_c2(in_02) + x_c6(in_06);
  	s3[1] <= x_c2(in_12) + x_c6(in_16);
  	s3[2] <= x_c2(in_22) + x_c6(in_26);
  	s3[3] <= x_c2(in_32) + x_c6(in_36);
  	s3[4] <= x_c2(in_42) + x_c6(in_46);
  	s3[5] <= x_c2(in_52) + x_c6(in_56);
  	s3[6] <= x_c2(in_62) + x_c6(in_66);
  	s3[7] <= x_c2(in_72) + x_c6(in_76);
  end
  
always@(posedge clk)
  if(dq_state == `dq_state_wait & idct1_state == `idct1_state_idle)begin
  	s4[0] <= x_c7(in_01) - x_c1(in_07);
  	s4[1] <= x_c7(in_11) - x_c1(in_17);
  	s4[2] <= x_c7(in_21) - x_c1(in_27);
  	s4[3] <= x_c7(in_31) - x_c1(in_37);
  	s4[4] <= x_c7(in_41) - x_c1(in_47);
  	s4[5] <= x_c7(in_51) - x_c1(in_57);
  	s4[6] <= x_c7(in_61) - x_c1(in_67);
  	s4[7] <= x_c7(in_71) - x_c1(in_77);
  end
  
always@(posedge clk)
  if(dq_state == `dq_state_wait & idct1_state == `idct1_state_idle)begin
  	s5[0] <= x_c3(in_05) - x_c5(in_03);
  	s5[1] <= x_c3(in_15) - x_c5(in_13);
  	s5[2] <= x_c3(in_25) - x_c5(in_23);
  	s5[3] <= x_c3(in_35) - x_c5(in_33);
  	s5[4] <= x_c3(in_45) - x_c5(in_43);
  	s5[5] <= x_c3(in_55) - x_c5(in_53);
  	s5[6] <= x_c3(in_65) - x_c5(in_63);
  	s5[7] <= x_c3(in_75) - x_c5(in_73);
  end
  
always@(posedge clk)
  if(dq_state == `dq_state_wait & idct1_state == `idct1_state_idle)begin
  	s6[0] <= x_c5(in_05) + x_c3(in_03);
  	s6[1] <= x_c5(in_15) + x_c3(in_13);
  	s6[2] <= x_c5(in_25) + x_c3(in_23);
  	s6[3] <= x_c5(in_35) + x_c3(in_33);
  	s6[4] <= x_c5(in_45) + x_c3(in_43);
  	s6[5] <= x_c5(in_55) + x_c3(in_53);
  	s6[6] <= x_c5(in_65) + x_c3(in_63);
  	s6[7] <= x_c5(in_75) + x_c3(in_73);
  end
  
always@(posedge clk)
  if(dq_state == `dq_state_wait & idct1_state == `idct1_state_idle)begin
  	s7[0] <= x_c1(in_01) + x_c7(in_07);
  	s7[1] <= x_c1(in_11) + x_c7(in_17);
  	s7[2] <= x_c1(in_21) + x_c7(in_27);
  	s7[3] <= x_c1(in_31) + x_c7(in_37);
  	s7[4] <= x_c1(in_41) + x_c7(in_47);
  	s7[5] <= x_c1(in_51) + x_c7(in_57);
  	s7[6] <= x_c1(in_61) + x_c7(in_67);
  	s7[7] <= x_c1(in_71) + x_c7(in_77);
  end

wire [26:0] s5_0_,s5_1_,s5_2_,s5_3_,s5_4_,s5_5_,s5_6_,s5_7_;
wire [26:0] s6_0_,s6_1_,s6_2_,s6_3_,s6_4_,s6_5_,s6_6_,s6_7_;

s5s6_cal s5s6_cal_0(.i_s4(s4[0]),.i_s5(s5[0]),.i_s6(s6[0]),.i_s7(s7[0]),.o_s6(s6_0_),.o_s5(s5_0_));
s5s6_cal s5s6_cal_1(.i_s4(s4[1]),.i_s5(s5[1]),.i_s6(s6[1]),.i_s7(s7[1]),.o_s6(s6_1_),.o_s5(s5_1_));
s5s6_cal s5s6_cal_2(.i_s4(s4[2]),.i_s5(s5[2]),.i_s6(s6[2]),.i_s7(s7[2]),.o_s6(s6_2_),.o_s5(s5_2_));
s5s6_cal s5s6_cal_3(.i_s4(s4[3]),.i_s5(s5[3]),.i_s6(s6[3]),.i_s7(s7[3]),.o_s6(s6_3_),.o_s5(s5_3_));
s5s6_cal s5s6_cal_4(.i_s4(s4[4]),.i_s5(s5[4]),.i_s6(s6[4]),.i_s7(s7[4]),.o_s6(s6_4_),.o_s5(s5_4_));
s5s6_cal s5s6_cal_5(.i_s4(s4[5]),.i_s5(s5[5]),.i_s6(s6[5]),.i_s7(s7[5]),.o_s6(s6_5_),.o_s5(s5_5_));
s5s6_cal s5s6_cal_6(.i_s4(s4[6]),.i_s5(s5[6]),.i_s6(s6[6]),.i_s7(s7[6]),.o_s6(s6_6_),.o_s5(s5_6_));
s5s6_cal s5s6_cal_7(.i_s4(s4[7]),.i_s5(s5[7]),.i_s6(s6[7]),.i_s7(s7[7]),.o_s6(s6_7_),.o_s5(s5_7_));


reg [26:0] s5_0,s5_1,s5_2,s5_3,s5_4,s5_5,s5_6,s5_7;
reg [26:0] s6_0,s6_1,s6_2,s6_3,s6_4,s6_5,s6_6,s6_7;
always@(posedge clk)
  if(rst)begin
  	s5_0 <= 0;  s5_1 <= 0;  s5_2 <= 0;  s5_3 <= 0;
  	s5_4 <= 0;  s5_5 <= 0;  s5_6 <= 0;  s5_7 <= 0;
  	s6_0 <= 0;  s6_1 <= 0;  s6_2 <= 0;  s6_3 <= 0;
  	s6_4 <= 0;  s6_5 <= 0;  s6_6 <= 0;  s6_7 <= 0;
  end else if(idct1_state == `idct1_state_do)begin
  	s5_0 <= s5_0_;  s5_1 <= s5_1_;  s5_2 <= s5_2_;  s5_3 <= s5_3_;
  	s5_4 <= s5_4_;  s5_5 <= s5_5_;  s5_6 <= s5_6_;  s5_7 <= s5_7_;
  	s6_0 <= s6_0_;  s6_1 <= s6_1_;  s6_2 <= s6_2_;  s6_3 <= s6_3_;
  	s6_4 <= s6_4_;  s6_5 <= s6_5_;  s6_6 <= s6_6_;  s6_7 <= s6_7_;
  end 


wire [34:0] t_00,t_01,t_02,t_03,t_04,t_05,t_06,t_07;
wire [34:0] t_10,t_11,t_12,t_13,t_14,t_15,t_16,t_17;
wire [34:0] t_20,t_21,t_22,t_23,t_24,t_25,t_26,t_27;
wire [34:0] t_30,t_31,t_32,t_33,t_34,t_35,t_36,t_37;
wire [34:0] t_40,t_41,t_42,t_43,t_44,t_45,t_46,t_47;
wire [34:0] t_50,t_51,t_52,t_53,t_54,t_55,t_56,t_57;
wire [34:0] t_60,t_61,t_62,t_63,t_64,t_65,t_66,t_67;
wire [34:0] t_70,t_71,t_72,t_73,t_74,t_75,t_76,t_77;

block_cal b0(
.s0(s0[0]),.s1(s1[0]),.s2(s2[0]),.s3(s3[0]),.s4(s4[0]),.s5(s5[0]),.s6(s6[0]),.s7(s7[0]),.s5_(s5_0),.s6_(s6_0),
.o0(t_00),.o1(t_01),.o2(t_02),.o3(t_03),.o4(t_04),.o5(t_05),.o6(t_06),.o7(t_07));

block_cal b1(
.s0(s0[1]),.s1(s1[1]),.s2(s2[1]),.s3(s3[1]),.s4(s4[1]),.s5(s5[1]),.s6(s6[1]),.s7(s7[1]),.s5_(s5_1),.s6_(s6_1),
.o0(t_10),.o1(t_11),.o2(t_12),.o3(t_13),.o4(t_14),.o5(t_15),.o6(t_16),.o7(t_17));

block_cal b2(
.s0(s0[2]),.s1(s1[2]),.s2(s2[2]),.s3(s3[2]),.s4(s4[2]),.s5(s5[2]),.s6(s6[2]),.s7(s7[2]),.s5_(s5_2),.s6_(s6_2),
.o0(t_20),.o1(t_21),.o2(t_22),.o3(t_23),.o4(t_24),.o5(t_25),.o6(t_26),.o7(t_27));

block_cal b3(
.s0(s0[3]),.s1(s1[3]),.s2(s2[3]),.s3(s3[3]),.s4(s4[3]),.s5(s5[3]),.s6(s6[3]),.s7(s7[3]),.s5_(s5_3),.s6_(s6_3),
.o0(t_30),.o1(t_31),.o2(t_32),.o3(t_33),.o4(t_34),.o5(t_35),.o6(t_36),.o7(t_37));

block_cal b4(
.s0(s0[4]),.s1(s1[4]),.s2(s2[4]),.s3(s3[4]),.s4(s4[4]),.s5(s5[4]),.s6(s6[4]),.s7(s7[4]),.s5_(s5_4),.s6_(s6_4),
.o0(t_40),.o1(t_41),.o2(t_42),.o3(t_43),.o4(t_44),.o5(t_45),.o6(t_46),.o7(t_47));

block_cal b5(
.s0(s0[5]),.s1(s1[5]),.s2(s2[5]),.s3(s3[5]),.s4(s4[5]),.s5(s5[5]),.s6(s6[5]),.s7(s7[5]),.s5_(s5_5),.s6_(s6_5),
.o0(t_50),.o1(t_51),.o2(t_52),.o3(t_53),.o4(t_54),.o5(t_55),.o6(t_56),.o7(t_57));

block_cal b6(
.s0(s0[6]),.s1(s1[6]),.s2(s2[6]),.s3(s3[6]),.s4(s4[6]),.s5(s5[6]),.s6(s6[6]),.s7(s7[6]),.s5_(s5_6),.s6_(s6_6),
.o0(t_60),.o1(t_61),.o2(t_62),.o3(t_63),.o4(t_64),.o5(t_65),.o6(t_66),.o7(t_67));

block_cal b7(
.s0(s0[7]),.s1(s1[7]),.s2(s2[7]),.s3(s3[7]),.s4(s4[7]),.s5(s5[7]),.s6(s6[7]),.s7(s7[7]),.s5_(s5_7),.s6_(s6_7),
.o0(t_70),.o1(t_71),.o2(t_72),.o3(t_73),.o4(t_74),.o5(t_75),.o6(t_76),.o7(t_77));

always@(posedge clk)
  if(rst)begin
  	i1_00 <= 0; i1_01 <= 0; i1_02 <= 0; i1_03 <= 0; i1_04 <= 0; i1_05 <= 0; i1_06 <= 0; i1_07 <= 0; 
  	i1_10 <= 0; i1_11 <= 0; i1_12 <= 0; i1_13 <= 0; i1_14 <= 0; i1_15 <= 0; i1_16 <= 0; i1_17 <= 0;  
  	i1_20 <= 0; i1_21 <= 0; i1_22 <= 0; i1_23 <= 0; i1_24 <= 0; i1_25 <= 0; i1_26 <= 0; i1_27 <= 0;  
  	i1_30 <= 0; i1_31 <= 0; i1_32 <= 0; i1_33 <= 0; i1_34 <= 0; i1_35 <= 0; i1_36 <= 0; i1_37 <= 0;
  	i1_40 <= 0; i1_41 <= 0; i1_42 <= 0; i1_43 <= 0; i1_44 <= 0; i1_45 <= 0; i1_46 <= 0; i1_47 <= 0; 
  	i1_50 <= 0; i1_51 <= 0; i1_52 <= 0; i1_53 <= 0; i1_54 <= 0; i1_55 <= 0; i1_56 <= 0; i1_57 <= 0;  
  	i1_60 <= 0; i1_61 <= 0; i1_62 <= 0; i1_63 <= 0; i1_64 <= 0; i1_65 <= 0; i1_66 <= 0; i1_67 <= 0;  
  	i1_70 <= 0; i1_71 <= 0; i1_72 <= 0; i1_73 <= 0; i1_74 <= 0; i1_75 <= 0; i1_76 <= 0; i1_77 <= 0; 
  end else if(idct1_state == `idct1_state_cal)begin
  	i1_00 <= t_00[34:11]; i1_01 <= t_01[34:11]; i1_02 <= t_02[34:11]; i1_03 <= t_03[34:11]; 
  	i1_04 <= t_04[34:11]; i1_05 <= t_05[34:11]; i1_06 <= t_06[34:11]; i1_07 <= t_07[34:11]; 
  	i1_10 <= t_10[34:11]; i1_11 <= t_11[34:11]; i1_12 <= t_12[34:11]; i1_13 <= t_13[34:11]; 
  	i1_14 <= t_14[34:11]; i1_15 <= t_15[34:11]; i1_16 <= t_16[34:11]; i1_17 <= t_17[34:11];  
  	i1_20 <= t_20[34:11]; i1_21 <= t_21[34:11]; i1_22 <= t_22[34:11]; i1_23 <= t_23[34:11]; 
  	i1_24 <= t_24[34:11]; i1_25 <= t_25[34:11]; i1_26 <= t_26[34:11]; i1_27 <= t_27[34:11];  
  	i1_30 <= t_30[34:11]; i1_31 <= t_31[34:11]; i1_32 <= t_32[34:11]; i1_33 <= t_33[34:11]; 
  	i1_34 <= t_34[34:11]; i1_35 <= t_35[34:11]; i1_36 <= t_36[34:11]; i1_37 <= t_37[34:11];
  	i1_40 <= t_40[34:11]; i1_41 <= t_41[34:11]; i1_42 <= t_42[34:11]; i1_43 <= t_43[34:11]; 
  	i1_44 <= t_44[34:11]; i1_45 <= t_45[34:11]; i1_46 <= t_46[34:11]; i1_47 <= t_47[34:11]; 
  	i1_50 <= t_50[34:11]; i1_51 <= t_51[34:11]; i1_52 <= t_52[34:11]; i1_53 <= t_53[34:11]; 
  	i1_54 <= t_54[34:11]; i1_55 <= t_55[34:11]; i1_56 <= t_56[34:11]; i1_57 <= t_57[34:11];  
  	i1_60 <= t_60[34:11]; i1_61 <= t_61[34:11]; i1_62 <= t_62[34:11]; i1_63 <= t_63[34:11]; 
  	i1_64 <= t_64[34:11]; i1_65 <= t_65[34:11]; i1_66 <= t_66[34:11]; i1_67 <= t_67[34:11];  
  	i1_70 <= t_70[34:11]; i1_71 <= t_71[34:11]; i1_72 <= t_72[34:11]; i1_73 <= t_73[34:11]; 
  	i1_74 <= t_74[34:11]; i1_75 <= t_75[34:11]; i1_76 <= t_76[34:11]; i1_77 <= t_77[34:11];   
  end



endmodule

module idct2(
input clk,rst,

input [1:0] idct1_state,
input [1:0] idct2_state,

input [34:0] i1_00,i1_01,i1_02,i1_03,i1_04,i1_05,i1_06,i1_07,
input [34:0] i1_10,i1_11,i1_12,i1_13,i1_14,i1_15,i1_16,i1_17,
input [34:0] i1_20,i1_21,i1_22,i1_23,i1_24,i1_25,i1_26,i1_27,
input [34:0] i1_30,i1_31,i1_32,i1_33,i1_34,i1_35,i1_36,i1_37,
input [34:0] i1_40,i1_41,i1_42,i1_43,i1_44,i1_45,i1_46,i1_47,
input [34:0] i1_50,i1_51,i1_52,i1_53,i1_54,i1_55,i1_56,i1_57,
input [34:0] i1_60,i1_61,i1_62,i1_63,i1_64,i1_65,i1_66,i1_67,
input [34:0] i1_70,i1_71,i1_72,i1_73,i1_74,i1_75,i1_76,i1_77,


output reg [15:0] out_00,out_01,out_02,out_03,out_04,out_05,out_06,out_07,
output reg [15:0] out_10,out_11,out_12,out_13,out_14,out_15,out_16,out_17,
output reg [15:0] out_20,out_21,out_22,out_23,out_24,out_25,out_26,out_27,
output reg [15:0] out_30,out_31,out_32,out_33,out_34,out_35,out_36,out_37,
output reg [15:0] out_40,out_41,out_42,out_43,out_44,out_45,out_46,out_47,
output reg [15:0] out_50,out_51,out_52,out_53,out_54,out_55,out_56,out_57,
output reg [15:0] out_60,out_61,out_62,out_63,out_64,out_65,out_66,out_67,
output reg [15:0] out_70,out_71,out_72,out_73,out_74,out_75,out_76,out_77

);
function [34:0] x_c1;
  input [34:0] in;
  x_c1 = (in << 11) + (in << 10) + (in << 9) + (in << 8) + 
         (in << 7) + (in << 5) + (in << 4) + (in << 1) + in;
endfunction

function [34:0] x_c2;
  input [34:0] in;
  x_c2 = (in << 11) + (in << 10) + (in << 9) + (in << 7) + (in << 6) + (in << 3);
endfunction

function [34:0] x_c3;
  input [34:0] in;
  x_c3 = (in << 11) + (in << 10) + (in << 8) + (in << 6) + (in << 3) + (in << 2) + (in << 1);
endfunction

function [34:0] x_c4;
  input [34:0] in;
  x_c4 = (in << 11) + (in << 9) + (in << 8) + (in << 6) + (in << 4);
endfunction

function [34:0] x_c5;
  input [34:0] in;
  x_c5 = (in << 11) + (in << 7) + (in << 6) + (in << 5) + (in << 2);
endfunction

function [34:0] x_c6;
  input [34:0] in;
  x_c6 = (in << 10) + (in << 9) + (in << 5) - in;
endfunction

function [34:0] x_c7;
  input [34:0] in;
  x_c7 = (in << 9) + (in << 8) + (in << 5) - in;
endfunction



reg [34:0] s0 [7:0];
reg [34:0] s1 [7:0];
reg [34:0] s2 [7:0];
reg [34:0] s3 [7:0];
reg [34:0] s4 [7:0];
reg [34:0] s5 [7:0];
reg [34:0] s6 [7:0];
reg [34:0] s7 [7:0];

always@(posedge clk)
  if(idct1_state == `idct1_state_wait & idct2_state == `idct2_state_idle)begin
    s0[0] <= x_c4(i1_00 + i1_40);
    s0[1] <= x_c4(i1_01 + i1_41);
    s0[2] <= x_c4(i1_02 + i1_42);
    s0[3] <= x_c4(i1_03 + i1_43);
    s0[4] <= x_c4(i1_04 + i1_44);
    s0[5] <= x_c4(i1_05 + i1_45);
    s0[6] <= x_c4(i1_06 + i1_46);
    s0[7] <= x_c4(i1_07 + i1_47);
  end 

always@(posedge clk)
  if(idct1_state == `idct1_state_wait & idct2_state == `idct2_state_idle)begin
    s1[0] <= x_c4(i1_00 - i1_40);
  	s1[1] <= x_c4(i1_01 - i1_41);
  	s1[2] <= x_c4(i1_02 - i1_42);
  	s1[3] <= x_c4(i1_03 - i1_43);
  	s1[4] <= x_c4(i1_04 - i1_44);
  	s1[5] <= x_c4(i1_05 - i1_45);
  	s1[6] <= x_c4(i1_06 - i1_46);
  	s1[7] <= x_c4(i1_07 - i1_47);
  end

always@(posedge clk)
  if(idct1_state == `idct1_state_wait & idct2_state == `idct2_state_idle)begin
  	s2[0] <= x_c6(i1_20) - x_c2(i1_60);
  	s2[1] <= x_c6(i1_21) - x_c2(i1_61);
  	s2[2] <= x_c6(i1_22) - x_c2(i1_62);
  	s2[3] <= x_c6(i1_23) - x_c2(i1_63);
  	s2[4] <= x_c6(i1_24) - x_c2(i1_64);
  	s2[5] <= x_c6(i1_25) - x_c2(i1_65);
  	s2[6] <= x_c6(i1_26) - x_c2(i1_66);
  	s2[7] <= x_c6(i1_27) - x_c2(i1_67);
  end

always@(posedge clk)
  if(idct1_state == `idct1_state_wait & idct2_state == `idct2_state_idle)begin
  	s3[0] <= x_c2(i1_20) + x_c6(i1_60);
  	s3[1] <= x_c2(i1_21) + x_c6(i1_61);
  	s3[2] <= x_c2(i1_22) + x_c6(i1_62);
  	s3[3] <= x_c2(i1_23) + x_c6(i1_63);
  	s3[4] <= x_c2(i1_24) + x_c6(i1_64);
  	s3[5] <= x_c2(i1_25) + x_c6(i1_65);
  	s3[6] <= x_c2(i1_26) + x_c6(i1_66);
  	s3[7] <= x_c2(i1_27) + x_c6(i1_67);
  end
  
always@(posedge clk)
  if(idct1_state == `idct1_state_wait & idct2_state == `idct2_state_idle)begin
  	s4[0] <= x_c7(i1_10) - x_c1(i1_70);
  	s4[1] <= x_c7(i1_11) - x_c1(i1_71);
  	s4[2] <= x_c7(i1_12) - x_c1(i1_72);
  	s4[3] <= x_c7(i1_13) - x_c1(i1_73);
  	s4[4] <= x_c7(i1_14) - x_c1(i1_74);
  	s4[5] <= x_c7(i1_15) - x_c1(i1_75);
  	s4[6] <= x_c7(i1_16) - x_c1(i1_76);
  	s4[7] <= x_c7(i1_17) - x_c1(i1_77);
  end  
  
always@(posedge clk)
  if(idct1_state == `idct1_state_wait & idct2_state == `idct2_state_idle)begin
  	s5[0] <= x_c3(i1_50) - x_c5(i1_30);
  	s5[1] <= x_c3(i1_51) - x_c5(i1_31);
  	s5[2] <= x_c3(i1_52) - x_c5(i1_32);
  	s5[3] <= x_c3(i1_53) - x_c5(i1_33);
  	s5[4] <= x_c3(i1_54) - x_c5(i1_34);
  	s5[5] <= x_c3(i1_55) - x_c5(i1_35);
  	s5[6] <= x_c3(i1_56) - x_c5(i1_36);
  	s5[7] <= x_c3(i1_57) - x_c5(i1_37);
  end 
  
always@(posedge clk)
  if(idct1_state == `idct1_state_wait & idct2_state == `idct2_state_idle)begin
  	s6[0] <= x_c5(i1_50) + x_c3(i1_30);
  	s6[1] <= x_c5(i1_51) + x_c3(i1_31);
  	s6[2] <= x_c5(i1_52) + x_c3(i1_32);
  	s6[3] <= x_c5(i1_53) + x_c3(i1_33);
  	s6[4] <= x_c5(i1_54) + x_c3(i1_34);
  	s6[5] <= x_c5(i1_55) + x_c3(i1_35);
  	s6[6] <= x_c5(i1_56) + x_c3(i1_36);
  	s6[7] <= x_c5(i1_57) + x_c3(i1_37);
  end   
  
always@(posedge clk)
  if(idct1_state == `idct1_state_wait & idct2_state == `idct2_state_idle)begin
  	s7[0] <= x_c1(i1_10) + x_c7(i1_70);
  	s7[1] <= x_c1(i1_11) + x_c7(i1_71);
  	s7[2] <= x_c1(i1_12) + x_c7(i1_72);
  	s7[3] <= x_c1(i1_13) + x_c7(i1_73);
  	s7[4] <= x_c1(i1_14) + x_c7(i1_74);
  	s7[5] <= x_c1(i1_15) + x_c7(i1_75);
  	s7[6] <= x_c1(i1_16) + x_c7(i1_76);
  	s7[7] <= x_c1(i1_17) + x_c7(i1_77);
  end     


wire [26:0] s5_0_,s5_1_,s5_2_,s5_3_,s5_4_,s5_5_,s5_6_,s5_7_;
wire [26:0] s6_0_,s6_1_,s6_2_,s6_3_,s6_4_,s6_5_,s6_6_,s6_7_;

s5s6_cal s5s6_cal_0(.i_s4(s4[0]),.i_s5(s5[0]),.i_s6(s6[0]),.i_s7(s7[0]),.o_s6(s6_0_),.o_s5(s5_0_));
s5s6_cal s5s6_cal_1(.i_s4(s4[1]),.i_s5(s5[1]),.i_s6(s6[1]),.i_s7(s7[1]),.o_s6(s6_1_),.o_s5(s5_1_));
s5s6_cal s5s6_cal_2(.i_s4(s4[2]),.i_s5(s5[2]),.i_s6(s6[2]),.i_s7(s7[2]),.o_s6(s6_2_),.o_s5(s5_2_));
s5s6_cal s5s6_cal_3(.i_s4(s4[3]),.i_s5(s5[3]),.i_s6(s6[3]),.i_s7(s7[3]),.o_s6(s6_3_),.o_s5(s5_3_));
s5s6_cal s5s6_cal_4(.i_s4(s4[4]),.i_s5(s5[4]),.i_s6(s6[4]),.i_s7(s7[4]),.o_s6(s6_4_),.o_s5(s5_4_));
s5s6_cal s5s6_cal_5(.i_s4(s4[5]),.i_s5(s5[5]),.i_s6(s6[5]),.i_s7(s7[5]),.o_s6(s6_5_),.o_s5(s5_5_));
s5s6_cal s5s6_cal_6(.i_s4(s4[6]),.i_s5(s5[6]),.i_s6(s6[6]),.i_s7(s7[6]),.o_s6(s6_6_),.o_s5(s5_6_));
s5s6_cal s5s6_cal_7(.i_s4(s4[7]),.i_s5(s5[7]),.i_s6(s6[7]),.i_s7(s7[7]),.o_s6(s6_7_),.o_s5(s5_7_));


reg [26:0] s5_0,s5_1,s5_2,s5_3,s5_4,s5_5,s5_6,s5_7;
reg [26:0] s6_0,s6_1,s6_2,s6_3,s6_4,s6_5,s6_6,s6_7;
always@(posedge clk)
  if(rst)begin
  	s5_0 <= 0;  s5_1 <= 0;  s5_2 <= 0;  s5_3 <= 0;
  	s5_4 <= 0;  s5_5 <= 0;  s5_6 <= 0;  s5_7 <= 0;
  	s6_0 <= 0;  s6_1 <= 0;  s6_2 <= 0;  s6_3 <= 0;
  	s6_4 <= 0;  s6_5 <= 0;  s6_6 <= 0;  s6_7 <= 0;
  end else if(idct2_state == `idct2_state_do)begin
  	s5_0 <= s5_0_;  s5_1 <= s5_1_;  s5_2 <= s5_2_;  s5_3 <= s5_3_;
  	s5_4 <= s5_4_;  s5_5 <= s5_5_;  s5_6 <= s5_6_;  s5_7 <= s5_7_;
  	s6_0 <= s6_0_;  s6_1 <= s6_1_;  s6_2 <= s6_2_;  s6_3 <= s6_3_;
  	s6_4 <= s6_4_;  s6_5 <= s6_5_;  s6_6 <= s6_6_;  s6_7 <= s6_7_;
  end 







wire [34:0] t_00,t_01,t_02,t_03,t_04,t_05,t_06,t_07;
wire [34:0] t_10,t_11,t_12,t_13,t_14,t_15,t_16,t_17;
wire [34:0] t_20,t_21,t_22,t_23,t_24,t_25,t_26,t_27;
wire [34:0] t_30,t_31,t_32,t_33,t_34,t_35,t_36,t_37;
wire [34:0] t_40,t_41,t_42,t_43,t_44,t_45,t_46,t_47;
wire [34:0] t_50,t_51,t_52,t_53,t_54,t_55,t_56,t_57;
wire [34:0] t_60,t_61,t_62,t_63,t_64,t_65,t_66,t_67;
wire [34:0] t_70,t_71,t_72,t_73,t_74,t_75,t_76,t_77;

block_cal b0(
.s0(s0[0]),.s1(s1[0]),.s2(s2[0]),.s3(s3[0]),.s4(s4[0]),.s5(s5[0]),.s6(s6[0]),.s7(s7[0]),.s5_(s5_0),.s6_(s6_0),
.o0(t_00),.o1(t_01),.o2(t_02),.o3(t_03),.o4(t_04),.o5(t_05),.o6(t_06),.o7(t_07));

block_cal b1(
.s0(s0[1]),.s1(s1[1]),.s2(s2[1]),.s3(s3[1]),.s4(s4[1]),.s5(s5[1]),.s6(s6[1]),.s7(s7[1]),.s5_(s5_1),.s6_(s6_1),
.o0(t_10),.o1(t_11),.o2(t_12),.o3(t_13),.o4(t_14),.o5(t_15),.o6(t_16),.o7(t_17));

block_cal b2(
.s0(s0[2]),.s1(s1[2]),.s2(s2[2]),.s3(s3[2]),.s4(s4[2]),.s5(s5[2]),.s6(s6[2]),.s7(s7[2]),.s5_(s5_2),.s6_(s6_2),
.o0(t_20),.o1(t_21),.o2(t_22),.o3(t_23),.o4(t_24),.o5(t_25),.o6(t_26),.o7(t_27));

block_cal b3(
.s0(s0[3]),.s1(s1[3]),.s2(s2[3]),.s3(s3[3]),.s4(s4[3]),.s5(s5[3]),.s6(s6[3]),.s7(s7[3]),.s5_(s5_3),.s6_(s6_3),
.o0(t_30),.o1(t_31),.o2(t_32),.o3(t_33),.o4(t_34),.o5(t_35),.o6(t_36),.o7(t_37));

block_cal b4(
.s0(s0[4]),.s1(s1[4]),.s2(s2[4]),.s3(s3[4]),.s4(s4[4]),.s5(s5[4]),.s6(s6[4]),.s7(s7[4]),.s5_(s5_4),.s6_(s6_4),
.o0(t_40),.o1(t_41),.o2(t_42),.o3(t_43),.o4(t_44),.o5(t_45),.o6(t_46),.o7(t_47));

block_cal b5(
.s0(s0[5]),.s1(s1[5]),.s2(s2[5]),.s3(s3[5]),.s4(s4[5]),.s5(s5[5]),.s6(s6[5]),.s7(s7[5]),.s5_(s5_5),.s6_(s6_5),
.o0(t_50),.o1(t_51),.o2(t_52),.o3(t_53),.o4(t_54),.o5(t_55),.o6(t_56),.o7(t_57));

block_cal b6(
.s0(s0[6]),.s1(s1[6]),.s2(s2[6]),.s3(s3[6]),.s4(s4[6]),.s5(s5[6]),.s6(s6[6]),.s7(s7[6]),.s5_(s5_6),.s6_(s6_6),
.o0(t_60),.o1(t_61),.o2(t_62),.o3(t_63),.o4(t_64),.o5(t_65),.o6(t_66),.o7(t_67));

block_cal b7(
.s0(s0[7]),.s1(s1[7]),.s2(s2[7]),.s3(s3[7]),.s4(s4[7]),.s5(s5[7]),.s6(s6[7]),.s7(s7[7]),.s5_(s5_7),.s6_(s6_7),
.o0(t_70),.o1(t_71),.o2(t_72),.o3(t_73),.o4(t_74),.o5(t_75),.o6(t_76),.o7(t_77));



always@(posedge clk)
  if(rst)begin
  	out_00 <= 0; out_01 <= 0; out_02 <= 0; out_03 <= 0; out_04 <= 0; out_05 <= 0; out_06 <= 0; out_07 <= 0; 
  	out_10 <= 0; out_11 <= 0; out_12 <= 0; out_13 <= 0; out_14 <= 0; out_15 <= 0; out_16 <= 0; out_17 <= 0; 
  	out_20 <= 0; out_21 <= 0; out_22 <= 0; out_23 <= 0; out_24 <= 0; out_25 <= 0; out_26 <= 0; out_27 <= 0;  
    out_30 <= 0; out_31 <= 0; out_32 <= 0; out_33 <= 0; out_34 <= 0; out_35 <= 0; out_36 <= 0; out_37 <= 0;  
    out_40 <= 0; out_41 <= 0; out_42 <= 0; out_43 <= 0; out_44 <= 0; out_45 <= 0; out_46 <= 0; out_47 <= 0; 
    out_50 <= 0; out_51 <= 0; out_52 <= 0; out_53 <= 0; out_54 <= 0; out_55 <= 0; out_56 <= 0; out_57 <= 0;  
    out_60 <= 0; out_61 <= 0; out_62 <= 0; out_63 <= 0; out_64 <= 0; out_65 <= 0; out_66 <= 0; out_67 <= 0;  
    out_70 <= 0; out_71 <= 0; out_72 <= 0; out_73 <= 0; out_74 <= 0; out_75 <= 0; out_76 <= 0; out_77 <= 0; 
  end else if(idct2_state == `idct2_state_cal)begin
  	out_00 <= t_00[30:15]; out_01 <= t_10[30:15]; out_02 <= t_20[30:15]; out_03 <= t_30[30:15]; 
  	out_04 <= t_40[30:15]; out_05 <= t_50[30:15]; out_06 <= t_60[30:15]; out_07 <= t_70[30:15]; 
  	out_10 <= t_01[30:15]; out_11 <= t_11[30:15]; out_12 <= t_21[30:15]; out_13 <= t_31[30:15]; 
  	out_14 <= t_41[30:15]; out_15 <= t_51[30:15]; out_16 <= t_61[30:15]; out_17 <= t_71[30:15]; 
  	out_20 <= t_02[30:15]; out_21 <= t_12[30:15]; out_22 <= t_30[30:15]; out_23 <= t_32[30:15]; 
  	out_24 <= t_42[30:15]; out_25 <= t_52[30:15]; out_26 <= t_62[30:15]; out_27 <= t_72[30:15];  
    out_30 <= t_03[30:15]; out_31 <= t_13[30:15]; out_32 <= t_23[30:15]; out_33 <= t_33[30:15]; 
    out_34 <= t_43[30:15]; out_35 <= t_53[30:15]; out_36 <= t_63[30:15]; out_37 <= t_73[30:15];  
    out_40 <= t_04[30:15]; out_41 <= t_14[30:15]; out_42 <= t_24[30:15]; out_43 <= t_34[30:15]; 
    out_44 <= t_44[30:15]; out_45 <= t_54[30:15]; out_46 <= t_64[30:15]; out_47 <= t_74[30:15]; 
    out_50 <= t_05[30:15]; out_51 <= t_15[30:15]; out_52 <= t_25[30:15]; out_53 <= t_35[30:15]; 
    out_54 <= t_45[30:15]; out_55 <= t_55[30:15]; out_56 <= t_65[30:15]; out_57 <= t_75[30:15];  
    out_60 <= t_06[30:15]; out_61 <= t_16[30:15]; out_62 <= t_26[30:15]; out_63 <= t_36[30:15]; 
    out_64 <= t_46[30:15]; out_65 <= t_56[30:15]; out_66 <= t_66[30:15]; out_67 <= t_76[30:15];  
    out_70 <= t_07[30:15]; out_71 <= t_17[30:15]; out_72 <= t_27[30:15]; out_73 <= t_37[30:15]; 
    out_74 <= t_47[30:15]; out_75 <= t_57[30:15]; out_76 <= t_67[30:15]; out_77 <= t_77[30:15]; 
  end 


endmodule 


module s5s6_cal(
input [34:0] i_s4,i_s5,i_s6,i_s7,

output [26:0] o_s6,o_s5
);

wire [34:0] t5 = i_s4 - i_s5;
wire [34:0] t6 = i_s7 - i_s6;
wire [34:0] t6_a_t5 = t6 + t5;
wire [34:0] t6_s_t5 = t6 - t5;

wire [34:0] o_s5_t = (t6_s_t5 << 7) + (t6_s_t5 << 5) + (t6_s_t5 << 4) + (t6_s_t5 << 2) + t6_s_t5;
wire [34:0] o_s6_t = (t6_a_t5 << 7) + (t6_a_t5 << 5) + (t6_a_t5 << 4) + (t6_a_t5 << 2) + t6_a_t5;


assign o_s5 = o_s5_t[34:8];
assign o_s6 = o_s6_t[34:8];


endmodule


module block_cal(
input [34:0] s0,s1,s2,s3,s4,s5,s6,s7,
input [26:0] s5_,s6_,
output [34:0] o0,o1,o2,o3,o4,o5,o6,o7
);

assign o0 = s0 + s3 + s7 + s6;
assign o1 = s1 + s2 + {{8{s6_[26]}},s6_};
assign o2 = s1 - s2 + {{8{s5_[26]}},s5_};
assign o3 = s0 - s3 + s4 + s5;
assign o4 = s0 - s3 - s4 - s5; 
assign o5 = s1 - s2 - {{8{s5_[26]}},s5_};
assign o6 = s1 + s2 - {{8{s6_[26]}},s6_};
assign o7 = s0 + s3 - s7 - s6;

endmodule

