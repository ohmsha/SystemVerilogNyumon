module ADD44_1 (
	input logic [3:0] A,	B,			// 4ビット
	output logic [4:0] SUM);			// 5ビット
	
        assign SUM =A + B;			// ビット連結endmodule
endmodule