input logic CK;
input logic data;
input logic RB;
logic one_register;

always_ff @(posedge CK or negedge RB) begin
  if(!RB) begin
    one_register <= data;
  end else begin
    one_register <= 1'b0;
  end
end  


