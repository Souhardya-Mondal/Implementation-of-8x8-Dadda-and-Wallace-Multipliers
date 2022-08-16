`timescale 1ps/1ps
module test1;
reg [7:0]a,b;
wire [15:0] result;
dadda ex1(a,b,result);
initial
begin
$dumpfile("1.vcd");
$dumpvars(0,test1);
$monitor($time," a=%h , b=%h , result=%h" , a,b,result);
#500 a=8'h10; b=8'h42;
#500 a=8'h12; b=8'h42;
#500 a=8'h18; b=8'h42;
#500 a=8'h20; b=8'h12;
#500 a=8'h12; b=8'h72;
#500 a=8'h28; b=8'h52;
end
endmodule
