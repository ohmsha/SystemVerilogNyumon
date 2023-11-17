`timescale 1ns/1ns //シミュレーションの時間単位を指定
module test_flipflop;
   logic D, CK, Q;
   always #50 //クロックの定義
     begin
        CK=~CK;
     end
   initial
     begin
        $monitor("t=",$realtime,":CK=",CK,",D=",D,",Q=",Q);
        //入出力の観測
        D=0;CK=0;//入力の初期値設定
        #100 D=1; //100 ns
        #100 D=0;
        #100 $finish; //シミュレーションを終了
     end
   flipflop FF(.*); // .*で同じ信号名を接続
endmodule
