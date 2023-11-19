/*************************************************************************
 * System Name : 
 * File Name   : BUZZER.sv
 * Contents    :
 * Memo        :
 **************************************************************************/

module BUZZER(
	input  logic CK,
	input  logic RB,
	input  logic EN,
	output logic OUT
);

logic [14:0] cnt;

parameter A4  = 15'd13635;

always_ff @(posedge CK or negedge RB)begin
	if(RB==1'b0) begin
		cnt <= 15'd0;
	end
  else if(cnt == A4)begin
		cnt <= 15'd0;
  end else begin
		cnt <= cnt + 15'd1;
  end
end

always_ff @(posedge CK or negedge RB)begin
	if(RB==1'b0) begin
		OUT <= 1'b0;
	end
  else if(cnt == A4 && EN==1'b1)begin
		OUT <= ~OUT;
  end
end

endmodule

