module ADD43_4 (
	input logic [3:0] A,				// 4ビット	
	input logic [2:0] B,				// 3ビット	
	output logic [4:0] SUM);			// 5ビット
 assign SUM=5'(signed'(A))+ 5'(signed'(B));		// 符号拡張
endmodule