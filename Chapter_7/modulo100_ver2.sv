module modulo100_ver2
  (input logic RB, CK, output logic [7:0] Q);
   always_ff @(posedge CK or negedge RB)
     if(RB==0)
       Q<=0;
     else
         Q<=(Q+1)%100;
endmodule // modulo100_ver1

