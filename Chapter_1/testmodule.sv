module testmodule(input logic A, B, CK, RB, output logic [1:0] OUT);
   logic REGA, REGB;
   always_ff @(posedge CK or negedge RB)
     if(RB==0)
       begin
          REGA<=0;
          REGB<=0;
       end
     else
       begin
          REGA<=REGB;
          REGB<=A&B;
       end
   assign OUT={REGA,REGB};
endmodule   
  
   
