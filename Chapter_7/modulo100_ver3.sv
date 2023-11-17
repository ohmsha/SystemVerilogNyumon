module modulo100_ver3
  (input logic RB, CK, output logic [7:0] Q);
   always_ff @(posedge CK or negedge RB)
     if(RB==0)
       Q<=0;
     else
       if((Q+1)%100==0)
         Q<=0;
       else
         Q<=Q+1;
endmodule // modulo100_ver3

