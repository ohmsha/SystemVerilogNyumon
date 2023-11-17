module parameter_example(input logic [15:0] IN, output logic [15:0] OUT);
   parameter PARAM=10'd512;
   assign OUT=IN*PARAM;
endmodule // parameter_example

