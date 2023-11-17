module flipflop_ng (input logic D, CK, output logic Q);
 always_ff @(CK==1)
   begin
      Q<=D;
   end
endmodule
