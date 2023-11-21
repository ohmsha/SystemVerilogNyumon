`timescale 1ns / 100ps
`default_nettype none

module combgate_tb();
  logic  A, B, C, Y;

 COMBGATE_3 comb(
 .A(A),
 .B(B), 
 .C(C),
 .Y(Y)
 );

  initial begin
    $monitor("time=%3d, A=%1b, B=%1b, C=%1b, Y=%1b \n", $time, A, B, C, Y);

     A = 1'b0;
	  B = 1'b0;
	  C = 1'b0;

#10
     A = 1'b0;
	  B = 1'b0;
	  C = 1'b1;
#10
     A = 1'b0;
	  B = 1'b1;
	  C = 1'b0;
#10
     A = 1'b0;
	  B = 1'b1;
	  C = 1'b1;	  
#10
     A = 1'b1;
	  B = 1'b0;
	  C = 1'b0;	 
#10
     A = 1'b1;
	  B = 1'b0;
	  C = 1'b1;	
#10
     A = 1'b1;
	  B = 1'b1;
	  C = 1'b0;
#10
     A = 1'b1;
	  B = 1'b1;
	  C = 1'b1;
	  
#10	 
    $display("################# end of checking module popcount ###############");
    $finish;
  end
endmodule

`default_nettype wire