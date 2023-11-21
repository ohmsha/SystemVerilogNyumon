module SELECTOR_2 (
	input  logic [1:0] sel,			// select
	input logic A, B, C, D,			// candidate
	output logic out );				// result

	always_comb begin					// always_comb文
		case(sel)						// case文
          2'b00    : out = A ;
          2'b01    : out = B ;
          2'b10    : out = C ;
          default  : out = D ;
		endcase
                end
endmodule
