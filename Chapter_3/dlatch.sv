module D_LATCH(			// Dラッチ
	input logic CLK, D, 
	output logic Q);		
		
always_latch			//always_latch文
		
Q <= D;

endmodule
