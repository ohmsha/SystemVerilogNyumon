module flipflop (input logic D, CK, output logic Q);
 always_ff @(posedge CK)
   begin
      Q<=D;
   end
endmodule
