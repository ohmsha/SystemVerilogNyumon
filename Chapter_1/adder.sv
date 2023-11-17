module adder (input logic [7:0] a,b, output logic [7:0] c);
   always_comb
     begin
        c=a+b;
     end
endmodule
