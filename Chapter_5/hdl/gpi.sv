//
// gpi
//


module gpi (
    input logic clk,
    input logic rst_n,
    input logic [7:0] wr_data,
    output logic [7:0] gpi_out
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
	        gpi_out <= 8'b00000000;
        end else begin
	        gpi_out <= wr_data;
        end
    end

endmodule
