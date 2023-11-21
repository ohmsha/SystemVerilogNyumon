module COUNTER4(
	input logic CK, RB,
	output logic [3:0] Q);					// Count Output

always_ff @(posedge CK or negedge RB) 
    begin
         if (RB==0) begin
            Q <= 4'h0;
	         end 
         else begin
            Q<= Q + 4'h1;
                  end
      end
endmodule