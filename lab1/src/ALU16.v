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
    output [15:0] S
    );
	 
	 reg [15:0] AND, OR, ADD, SUB;
	 
	 and(AND,A,B);
	 or(OR,A,B);
	 

endmodule
