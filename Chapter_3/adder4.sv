module ADDER4(
	input logic [3:0] A, B, 
	input logic Cin, 
	output logic [3:0] S, 
	output logic Cout);

	  assign {Cout, S} = A+B+Cin;
endmodule
