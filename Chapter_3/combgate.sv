module COMBGATE(
	input logic A, B, C,
	output logic Y);

	    assign Y = (~A & B) | (A &~C);
endmodule
