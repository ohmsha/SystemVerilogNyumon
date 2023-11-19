/*************************************************************************
 * System Name : 
 * File Name   : sim_SLOT.sv
 * Contents    :
 * Memo        : テストベンチ
 **************************************************************************/
`timescale 1ns/1ps

module sim_SLOT;
  logic	CK;			//システムクロック
  logic	RB;				//リセット信号
  logic	PSW;


//--- output -------------------------------------------------------------------
logic [7:0] SEG_A;				//7セグへのパターン出力
logic [7:0] SEG_B;				//7セグへのパターン出力
logic [7:0] LED;				  //ステートマシンの内部状態をLEDに表示

//1clock set
parameter STEP = 82;

//call module
SLOT SLOT7SEG(
	.CK(CK),
	.RB(RB),
	.PSW(PSW),
	.SEG_0(SEG_A),
	.SEG_1(SEG_B),
	.BZ(BZ),
	.LED(LED)
);

//make clock
always begin
 CK = 0;#(STEP/2);
 CK = 1;#(STEP/2);
end


//Simulation

	initial begin
		RB = 1'b1;
    PSW = 1'b1;		//初期値設定
		#(STEP*1);
		RB = 1'b0;
		#(STEP*3);
		RB = 1'b1;
		#(STEP*10);

    PSW = 1'b0;		//PSWをONにする (左の桁を揃える)
		#(STEP*3);
    PSW = 1'b1;		//PSWをOFFにする（スイッチから手を離す）

		#(STEP*80);

    PSW = 1'b0;		//PSWをONにする (右の桁を揃える)
		#(STEP*3);
    PSW = 1'b1;		//PSWをONにする（スイッチから手を離す）

    // あたりになったら、LED[7] が 1'b0 になる。

		#(STEP*10); 	//時間経過を観察

    PSW = 1'b0;		//PSWをONにする (スロットを最初の状態へ戻す)
		#(STEP*3);
    PSW = 1'b1;		//PSWをOFFにする（スイッチから手を離す）
		#(STEP*20);

		#100 $stop;
	end
endmodule

