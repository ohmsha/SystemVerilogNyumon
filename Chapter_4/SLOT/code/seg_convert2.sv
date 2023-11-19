/*************************************************************************
 * System Name : SystemVerilog教科書
 * File Name   : seg_convert.sv
 * Contents    : 7セグメントLEDへのパターン変換2
 * Model       : 
 * FPGA        : 
 * Author      : 
 * History     : 
 * Memo        : 
 **************************************************************************/
module seg_convert2(
	input  logic [4:0]SEG_IN,	//表示する値
	input  logic SEG_EN,			//EN信号
	input  logic DOT,
	output logic [7:0]SEG_OUT	//7SEGへ出力するパターン
);

//--- parameter -----------------------------------------------------------
parameter SEG_P0   = 8'b0000_0011;	//0
parameter SEG_P1   = 8'b1001_1111;	//1
parameter SEG_P2   = 8'b0010_0101;	//2
parameter SEG_P3   = 8'b0000_1101;	//3
parameter SEG_P4   = 8'b1001_1001;	//4
parameter SEG_P5   = 8'b0100_1001;	//5
parameter SEG_P6   = 8'b0100_0001;	//6
parameter SEG_P7   = 8'b0001_1111;	//7
parameter SEG_P8   = 8'b0000_0001;	//8
parameter SEG_P9   = 8'b0000_1001;	//9
parameter SEG_PA   = 8'b0001_0001;	//A
parameter SEG_Pb   = 8'b1100_0001;	//b
parameter SEG_Pc   = 8'b1110_0101;	//c
parameter SEG_Pd   = 8'b1000_0101;	//d
parameter SEG_PE   = 8'b0110_0001;	//E
parameter SEG_PF   = 8'b0111_0001;	//F


parameter SEG_PM   = 8'b1111_1101;	//マイナス
parameter SEG_POFF = 8'b1111_1111;	//消去

assign	SEG_OUT = convert({SEG_EN,SEG_IN});

function [7:0] convert(input [5:0] in);
	casex (in)
		6'b00_xxxx : convert = SEG_POFF ^ {7'b0000000,DOT};

		6'b10_0000 : convert = SEG_P0 ^ {7'b0000000,DOT};
		6'b10_0001 : convert = SEG_P1 ^ {7'b0000000,DOT};
		6'b10_0010 : convert = SEG_P2 ^ {7'b0000000,DOT};
		6'b10_0011 : convert = SEG_P3 ^ {7'b0000000,DOT};
		6'b10_0100 : convert = SEG_P4 ^ {7'b0000000,DOT};
		6'b10_0101 : convert = SEG_P5 ^ {7'b0000000,DOT};
		6'b10_0110 : convert = SEG_P6 ^ {7'b0000000,DOT};
		6'b10_0111 : convert = SEG_P7 ^ {7'b0000000,DOT};
		6'b10_1000 : convert = SEG_P8 ^ {7'b0000000,DOT};
		6'b10_1001 : convert = SEG_P9 ^ {7'b0000000,DOT};
		6'b10_1010 : convert = SEG_PA ^ {7'b0000000,DOT};
		6'b10_1011 : convert = SEG_Pb ^ {7'b0000000,DOT};
		6'b10_1100 : convert = SEG_Pc ^ {7'b0000000,DOT};
		6'b10_1101 : convert = SEG_Pd ^ {7'b0000000,DOT};
		6'b10_1110 : convert = SEG_PE ^ {7'b0000000,DOT};
		6'b10_1111 : convert = SEG_PF ^ {7'b0000000,DOT};

		6'b11_0000 : convert = SEG_PM ^ {7'b0000000,DOT};

		default   : convert = 8'b0000_0000 ^ {7'b0000000,DOT};
	endcase
endfunction

endmodule

