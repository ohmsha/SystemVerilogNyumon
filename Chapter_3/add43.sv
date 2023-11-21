module ADD43 (
   input logic signed [3:0] A, 			// 4ビット
   input logic signed [2:0] B,			// 3ビット
   output logic signed [4:0] SUM);		// 5ビット

   assign SUM=A+B;				//加算

   endmodule