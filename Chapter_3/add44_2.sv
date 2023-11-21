module ADD44_2 (
	input logic [3:0] A,	B,			// 4ビット
	output logic [4:0] SUM);			// 5ビット
	
        assign SUM ={A[3],A} + {B[3],B};			// ビット連結endmodule
endmodule