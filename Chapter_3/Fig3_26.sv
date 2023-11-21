`timescale 1ns / 100ps
`default_nettype none

module Fig3_26();
  logic  D, RB, CK, Q;

 D_FF2 ff(
 .CK(CK),
 .D(D), 
 .RB(RB),
 .Q(Q)
 );

initial begin
  CK=0;
     forever #10 CK = ~CK;  
end 
initial begin 
 RB<=0;
 D <= 0;
 #20;
 D <=1;
 #20;
 D <=0;
 #20;
 RB<=1;
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