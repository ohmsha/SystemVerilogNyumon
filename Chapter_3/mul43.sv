module MUL43 (
   input logic signed [3:0] X, 			// 4ビット
   input logic signed [2:0] Y,			// 3ビット
   output logic signed [6:0] P);			// 7ビット
	
   	assign P=X*Y;							//乗算
		
endmodule

