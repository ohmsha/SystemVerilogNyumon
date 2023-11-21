module SELECTOR (
	input  logic [1:0] sel,		// select
	input logic A, B, C, D,		// candidate
	output logic out );			// result

  assign out = (sel == 2'b00) ? A : (		// assign + condition
    (sel == 2'b01) ? B : (
        (sel == 2'b10) ? C : D
)
     );
endmodule