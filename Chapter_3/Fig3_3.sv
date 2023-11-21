`timescale 1ns / 100ps
`default_nettype none

module Fig3_3();
  logic  [3:0] A;
  logic  [3:0] B;
  logic  [4:0] SUM;


 ADD44_1 add(
 .A(A),
 .B(B), 
 .SUM(SUM)
 );

  initial begin
    $monitor("time=%3d, A=%4b, B=%4b, SUM=%5b \n", $time, A, B, SUM);

     A = 4'b0000;
	  B = 4'b0000;
#10
     A = 4'b0001;
	  B = 4'b0001;
#10
     A = 4'b0011;
	  B = 4'b0001;
#10
     A = 4'b0111;
	  B = 4'b0011;	  
#10
     A = 4'b1111;
	  B = 4'b0111;

	 
#10	 
    $display("################# end of checking module popcount ###############");
    $finish;
  end
endmodule

`default_nettype wire