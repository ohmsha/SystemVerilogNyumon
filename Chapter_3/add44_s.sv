module add44_s (
   input logic signed [3:0] A, B,		// 4ビット
   output logic signed [4:0] SUM);		// 5ビット

   assign SUM=A+B;

endmodule
