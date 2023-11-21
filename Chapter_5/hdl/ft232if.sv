//
// ft232if
//


module ft232if(
	input clock, reset,
	inout [7:0] FT_ADBUS,
	inout [6:0] FT_ACBUS,
	output logic [7:0] rcv_data,
	input [7:0] send_data,
	output logic rcv_flag,
	input send_flag,
	output logic send_available
);

logic RD_stat, WR_stat;
logic [2:0] RXF_stat;
logic [3:0] send_state_cnt;
logic [7:0] ADBUS_stat;

assign FT_ADBUS = ADBUS_stat;

assign FT_ACBUS[0] = 1'bz;  // RXF
assign FT_ACBUS[1] = 1'bz;  // TXE
assign FT_ACBUS[2] = RD_stat;  // RD
assign FT_ACBUS[3] = WR_stat;  // WR
assign FT_ACBUS[4] = 1'bz;  //SIWU
assign FT_ACBUS[5] = 1'bz;  // No Func
assign FT_ACBUS[6] = 1'bz;  // No Func

always_ff @(posedge clock or posedge reset) begin
	if (reset) begin
		RD_stat <= 1'b1;
		WR_stat <= 1'b1;
		RXF_stat <= 3'b111;
		ADBUS_stat <= 8'bz;
		rcv_data <= 8'b0;
		send_state_cnt <= 4'b0;
		rcv_flag <= 1'b0;
	end
	else begin
		RXF_stat <= {RXF_stat[1:0], FT_ACBUS[0]}; 
				
		if (RXF_stat == 3'b111 && FT_ACBUS[1] == 1'b0) begin  // TXE check
			send_available <= 1'b1;
		end
		else begin
			send_available <= 1'b0;
		end
		
		// 受信	
		if (RXF_stat == 3'b110) begin
			RD_stat <= 1'b0;
		end
		if (RXF_stat == 3'b100) begin
			rcv_data <= FT_ADBUS;
			rcv_flag <= 1'b1;
		end
		if (RXF_stat == 3'b000) begin
			RD_stat <= 1'b1;
			rcv_flag <= 1'b0;
		end

		// 送信			
		if (send_flag == 1'b1) begin
			if (send_available == 1'b1) begin
				WR_stat <= 1'b1;
				ADBUS_stat <= send_data;
				send_state_cnt <= send_state_cnt + 4'b1;
			end
		end
		if (send_state_cnt == 4'b0001) begin
			WR_stat <= 1'b0;
			send_state_cnt <= send_state_cnt + 4'b1;
		end
		if (send_state_cnt == 4'b0010) begin
			WR_stat <= 1'b1;
			ADBUS_stat <= 8'bz;
			send_state_cnt <= 4'b0;
		end
	end
end

endmodule