module DIV84 (
   input logic signed [7:0] X, 			// 8ビット
   input logic  signed [3:0] Y,			// 4ビット
   output logic  signed [7:0] Q,			// 8ビット
	output logic  signed [3:0] R);			// 4ビット
	
   	assign Q=X/Y;							// 商
		assign R=X%Y;							// 剰余
		
endmodule

