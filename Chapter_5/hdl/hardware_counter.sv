//
// hardware counter
//


module hardware_counter (
    input logic clk,
    input logic rst_n,
    output logic [31:0] hc_out
);

    logic [31:0] cycles;

    assign hc_out = cycles;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cycles <= 32'd0;
        end else begin
            cycles <= cycles + 32'd1;
        end
    end

endmodule
