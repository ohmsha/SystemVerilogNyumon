module COUNTER32 (CK, RB, CT);

//// Clock
input logic CK;

//// Negative reset
// 0: reset
// 1: other
input logic RB;

// Count signal
output logic [31:0] CT;

// Count register
logic [31:0] count_r;
// Assign count_o to count_r
assign CT = count_r;

always_ff @(posedge CK)
begin
	if(!RB) begin
		count_r <= #2 32'h0;
	end
	else begin
		count_r <= #2 count_r + 32'h1;
	end
end

endmodule
