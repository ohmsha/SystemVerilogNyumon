//
// imem
//


module imem (
    input logic clk,
    input logic [31:0] addr,
    output logic [31:0] rd_data
);

    logic [31:0] mem [0:2047];  // 8KiB(13bitアドレス空間)
    logic [10:0] addr_sync;  // 8KiBを表現するための11bitアドレス(下位2bitはここでは考慮しない)
    
    initial $readmemh({MEM_DATA_PATH, "code.hex"}, mem);
     
    always_ff @(posedge clk) begin
        addr_sync <= addr[12:2];  // 読み出しアドレス更新をクロックと同期することでBRAM化
    end
    
    assign rd_data = mem[addr_sync];

endmodule
