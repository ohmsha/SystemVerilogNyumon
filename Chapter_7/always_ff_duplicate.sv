module always_ff_duplicate (input logic a, b, CK, output logic c);
   always_ff @(posedge CK)
        c<=a;
   always_ff @(posedge CK)
        c<=b;
endmodule // always_ff_duplicate


	
