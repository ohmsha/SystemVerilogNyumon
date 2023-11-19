/*************************************************************************
 * System Name : 
 * File Name   : SLOT_CORE.sv
 * Contents    :
 * Memo        :
 **************************************************************************/

module SLOT_CORE(
  input  logic CK,              //システムクロック
  input  logic RB,              //リセット信号
  input  logic PSW,             //プッシュスイッチ
  output logic [7:0] LED,       //LED
  output logic [7:0] SEG_0,     //７セグA出力パターン
  output logic [7:0] SEG_1,     //７セグB出力パターン
  output logic EN_BUZZER
);

  logic  [ 3:0] slot_left;      //左側のスロットカウンタ
  logic         slot_left_dot;
  logic  [ 3:0] slot_right;     //右側のスロットカウンタ
  logic         slot_right_dot;
  logic  [24:0] psw_cnt;        //クロックのカウンタ
  logic  [24:0] slot_cnt;       //クロックのカウンタ
  logic  [ 2:0] state;          //状態レジスタ


//--- 固定値 #defineと同じ ----------------------------------------------------------

// 実機確認用
  localparam PSW_COUNT  = 25'd2000000  - 25'd1;
  localparam SLOT_COUNT = 25'd4000000  - 25'd1;

// シミュレーション用
//  localparam SLOT_COUNT = 25'd4;
//  localparam PSW_COUNT  = 25'd0;

  localparam STATE_LEFT  = 3'd0; // SEG1, SEG0 両方変化。
  localparam STATE_PSW1  = 3'd1; // PSWが1'b1に戻るのを待つ
  localparam STATE_RIGHT = 3'd2; // SEG0 のみ変化。
  localparam STATE_PSW2  = 3'd3; // PSWが1'b1に戻るのを待つ
  localparam STATE_BEEP  = 3'd4; // あたり/はずれ 判定。
  localparam STATE_PSW3  = 3'd5; // PSWが1'b1に戻るのを待つ


//--- logic  --------------------------------------------------------------------

// ブザーを鳴動させる条件を計算
always_comb begin
  if((state==STATE_BEEP) && (slot_left == slot_right)) EN_BUZZER = 1'b1; 
  else EN_BUZZER = 1'b0;
end

// 内部状態に応じてLEDの出力を変更
always_comb begin
  case(state)
    STATE_LEFT  : LED = ~{EN_BUZZER, 7'h01};
    STATE_PSW1  : LED = ~{EN_BUZZER, 7'h02};
    STATE_RIGHT : LED = ~{EN_BUZZER, 7'h04};
    STATE_PSW2  : LED = ~{EN_BUZZER, 7'h08};
    STATE_BEEP  : LED = ~{EN_BUZZER, 7'h10};
    STATE_PSW3  : LED = ~{EN_BUZZER, 7'h20};
    default     : LED =  8'h00;
  endcase
end

// 左の桁を揃えている時に、7セグメントLEDのDPセグメントを光らせる
always_comb begin
  slot_left_dot  = (state == STATE_LEFT) ? 1'b1 : 1'b0;
end

// 右の桁を揃えている時に、7セグメントLEDのDPセグメントを光らせる
always_comb begin
  slot_right_dot = (state == STATE_RIGHT) ? 1'b1 : 1'b0;
end

// 内部状態の更新
always_ff @(posedge CK or negedge RB) begin
  if(RB==1'b0) begin
    state <= STATE_LEFT;
  end
  else if(psw_cnt == PSW_COUNT) begin
    case(state)
      STATE_LEFT: begin
        if(PSW==1'b0) begin
          state <= STATE_PSW1;
        end
      end

      STATE_PSW1: begin
        if(PSW==1'b1) begin
          state <= STATE_RIGHT;
        end
      end

      STATE_RIGHT: begin
        if(PSW==1'b0) begin
          state <= STATE_PSW2;
        end
      end

      STATE_PSW2: begin
        if(PSW==1'b1) begin
          state <= STATE_BEEP;
        end
      end

      STATE_BEEP: begin
        if(PSW==1'b0) begin
          state <= STATE_PSW3;
        end
      end

      STATE_PSW3: begin
        if(PSW==1'b1) begin
          state <= STATE_LEFT;
        end
      end

    endcase
  end  
end

// チャタリングによるPSWの誤入力を防ぐためのカウンタ
// 81行目で使用。サンプリング速度を落とす。
always_ff @(posedge CK or negedge RB) begin
  if(RB==1'b0) begin
    psw_cnt <= 0;
  end
  else if(psw_cnt == PSW_COUNT) begin
    psw_cnt <= 0;
  end
  else begin
    psw_cnt <= psw_cnt + 25'd1;
  end
end

// スロットの表示更新時間（次の数字が表示されるまでの時間）
always_ff @(posedge CK or negedge RB) begin
  if(RB==1'b0) begin
    slot_cnt <= 0;
  end
  else if(slot_cnt == SLOT_COUNT) begin
    slot_cnt <= 0;
  end
  else begin
    slot_cnt <= slot_cnt + 25'd1;
  end
end

// 左の桁に表示する数字
always_ff @(posedge CK or negedge RB) begin
  if(RB==1'b0) begin
    slot_left <= 4'd0;
  end
  else if(slot_cnt == SLOT_COUNT) begin
    case(state)
      STATE_LEFT: begin
        slot_left <= slot_left + 4'd1;
      end
    endcase
  end  
end

// 右の桁に表示する数字
always_ff @(posedge CK or negedge RB) begin
  if(RB==1'b0) begin
    slot_right <= 4'd0;
  end
  else if(slot_cnt == SLOT_COUNT) begin
    case(state)
      STATE_LEFT: begin
        slot_right <= slot_right + 4'd1;
      end
      STATE_PSW1: begin
        slot_right <= slot_right + 4'd1;
      end
      STATE_RIGHT: begin
        slot_right <= slot_right + 4'd1;
      end
    endcase
  end  
end

// 左の桁の7セグメントLEDに入力する信号を計算
seg_convert2 sc1(               //数値を7セグの表示パターンに変更する
  .SEG_IN({1'b0,slot_left}),    //d_cntの1桁目を接続する
  .SEG_EN(1'b1),                //enable信号(この回路では常にＯＮ)
  .DOT(slot_left_dot),          //右下のドットの制御
  .SEG_OUT(SEG_1)               //SEG_0に表示するパターン
);

// 右の桁の7セグメントLEDに入力する信号を計算
seg_convert2 sc0(
  .SEG_IN({1'b0,slot_right}),  //d_cntの2桁目を接続する
  .SEG_EN(1'b1),               //enable信号(この回路では常にＯＮ)
  .DOT(slot_right_dot),        //右下のドットの制御
  .SEG_OUT(SEG_0)              //SEG_1に表示するパターン
);

endmodule

