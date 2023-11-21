module DIV84 (
   input logic signed [7:0] X, 			// 8ビット
   input logic signed [3:0] Y,			// 4ビット
   output logic signed [4:0] P);			// 4ビット
	output logic signed [3:0] P);			// 4ビット
	
   	assign P=X/Y;							// 商
		assinn R=X%Y;							// 剰余
		
endmodule

