//
// cpu_tb
//


module cpu_tb;

    logic clk;
    logic rst_n;

    parameter CYCLE = 10;

    always #(CYCLE/2) clk = ~clk;

    cpu_top cpu_top (
       .clk(clk),
       .rst_n(rst_n)
    );

    initial begin
        #10 clk = 1'd0;
        rst_n = 1'd0;
        #(CYCLE) rst_n = 1'd1;
    end

endmodule
