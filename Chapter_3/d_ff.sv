module D_FF (
	input logic D ,CK,
	output logic Q);

     always_ff @(posedge CK) 
    	Q<=D;

endmodule