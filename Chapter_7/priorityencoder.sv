module priorityencoder(input [3:0] A, output [1:0] Y, output N);
   function [1:0] encoder(input [3:0] IN);
      casex (IN)
        4'b1xxx: encoder=2'b11;
        4'b01xx: encoder=2'b10;
        4'b001x: encoder=2'b01;
        4'b0001: encoder=2'b00;
        default: encoder=2'b00;
      endcase // casex (IN)
   endfunction // encoder
   assign Y=encoder(A);
   assign N=(A==0)?1'b0:1'b1;
endmodule // priorityencoder

      


	   
