module ADDER4_2(
	input logic [3:0] A, B, 
	input logic Cin, 
	output logic [3:0] S, 
	output logic Cout);

	logic C1, C2, C3;

  	Full_Adder FA0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(C1)); 		// bit 0
  	Full_Adder FA1(.A(A[1]), .B(B[1]), .Cin(C1), .S(S[1]), .Cout(C2)); 		// bit 1
  	Full_Adder FA2(.A(A[2]), .B(B[2]), .Cin(C2), .S(S[2]), .Cout(C3)); 		// bit 2
  	Full_Adder FA3(.A(A[3]), .B(B[3]), .Cin(C3), .S(S[3]), .Cout(Cout)); 		// bit 3
endmodule
