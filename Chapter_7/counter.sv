module counter(input logic CK, RB, output logic MAX);
     parameter LIMIT=12'd2048;
   logic [11:0] CNT; // 12ビットで記述
   always @(posedge CK or negedge RB)
     if(RB==0)
       CNT<=0;
     else
       if(CNT==2048)
         CNT<=0;
       else
         CNT<=CNT+1;
   assign MAX=(CNT==LIMIT)?1:0;
endmodule // counter
   
   
