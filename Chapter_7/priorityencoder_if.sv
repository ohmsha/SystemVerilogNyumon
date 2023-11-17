module priorityencoder(input [3:0] A, output [1:0] Y, output N);
   function [1:0] encoder(input [3:0] IN);
      if(IN[3]==1)
        encoder=2'b11;
      else if(IN[2]==1)
        encoder=2'b10;
      else if(IN[1]==1)
        encoder=2'b01;
      else
        encoder=2'b00;
   endfunction // encoder
   assign Y=encoder(A);
   assign N=(A==0)?1'b0:1'b1;
endmodule // priorityencoder
