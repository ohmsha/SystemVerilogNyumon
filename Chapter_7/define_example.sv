`define PARAM 10'd512;
module define_example(input logic [15:0] IN, output logic [15:0] OUT);
   assign OUT=IN*`PARAM;
endmodule // define_example

