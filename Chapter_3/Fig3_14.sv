`timescale 1ns / 100ps
`default_nettype none

module Fig3_14();
  logic  [3:0] A, B, S;
  logic  Cin, Cout;

 ADDER4_2 adder4(
 .A(A),
 .B(B), 
 .Cin(Cin),
 .S(S),
 .Cout(Cout)
 );
 

  initial begin
    $monitor("time=%3d, A=%4b, B=%4b, Cin=%1b, S=%4b, Cout=%1b \n", $time, A, B, Cin, S, Cout);

     A = 4'b0000;
	  B = 4'b0000;
	  Cin = 1'b0;


#10
     A = 4'b0001;
	  B = 4'b0001;
	  Cin = 1'b0;
#10
     A = 4'b0011;
	  B = 4'b0001;
	  Cin = 1'b0;
#10
     A = 4'b0011;
	  B = 4'b0011;
	  Cin = 1'b0; 
#10
     A = 4'b0111;
	  B = 4'b0011;
	  Cin = 1'b0; 
#10
     A = 4'b0111;
	  B = 4'b0111;
	  Cin = 1'b0; 
#10
     A = 4'b1111;
	  B = 4'b1111;
	  Cin = 1'b0; 
#10
	  A = 4'b0000;
	  B = 4'b0000;
	  Cin = 1'b1;
#10
     A = 4'b0001;
	  B = 4'b0001;
	  Cin = 1'b1;
#10
     A = 4'b0011;
	  B = 4'b0001;
	  Cin = 1'b1;
#10
     A = 4'b0011;
	  B = 4'b0011;
	  Cin = 1'b1; 
#10
     A = 4'b0111;
	  B = 4'b0011;
	  Cin = 1'b1; 
#10
     A = 4'b0111;
	  B = 4'b0111;
	  Cin = 1'b1; 
#10
     A = 4'b1111;
	  B = 4'b1111;
	  Cin = 1'b1; 
	  
#10	 
    $display("################# end of checking module popcount ###############");
    $finish;
  end
endmodule

`default_nettype wire