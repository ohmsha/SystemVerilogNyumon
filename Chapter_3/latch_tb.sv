`timescale 1ns / 100ps
`default_nettype none

module latch_tb();
  logic  CK, D, Q;

 D_LATCH d_latch(
 .CK(CK),
 .D(D), 
 .Q(Q)
 );

initial begin
  CK=0;
     forever #10 CK = ~CK;  
end 
initial begin 
// reset=1;
 D <= 0;
 #35;
// reset=0;
 D <= 1;
 #20;
 D <= 0;
 #30;
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