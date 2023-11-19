/*************************************************************************
 * System Name : 
 * File Name   : SLOT.sv
 * Contents    :
 * Memo        :
 **************************************************************************/

module SLOT(
  input  logic CK,          //システムクロック
  input  logic RB,          //リセット信号
  input  logic PSW,         //プッシュスイッチ
  output logic [7:0] LED,   //LED
  output logic [7:0] SEG_0, //７セグA出力パターン
  output logic [7:0] SEG_1, //７セグB出力パターン
  output logic BZ
);

logic en_buz;

SLOT_CORE core1(
  .CK(CK),        //システムクロック
  .RB(RB),        //リセット信号
  .PSW(PSW),      //プッシュスイッチ
  .LED(LED),      //LED
  .SEG_0(SEG_0),  //７セグA出力パターン
  .SEG_1(SEG_1),  //７セグB出力パターン
  .EN_BUZZER(en_buz)
);

BUZZER buz1(
  .CK(CK),
  .RB(RB),
  .EN(en_buz),
  .OUT(BZ)
);


endmodule

