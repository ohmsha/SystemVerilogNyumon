//
// gpo
//


module gpo (
    input logic clk,
    input logic rst_n,
    input logic we,
    input logic [7:0] wr_data,
    output logic [7:0] gpo_out
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
	        gpo_out <= 8'b00000000;
        end else begin
            if (we) begin
	            gpo_out <= wr_data;
            end
        end
    end

endmodule
