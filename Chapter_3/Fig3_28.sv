`timescale 1ns / 100ps
`default_nettype none

module Fig3_28();
  logic  CK, RB;
  logic [3:0] Q;
  logic CO;
  
 COUNTER4C counter4(
 .CK(CK),
 .RB(RB),
 .Q(Q[3:0]),
 .CO(CO)
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