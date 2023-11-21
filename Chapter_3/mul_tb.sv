`timescale 1ns / 100ps
`default_nettype none

module mul_tb();
  logic  [3:0] X;
  logic  [2:0] Y;
  logic  [6:0] P;


 MUL43 mul43(
 .X(X),
 .Y(Y), 
 .P(P)
 );

  initial begin
    $monitor("time=%3d, X=%4b, Y=%3b, P=%7b \n", $time, X, Y, P);

     X = 4'b0000;
	  Y = 3'b000;
#10
     X = 4'b0001;
	  Y = 3'b001;
#10
     X = 4'b0011;
	  Y = 3'b001;
#10
     X = 4'b0111;
	  Y = 3'b011;	  
#10
     X = 4'b0101;
	  Y = 3'b001;
#10
     X = 4'b1011;
	  Y = 3'b001;
#10
     X = 4'b0101;
	  Y = 3'b111;	
#10
     X = 4'b1001;
	  Y = 3'b101;
#10
     X = 4'b1011;
	  Y = 3'b101;
#10
     X = 4'b1111;
	  Y = 3'b111;

	 
#10	 
    $display("################# end of checking module popcount ###############");
    $finish;
  end
endmodule

`default_nettype wire