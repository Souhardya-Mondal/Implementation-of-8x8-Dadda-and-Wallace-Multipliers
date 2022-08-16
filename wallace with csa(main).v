// Code your design here
// implementation of 8 by 8 wallace multiplier with a 11 bit csa in last stage 
`timescale 1ps/1ps

module wallace(a,b,result); // the wallace multiplier top module
input [7:0]a,b;
output [15:0] result;
wire [7:0] pp1;
wire [8:1] pp2;
wire [9:2] pp3;
wire [10:3] pp4;
wire [11:4] pp5;
wire [12:5] pp6;
wire [13:6] pp7;
wire [14:7] pp8;
assign pp1=a*b[0]; // generating the partial products. Can be generated using AND gates 
assign pp2=a*b[1];// generating the partial products. Can be generated using AND gates 
assign pp3=a*b[2];// generating the partial products. Can be generated using AND gates 
assign pp4=a*b[3];// generating the partial products. Can be generated using AND gates 
assign pp5=a*b[4];// generating the partial products. Can be generated using AND gates 
assign pp6=a*b[5];// generating the partial products. Can be generated using AND gates 
assign pp7=a*b[6];// generating the partial products. Can be generated using AND gates 
assign pp8=a*b[7];// generating the partial products. Can be generated using AND gates 
wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37,s38,s39,s40,s41,s42;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42;

// si means sum from the ith full/half adder
//ci means the carry from ith full/half adder
/****************************************************/
//reduction stage 1

HA f1(pp1[1],pp2[1],s1,c1);
FA f2(pp1[2],pp2[2],pp3[2],s2,c2);
FA f3(pp1[3],pp2[3],pp3[3],s3,c3);
FA f4(pp1[4],pp2[4],pp3[4],s4,c4);
HA f5(pp4[4],pp5[4],s5,c5);
FA f6(pp1[5],pp2[5],pp3[5],s6,c6);
FA f7(pp4[5],pp5[5],pp6[5],s7,c7);
FA f8(pp1[6],pp2[6],pp3[6],s8,c8);
FA f9(pp4[6],pp5[6],pp6[6],s9,c9);
FA f10(pp1[7],pp2[7],pp3[7],s10,c10);
FA f11(pp4[7],pp5[7],pp6[7],s11,c11);
HA f12(pp2[8],pp3[8],s12,c12);
FA f13(pp4[8],pp5[8],pp6[8],s13,c13);
FA f14(pp4[9],pp5[9],pp6[9],s14,c14);
FA f15(pp4[10],pp5[10],pp6[10],s15,c15);
HA f16(pp5[11],pp6[11],s16,c16);
/********************************************************/
/****************************************************/
//reduction stage 2

HA f17(s2,c1,s17,c17);
FA f18(s3,c2,pp4[3],s18,c18);
FA f19(s4,c3,s5,s19,c19);
FA f20(s6,c4,s7,s20,c20);
FA f21(s8,c6,s9,s21,c21);
HA f22(c7,pp7[6],s22,c22);
FA f23(s10,c8,s11,s23,c23);
FA f24(c9,pp7[7],pp8[7],s24,c24);
FA f25(s12,c10,s13,s25,c25);
FA f26(c11,pp7[8],pp8[8],s26,c26);
FA f27(pp3[9],c12,s14,s27,c27);
FA f28(c13,pp7[9],pp8[9],s28,c28);
FA f29(c14,pp7[10],pp8[10],s29,c29);
FA f30(c15,pp7[11],pp8[11],s30,c30);
FA f31(c16,pp7[12],pp8[12],s31,c31);
HA f32(pp7[13],pp8[13],s32,c32);

/****************************************************/
/****************************************************/
//reduction stage 3

HA f33(s18,c17,s33,c33);
HA f34(s19,c18,s34,c34);
FA f35(s20,c19,c5,s35,c35);
FA f36(s21,c20,s22,s36,c36);
FA f37(s23,c21,s24,s37,c37);
FA f38(s25,c23,s26,s38,c38);
FA f39(s27,c25,s28,s39,c39);
FA f40(s15,c27,s29,s40,c40);
HA f41(s16,s30,s41,c41);
HA f42(pp6[12],s31,s42,c42);

/****************************************************/
/****************************************************/
//reduction stage 4

HA f43(s34,c33,s43,c43);
HA f44(s35,c34,s44,c44);
HA f45(s36,c35,s45,c45);
FA f46(s37,c36,c22,s46,c46);
FA f47(s38,c37,c24,s47,c47);
FA f48(s39,c38,c26,s48,c48);
FA f49(s40,c39,c28,s49,c49);
FA f50(s41,c40,c29,s50,c50);
FA f51(s42,c41,c30,s51,c51);
FA f52(s32,c31,c42,s52,c52);
HA f53(c32,pp8[14],s53,c53);

/****************************************************/

//defining the final two rows which are to be added as x1 and x2
wire[15:0] x1;
wire [15:0] x2;
assign x1[0]=pp1[0];
assign x1[1]=s1;
assign x1[2]=s17;
assign x1[3]=s33;
assign x1[14:4]={s53,s52,s51,s50,s49,s48,s47,s46,s45,s44,s43};
assign x1[15]=0;

assign x2[4:0]=0;
assign x2[15:5]={c53,c52,c51,c50,c49,c48,c47,c46,c45,c44,c43};
assign result[4:0]=x1[4:0];
wire [11:0] result1; 
  gp tt(x1[15:5],x2[15:5],result1);
assign result[15:5]=result1[10:0];
endmodule



module HA(a,b,sum,cout);
input a,b;
output sum,cout;
   xor  #60 (sum,a,b);
    and #50 (cout,a,b);
endmodule

//gp module implements the carry select adder
module gp(a,b,result);
input [10:0] a,b; // 11 bit addition as 2+3+4+2 sub additions. Look at Dinesh's Sir diagram of reduction 
output [11:0] result;
//the sub adders are implemeted using ripple carry architecture
two_bit_ripple_carry r(a[1:0],b[1:0],0,result[1:0],c1);
three_bit_ripple_carry r1(a[4:2],b[4:2],c1,c2,result[4:2]);
four_bit_ripple_carry r2(a[8:5],b[8:5],c2,c3,result[8:5]);
  two_final_bit_ripple_carry r3(a[10:9],b[10:9],c3,result[11],result[10:9]);
endmodule

module two_bit_ripple_carry(a,b,cin,sum,cout);//first stage is normal as cin  is obtained immediately. No need to wait
wire t1;
input [1:0] a,b;
  output [1:0]sum;
  input cin;
output cout;
FA f1(a[0],b[0],cin,sum[0],t1);
FA f2(a[1],b[1],t1,sum[1],cout);
endmodule


module three_bit_ripple_carry(a,b,cin,c_out,result); // here and in subsequent blocks, cin will be used as select line in MUXes
input [2:0] a,b;
  output [2:0] result;
  input cin;
output c_out;
wire t1,t2,cout,cout1;
wire t5,t6;
wire [2:0] sum,sum1;
FA f1(a[0],b[0],0,sum[0],t1);
FA f2(a[1],b[1],t1,sum[1],t2);
FA f3(a[2],b[2],t2,sum[2],cout);


FA f6(a[0],b[0],1,sum1[0],t5);
FA f7(a[1],b[1],t5,sum1[1],t6);
FA f8(a[2],b[2],t6,sum1[2],cout1);


assign #20 result=cin?sum1:sum;
assign #20 c_out=cin?cout1:cout;

endmodule

module four_bit_ripple_carry(a,b,cin,c_out,result);
input [3:0] a,b;
wire t1,t2,t3,cout,cout1;
input cin;
output c_out;
output[3:0] result;
wire [3:0] sum,sum1;
wire t6,t7,t8;
FA f1(a[0],b[0],0,sum[0],t1);
FA f2(a[1],b[1],t1,sum[1],t2);
FA f3(a[2],b[2],t2,sum[2],t3);
FA f4(a[3],b[3],t3,sum[3],cout);


FA f7(a[0],b[0],1,sum1[0],t6);
FA f8(a[1],b[1],t6,sum1[1],t7);
FA f9(a[2],b[2],t7,sum1[2],t8);
FA f10(a[3],b[3],t8,sum1[3],cout1);


assign #20 result=cin?sum1:sum;
assign #20 c_out=cin?cout1:cout;
endmodule

module two_final_bit_ripple_carry(a,b,cin,c_out,result);
input [1:0] a,b;
  output [1:0] result;
  input cin;
output c_out;
wire t1,cout,cout1;
wire t5;
wire [1:0] sum,sum1;
FA f1(a[0],b[0],0,sum[0],t1);
  FA f3(a[1],b[1],t1,sum[1],cout);


FA f6(a[0],b[0],1,sum1[0],t5);
  FA f8(a[1],b[1],t5,sum1[1],cout1);


assign #20 result=cin?sum1:sum;
assign #20 c_out=cin?cout1:cout;

endmodule






module FA
(
 input x,
 input y,
 input cin,
 
 output A, 
 output cout
 );
 wire t1,t2,t3;
    xor #30 (A,x,y,cin);
  and(t1,x,y);
  and(t2,cin,x);
  and(t3,cin,y);
  or #10 (cout,t1,t2,t3);

 
endmodule
