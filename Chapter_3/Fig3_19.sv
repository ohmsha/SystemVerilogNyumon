`timescale 1ns / 100ps
`default_nettype none

module Fig3_19();
  logic  [7:0] X;
  logic  [3:0] Y;
  logic  [8:0] Q;
  logic  [3:0] R;


 DIV84 div(
 .X(X),
 .Y(Y), 
 .Q(Q),
 .R(R)
 );

  initial begin
    $monitor("time=%3d, X=%8b, Y=%4b, Q=%8b, R=%4b \n", $time, X, Y, Q, R);

     X = 8'b00000000;
	  Y = 4'b0000;
#10
     X = 8'b00000000;
	  Y = 4'b0001;
#10
     X = 8'b00000011;
	  Y = 4'b0001;
#10
     X = 8'b00100000;
	  Y = 4'b0100;  
#10
     X = 8'b01000101;
	  Y = 4'b0101;
#10
     X = 8'b10000001;
	  Y = 4'b0011;
#10
     X = 8'b11010000;
	  Y = 4'b0100;
#10
     X = 8'b01000000;
	  Y = 4'b1011;
#10
     X = 8'b01100000;
	  Y = 4'b1101;
#10
     X = 8'b11111111;
	  Y = 4'b1000;
#10
     X = 8'b11111111;
	  Y = 4'b1111;

	 
#10	 
    $display("################# end of checking module popcount ###############");
    $finish;
  end
endmodule

`default_nettype wire