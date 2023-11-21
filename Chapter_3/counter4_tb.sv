`timescale 1ns / 100ps
`default_nettype none

module counter4_tb();
  logic  CK, RB;
  logic [3:0] Q;
  
 COUNTER4 counter4(
 .CK(CK),
 .RB(RB),
 .Q(Q[3:0])
 );

initial begin
  CK=0;
     forever #10 CK = ~CK;  
end 
initial begin 
 RB<=0;
 #40;
 RB<=1;
 #400;
 
 $finish;
 
end 
endmodule 