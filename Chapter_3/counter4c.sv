module COUNTER4C(
      input logic CK, RB,
      output logic [3:0] Q,
      output logic CO);

  	always_ff @(posedge CK or negedge RB) begin
    		if(RB==0) begin
      			{CO, Q} <= 5'h0;
    			    end else begin
      			{CO, Q} <= Q + 4'h1;
    				       end
  			     end
endmodule