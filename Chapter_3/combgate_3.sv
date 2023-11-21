module COMBGATE_3(
	input logic A, B, C, 
	output logic Y);
	
 	 logic D, E, F, G;

	not INV0(D, A);
	and AND0(F, D, B);
	not INV1(E, C);
	and AND1(G, A, E);
	or OR0(Y, F, G);
endmodule

