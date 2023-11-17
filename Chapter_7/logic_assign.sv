module logic_assign(input logic a,b,c, output logic ya,yb);
   logic w0 = a & b & c;
   assign ya=~w0;
   assign yb=~(a&b&c);
endmodule // wire_assign

