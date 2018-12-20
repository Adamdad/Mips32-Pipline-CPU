`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 23:14:53
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input wire  [5:0]   ALUop,//58��ָ�������Ҫ6Ϊopλ
    input wire  [31:0]  ALUa,
    input wire  [31:0]  ALUb,
    output wire [31:0]  ALUresult,
    output wire         of
    );
	
always@(*)
begin
	case(ALUop)��
		6'b000000:ALUresult = ALUa+ALUb; 	//add
		6'b000001:ALUresult = ALUa+ALUb; 	//addu
		6'b000010:ALUresult = ALUa+ALUb; 	//addu
		6'b000011:ALUresult = ALUa+ALUb; 	//addiu
		6'b000100:ALUresult = ALUa-ALUb;	//sub
		6'b000101:ALUresult = ALUa-ALUb;	//subu
		6'b000110:ALUresult = ALUa*ALUb;	//mult
		6'b000111:ALUresult = ALUa*ALUb;	//multu
		6'b001000:ALUresult = ALUa/ALUb;	//div
		6'b001001:ALUresult = ALUa/ALUb;	//divu
		
		6'b001010:ALUresult = ALUa&ALUb;	//and
		6'b001011:ALUresult = ALUa&ALUb;	//andi
		6'b001100:ALUresult = ALUa|ALUb;	//or
		6'b001101:ALUresult = ALUa|ALUb;	//ori
		6'b001110:ALUresult = ALUa^ALUb;	//xor
		6'b001111:ALUresult = ALUa^ALUb;	//xori
		6'b010000:ALUresult = ~(ALUa|ALUb);	//nor
		6'b010001:ALUresult = ALUa<<16;		//lui:��һ��16λ�����������뵽�Ĵ����ĸ�16λ����16λ����
		
		6'b010010:ALUresult = ALUb<<ALUa;	//sll:�߼�����
		6'b010011:ALUresult = ALUb>>ALUa;	//srl:�߼�����
		6'b010100:ALUresult = ($signed(ALUb))>>>ALUa;	//sra:��������
		6'b010101:ALUresult = ALUb<<ALUa;	//sllv:�ɱ��߼�����
		6'b010110:ALUresult = ALUb>>ALUa;	//srlv:�ɱ��߼�����
		6'b010111:ALUresult = ($signed(ALUb))>>> ALUa;//srav:�ɱ���������
		
		6'b011000:ALUresult = ALUa+ALUb;	//lw:�Ӵ洢���ж�ȡһ���ֵ����ݵ��Ĵ�����
		6'b011001:ALUresult = ALUa+ALUb;	//sw:��һ���ֵ����ݴӼĴ����洢���洢����
		6'b011010:ALUresult = ALUa+ALUb;	//lb:�Ӵ洢���ж�ȡһ���ֽڵ����ݵ��Ĵ�����
		6'b011011:ALUresult = ALUa+ALUb;	//lbu
		6'b011100:ALUresult = ALUa+ALUb;	//lh:�Ӵ洢���ж�ȡ����ֵ����ݵ��Ĵ�����
		6'b011101:ALUresult = ALUa+ALUb;	//lhu
		6'b011110:ALUresult = ALUa+ALUb;	//sb:��һ���ֽڵ����ݴӼĴ����洢���洢����
		6'b011111:ALUresult = ALUa+ALUb;	//sh:�Ѱ���ֽڵ����ݴӼĴ����洢���洢����
		
		//mfhi:��ֵ��������Ĵ���hi
		//mflo:��ֵ��������Ĵ���lo
		//mthi:��ͨ�üĴ�����ֵ�������˷���Ԫ�ڲ��Ĵ���hi
		//mtlo:��ͨ�üĴ�����ֵ�������˷���Ԫ�ڲ��Ĵ���lo
		
		6'b100100:ALUresult = ALUa-ALUb;	//beq:����ת��ָ����Ĵ������������ʱת�Ʒ���
		6'b100101:ALUresult = ALUa-ALUb;	//bne:����ת��ָ��������Ĵ��������ݲ���ʱת�Ʒ���
		6'b100110:ALUresult = ALUa-ALUb;	//slt:�з������Ƚ�
		6'b101000:ALUresult = ALUa-ALUb;	//slti:�������Ƚ�
		6'b101001:ALUresult = ALUa-ALUb;	//sltu:�޷������Ƚ�
		6'b101010:ALUresult = ALUa-ALUb;	//sltiu
		6'b101011:ALUresult = ALUa-ALUb;	//bgez s��label:if (s>=0) goto label
		6'b101100:ALUresult = ALUa-ALUb;	//bgtz s��label:if (s>0) goto label
		6'b101101:ALUresult = ALUa-ALUb;	//blez s��label:if (s<=0) goto label
		6'b101110:ALUresult = ALUa-ALUb;	//bltz s��label:if (s<0) goto label
		6'b101111:ALUresult = ALUa-ALUb;	//bgezal s��label:if (s>=0)���� label()
		6'b110000:ALUresult = ALUa-ALUb;	//bltzal s��label:if (s<0)���� label()
		
		//j
		//jr
		//jal:�ӳ������
		//jalr:
		
		//break
		//syscall
		
		//eret
		//mfc0
		//mtc0
		
		//nop
		default:ALUresult = 32'b000000;

endmodule
