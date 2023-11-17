module SystemVerilog(input logic CK, A, B, output logic C);
   logic REG;
   always_ff @(posedge CK)
     REG<=A&B;
   assign C=REG;
endmodule
   
