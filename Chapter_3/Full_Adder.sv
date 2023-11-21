module Full_Adder(
	input logic A, B, Cin, 
	output logic S, Cout);

	  logic ha0_S, ha0_C, ha1_C;
  	  assign Cout= ha0_C | ha1_C;

  	Half_Adder HA0(.A(A), .B(B), .S(ha0_S), .C(ha0_C));
  	Half_Adder HA1(.A(ha0_S), .B(Cin), .S(S), .C(ha1_C));
endmodule