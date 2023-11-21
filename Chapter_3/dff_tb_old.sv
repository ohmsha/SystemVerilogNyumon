`timescale 1ps / 1ps
`default_nettype none
// `include "d_latch.sv"



module dff_tb();
  logic signed CLK, D, Q;

 D_LATCH d_latch(
 .CLK(CLK),
 .D(D), 
 .Q(Q)
 );

//------------------------------------------------------------------------------
// Clock generator
//------------------------------------------------------------------------------
parameter CLK_PERIOD = 20000; // ps 50 MHz

initial 	begin
	CLK = 1'b0;
			end
			
	always #(CLK_PERIOD/2) begin
		CLK <= ~CLK;
								  end

//------------------------------------------------------------------------------
// Reset generator
//------------------------------------------------------------------------------
//initial begin
//	RST = 1;
//	repeat(20) @(negedge OSC50M);
//	RST = 0;
//end
//------------------------------------------------------------------------------
// data generator
//------------------------------------------------------------------------------
initial begin
	D = 0;
	repeat(20) @(negedge CLK);
	D = 1;
	repeat(20) @(negedge CLK);
	D = 0;	
	repeat(20) @(negedge CLK);
	D = 1;
	
			end
//------------------------------------------------------------------------------
// Test vector
//------------------------------------------------------------------------------
initial begin
	@(posedge CLK);
//		while(RST) @(negedge OSC50M);
		repeat(100) @(posedge CLK);
	$finish;
			end
//------------------------------------------------------------------------------
endmodule


`default_nettype wire