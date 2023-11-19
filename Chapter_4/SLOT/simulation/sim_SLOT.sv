/*************************************************************************
 * System Name : 
 * File Name   : sim_SLOT.sv
 * Contents    :
 * Memo        : �e�X�g�x���`
 **************************************************************************/
`timescale 1ns/1ps

module sim_SLOT;
  logic	CK;			//�V�X�e���N���b�N
  logic	RB;				//���Z�b�g�M��
  logic	PSW;


//--- output -------------------------------------------------------------------
logic [7:0] SEG_A;				//7�Z�O�ւ̃p�^�[���o��
logic [7:0] SEG_B;				//7�Z�O�ւ̃p�^�[���o��
logic [7:0] LED;				  //�X�e�[�g�}�V���̓�����Ԃ�LED�ɕ\��

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
    PSW = 1'b1;		//�����l�ݒ�
		#(STEP*1);
		RB = 1'b0;
		#(STEP*3);
		RB = 1'b1;
		#(STEP*10);

    PSW = 1'b0;		//PSW��ON�ɂ��� (���̌��𑵂���)
		#(STEP*3);
    PSW = 1'b1;		//PSW��OFF�ɂ���i�X�C�b�`�����𗣂��j

		#(STEP*80);

    PSW = 1'b0;		//PSW��ON�ɂ��� (�E�̌��𑵂���)
		#(STEP*3);
    PSW = 1'b1;		//PSW��ON�ɂ���i�X�C�b�`�����𗣂��j

    // ������ɂȂ�����ALED[7] �� 1'b0 �ɂȂ�B

		#(STEP*10); 	//���Ԍo�߂��ώ@

    PSW = 1'b0;		//PSW��ON�ɂ��� (�X���b�g���ŏ��̏�Ԃ֖߂�)
		#(STEP*3);
    PSW = 1'b1;		//PSW��OFF�ɂ���i�X�C�b�`�����𗣂��j
		#(STEP*20);

		#100 $stop;
	end
endmodule

