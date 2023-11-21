module COMBGATE_2(
	input logic A, B, C, 
	output logic Y);
	
 	 logic D, E, F, G;

	not (D, A);
	and (F, D, B);
	not (E, C);
	and (G, A, E);
	or (Y, F, G);
endmodule

