module systemverilog_always_comb_full (input logic [3:0] A, output logic OUT);
   always_comb 
     case(A)
       0:  OUT=0;
       1: OUT=1;
       default: OUT=0;
     endcase // case (A)
endmodule

