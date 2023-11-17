module counter(input logic CK, RB, output logic MAX);
   parameter LIMIT=12'd2048;
   logic [9:0] CNT; // 10ビットで記述されているので2048にならない．
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
