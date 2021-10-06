`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:51 10/01/2021 
// Design Name: 
// Module Name:    ALU16 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU16(
    input [15:0] A,
    input [15:0] B,
    input [3:0] ALUCtrl,
    output Overflow,
    output Zero,
    output [15:0] S,
	 output [15:0] AND, OR, ADD, SUB, ANOT, BNOT,
	 output [15:0] INC, DEC,
    output SLT
    );
	 
	 wire CoutAdd, CoutSub,CoutInc, CoutDec;
	 
	 
	 
	 bitwise_and and16(A,B,AND);
	 bitwise_or or16(A,B,OR);
	 invert anot16(A,ANOT);
	 invert bnot16(B,BNOT);
	 FA16 add16(A,B,0,CoutAdd,ADD);
	 FA16 sub16(A,BNOT,1,CoutSub,SUB);
	 FA16 inc16(A,16'd1,0,CoutInc, INC);
	 FA16 dec(A, -16'd1,0, CoutDec, DEC);
	 slte slte16(A,B,SLT);
	 
	 

endmodule

