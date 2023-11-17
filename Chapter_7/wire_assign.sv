module wire_assign(input logic a,b,c, output logic ya,yb);
   wire w0 = a & b & c;
   wire logic hoge;
   assign ya=~w0;
   assign yb=~(a&b&c);
endmodule // wire_assign

