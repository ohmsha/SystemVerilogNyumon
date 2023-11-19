always_latch begin
  if(~CLK) begin
    EN_LATCH <= EN;
  end
end  

assign GCLK = CLK & EN_LATCH;
