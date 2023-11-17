module priorityencoder(input [3:0] A, output [1:0] Y, output N);
   assign Y[1]=A[3]|(~A[2])&A[1];
   assign Y[0]=A[3]|A[2];
   assign N=~(A[3]|A[2]|A[1]|A[0]);
endmodule // priorityencoder

      


	   
