module priorityencoder(input [3:0] A, output [1:0] Y, output N);
   function [1:0] encoder(input [3:0] IN);
      begin
         for (int i=0; i <= 3; i++) 
           if (IN[i]) encoder = 4'(i);
	   else
	     encoder  = 4'b0; 
      end
   endfunction
   assign Y=encoder(A);
   assign N=(A==0)?1'b0:1'b1;
endmodule // priorityencoder

      


	   
