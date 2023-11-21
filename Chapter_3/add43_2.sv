module ADD43_2 (
	input logic [3:0] A,				// 4ビット	
	input logic [2:0] B,				// 3ビット	
	output logic [4:0] SUM);			// 5ビット
 assign SUM ={A[3],A} + {B[2],B[2],B};		// 符号拡張
endmodule
