module D_FF2(
	input logic D,RB,CK,
	output logic Q);

	    always_ff @(posedge CK or negedge RB)
		begin
		    if(RB==0)
		       Q<=0;
		     else
		       Q<=D;
         		end
endmodule