`timescale 1ns / 100ps
`default_nettype none

module Fig3_12();
  logic  A, B, Cin, S, Cout;

 Full_Adder adder(
 .A(A),
 .B(B), 
 .Cin(Cin),
 .S(S),
 .Cout(Cout)
 );

  initial begin $dumpfile("Fig3_12.vcd");$dump_vars;
    $monitor("time=%3d, A=%1b, B=%1b, Cin=%1b, S=%1b Cout=%1b \n", $time, A, B, Cin, S, Cout);

     A = 1'b0;
	  B = 1'b0;
	  Cin = 1'b0;


#10
     A = 1'b0;
	  B = 1'b1;
	  Cin = 1'b0;

#10
     A = 1'b1;
	  B = 1'b0;
	  Cin = 1'b0;

#10
     A = 1'b1;
	  B = 1'b1;
	  Cin = 1'b0;
	  
#10
     A = 1'b0;
	  B = 1'b0;
	  Cin = 1'b1;

#10
     A = 1'b0;
	  B = 1'b1;
	  Cin = 1'b1;

#10
     A = 1'b1;
	  B = 1'b0;
	  Cin = 1'b1;


#10
     A = 1'b1;
	  B = 1'b1;
	  Cin = 1'b1;

	  
#10	 
    $display("################# end of checking module popcount ###############");
    $finish;
  end
endmodule

`default_nettype wire