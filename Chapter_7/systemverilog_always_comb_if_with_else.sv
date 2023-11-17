module systemverilog_always_comb_if_with_else (input logic [3:0] A, output logic OUT);
   always_comb 
     if(A==0)
       OUT=0;
     else if(A==1)
       OUT=1;
     else if(A==2)
       OUT=0;
     else if(A==3)
       OUT=1;
     else
       OUT=0;
endmodule
