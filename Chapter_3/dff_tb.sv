`timescale 1ns / 100ps
`default_nettype none

module dff_tb();
  logic  D, CK, Q;

 D_FF d_ff(
 .CK(CK),
 .D(D), 
 .Q(Q)
 );

initial begin
  CK=0;
     forever #10 CK = ~CK;  
end 
initial begin 
 D <= 0;
 #20;
 D <=1;
 #20;
 D <=0;
 #25;
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