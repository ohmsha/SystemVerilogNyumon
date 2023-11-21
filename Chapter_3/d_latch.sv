module D_LATCH(			// Dラッチ
	input logic CK, D, 
	output logic Q);		
		
always_latch			//always_latch文

if(CK) Q <= D;		

endmodule