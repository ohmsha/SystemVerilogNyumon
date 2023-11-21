//
//  define.sv
//


// プログラムが格納されたディレクトリの絶対パスを指定
parameter MEM_DATA_PATH = "test/";

// データメモリの開始アドレスと容量を指定
parameter DMEM_START_ADDR = 32'h2000;
parameter DMEM_SIZE = 32'h2000;

// address for hardware counter
parameter HARDWARE_COUNTER_ADDR = 32'h20010;

// address for UART
parameter UART_TX_ADDR = 32'h20020;
parameter UART_RX_ADDR = 32'h20030;

// address for GPIO
parameter GPI_ADDR = 32'h20040;
parameter GPO_ADDR = 32'h20050;

parameter ENABLE = 1'b1;
parameter DISABLE = 1'b0;

// 命令形式
parameter TYPE_NONE = 3'd0;
parameter TYPE_U = 3'd1;
parameter TYPE_J = 3'd2;
parameter TYPE_I = 3'd3;
parameter TYPE_B = 3'd4;
parameter TYPE_S = 3'd5;
parameter TYPE_R = 3'd6;

// OPコード
parameter LUI = 7'b0110111;
parameter AUIPC = 7'b0010111;
parameter JAL = 7'b1101111;
parameter JALR = 7'b1100111;
parameter BRANCH = 7'b1100011;
parameter LOAD = 7'b0000011;
parameter STORE = 7'b0100011;
parameter OPIMM = 7'b0010011;
parameter OP = 7'b0110011;

// DSTレジスタの有無
parameter REG_NONE = 1'd0;
parameter REG_RD = 1'd1;

// ALUコード
parameter ALU_LUI = 6'd0;
parameter ALU_JAL = 6'd1;
parameter ALU_JALR = 6'd2;
parameter ALU_BEQ = 6'd3;
parameter ALU_BNE = 6'd4;
parameter ALU_BLT = 6'd5;
parameter ALU_BGE = 6'd6;
parameter ALU_BLTU = 6'd7;
parameter ALU_BGEU = 6'd8;
parameter ALU_LB = 6'd9;
parameter ALU_LH = 6'd10;
parameter ALU_LW = 6'd11;
parameter ALU_LBU = 6'd12;
parameter ALU_LHU = 6'd13;
parameter ALU_SB = 6'd14;
parameter ALU_SH = 6'd15;
parameter ALU_SW = 6'd16;
parameter ALU_ADD = 6'd17;
parameter ALU_SUB = 6'd18;
parameter ALU_SLT = 6'd19;
parameter ALU_SLTU = 6'd20;
parameter ALU_XOR = 6'd21;
parameter ALU_OR = 6'd22;
parameter ALU_AND = 6'd23;
parameter ALU_SLL = 6'd24;
parameter ALU_SRL = 6'd25;
parameter ALU_SRA = 6'd26;
parameter ALU_NOP = 6'd63;

// ALU入力タイプ
parameter OP_TYPE_NONE = 2'd0;
parameter OP_TYPE_REG = 2'd1;
parameter OP_TYPE_IMM = 2'd2;
parameter OP_TYPE_PC = 2'd3;
