module Verilog(input wire CK, A, B, output wire C);
   reg REG;
   always @(posedge CK)
     REG<=A&B;
   assign C=REG;
endmodule
   
