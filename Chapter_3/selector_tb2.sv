`timescale 1ns / 100ps
`default_nettype none

module selector_tb2();
  logic  [1:0] sel;
  logic  A, B, C, D;
  logic  out;

 SELECTOR selector(
 .sel(sel),
 .A(A),
 .B(B), 
 .C(C),
 .D(D),
 .out(out)
 );

  initial begin
    $monitor("time=%3d, A=%1b, B=%1b, C=%1b, D=%1b, sel=%2b, out=%1b \n", $time, A, B, C, D, sel, out);

     A = 1'b0;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b0;
	  sel = 2'b00;
	  
#10
	  A = 1'b1;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b0;
	  sel = 2'b00;
	  
#10
	  A = 1'b0;
	  B = 1'b1;
	  C = 1'b0;
	  D = 1'b0;	  
#10
	  A = 1'b0;
	  B = 1'b0;
	  C = 1'b1;
	  D = 1'b0;	  
#10
	  A = 1'b0;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b1;	  
	  
#10
	  A = 1'b1;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b0;
	  sel = 2'b01;
	  
#10
	  A = 1'b0;
	  B = 1'b1;
	  C = 1'b0;
	  D = 1'b0;	  
#10
	  A = 1'b0;
	  B = 1'b0;
	  C = 1'b1;
	  D = 1'b0;	  
#10
	  A = 1'b0;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b1;	  
#10
	  A = 1'b1;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b0;
	  sel = 2'b10;
	  
#10
	  A = 1'b0;
	  B = 1'b1;
	  C = 1'b0;
	  D = 1'b0;	  
#10
	  A = 1'b0;
	  B = 1'b0;
	  C = 1'b1;
	  D = 1'b0;	  
#10
	  A = 1'b0;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b1;	 
#10
	  A = 1'b1;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b0;
	  sel = 2'b11;
	  
#10
	  A = 1'b0;
	  B = 1'b1;
	  C = 1'b0;
	  D = 1'b0;	  
#10
	  A = 1'b0;
	  B = 1'b0;
	  C = 1'b1;
	  D = 1'b0;	  
#10
	  A = 1'b0;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b1;	 
#10
     A = 1'b0;
	  B = 1'b0;
	  C = 1'b0;
	  D = 1'b0;
	  sel = 2'b00;
	  
#10	 
    $display("################# end of checking module popcount ###############");
    $finish;
  end
endmodule

`default_nettype wire