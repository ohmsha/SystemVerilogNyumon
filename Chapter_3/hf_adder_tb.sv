`timescale 1ns / 100ps
`default_nettype none

module hf_adder_tb();
  logic  A, B, S, C;

 Half_Adder adder(
 .A(A),
 .B(B), 
 .S(S),
 .C(C)
 );

  initial begin
    $monitor("time=%3d, A=%1b, B=%1b, S=%1b, C=%1b \n", $time, A, B, S, C);

     A = 1'b0;
	  B = 1'b0;


#10
     A = 1'b0;
	  B = 1'b1;

#10
     A = 1'b1;
	  B = 1'b0;

#10
     A = 1'b1;
	  B = 1'b1;
	  
#10
     A = 1'b0;
	  B = 1'b0;

#10
     A = 1'b0;
	  B = 1'b1;

#10
     A = 1'b1;
	  B = 1'b0;


#10
     A = 1'b1;
	  B = 1'b1;

	  
#10	 
    $display("################# end of checking module popcount ###############");
    $finish;
  end
endmodule

`default_nettype wire