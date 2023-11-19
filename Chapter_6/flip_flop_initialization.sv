input logic CK;
input logic data;
logic one_register = 0;

always_ff @(posedge CK) begin
  one_register <= data;
end  

