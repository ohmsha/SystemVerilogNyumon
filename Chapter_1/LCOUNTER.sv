module LCOUNTER(output logic [3:0] COUNT, input logic IN,CK, input logic [3:0] LOAD);
   always_ff @(posedge CK)
       if(LOAD==1)
         COUNT<=IN;
       else
         COUNT<=COUNT+1;
endmodule
