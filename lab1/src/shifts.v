`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:55 10/04/2021 
// Design Name: 
// Module Name:    shifts 
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
module left_logic_shift(A, Y);
input [15:0] A;
output wire [15:0] Y;
assign Y[0] = 0;
assign Y[1] = A[0];
assign Y[2] = A[1];
assign Y[3] = A[2];
assign Y[4] = A[3];
assign Y[5] = A[4];
assign Y[6] = A[5];
assign Y[7] = A[6];
assign Y[8] = A[7];
assign Y[9] = A[8];
assign Y[10] = A[9];
assign Y[11] = A[10];
assign Y[12] = A[11];
assign Y[13] = A[12];
assign Y[14] = A[13];
assign Y[15] = A[14];
endmodule
		
module right_logic_shift(A, Y);
input [15:0] A;
output wire [15:0] Y;
assign Y[0] = A[1];
assign Y[1] = A[2];
assign Y[2] = A[3];
assign Y[3] = A[4];
assign Y[4] = A[5];
assign Y[5] = A[6];
assign Y[6] = A[7];
assign Y[7] = A[8];
assign Y[8] = A[9];
assign Y[9] = A[10];
assign Y[10] = A[11];
assign Y[11] = A[12];
assign Y[12] = A[13];
assign Y[13] = A[14];
assign Y[14] = A[15];
assign Y[15] = 0;
endmodule

module left_arith_shift(A, Y);
input [15:0] A;
output wire [15:0] Y;
assign Y[0] = 0;
assign Y[1] = A[0];
assign Y[2] = A[1];
assign Y[3] = A[2];
assign Y[4] = A[3];
assign Y[5] = A[4];
assign Y[6] = A[5];
assign Y[7] = A[6];
assign Y[8] = A[7];
assign Y[9] = A[8];
assign Y[10] = A[9];
assign Y[11] = A[10];
assign Y[12] = A[11];
assign Y[13] = A[12];
assign Y[14] = A[13];
assign Y[15] = A[14];
endmodule

module right_arith_shift(A, Y);
input [15:0] A;
output wire [15:0] Y;
assign Y[0] = A[1];
assign Y[1] = A[2];
assign Y[2] = A[3];
assign Y[3] = A[4];
assign Y[4] = A[5];
assign Y[5] = A[6];
assign Y[6] = A[7];
assign Y[7] = A[8];
assign Y[8] = A[9];
assign Y[9] = A[10];
assign Y[10] = A[11];
assign Y[11] = A[12];
assign Y[12] = A[13];
assign Y[13] = A[14];
assign Y[14] = A[15];
assign Y[15] = A[15];
endmodule
