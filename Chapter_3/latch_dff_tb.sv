`timescale 1ns / 100ps
`default_nettype none

module latch_dff_tb();
  logic  CLK, D, Q;

 D_FF d_latch(
 .CLK(CLK),
 .D(D), 
 .Q(Q)
 );

initial begin
  CLK=0;
     forever #10 CLK = ~CLK;  
end 
initial begin 
// reset=1;
 D <= 0;
 #95;
// reset=0;
 D <= 1;
 #100;
 D <= 0;
 #110;
 D <= 1;
 #20;
 D <= 0;
 #20;
 D <= 1;
 #10;
 D <= 0;
 #30;
 D <= 1;
 #20
 $finish;
 
end 
endmodule 