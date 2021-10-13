timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:19 10/01/2021 
// Design Name: 
// Module Name:    addition 
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

module bitwise_and(A, B, Y);
input [15:0] A, B;
output [15:0] Y;
and(Y[15], A[15], B[15]);
and(Y[14], A[14], B[14]);
and(Y[13], A[14], B[14]);
and(Y[12], A[12], B[12]);
and(Y[11], A[11], B[11]);
and(Y[10], A[10], B[10]);
and(Y[9], A[9], B[9]);
and(Y[8], A[8], B[8]);
and(Y[7], A[7], B[7]);
and(Y[6], A[6], B[6]);
and(Y[5], A[5], B[5]);
and(Y[4], A[4], B[4]);
and(Y[3], A[3], B[3]);
and(Y[2], A[2], B[2]);
and(Y[1], A[1], B[1]);
and(Y[0], A[0], B[0]);
endmodule

module bitwise_or(A, B, Y);
input [15:0] A, B;
output [15:0] Y;
or(Y[15], A[15], B[15]);
or(Y[14], A[14], B[14]);
or(Y[13], A[13], B[13]);
or(Y[12], A[12], B[12]);
or(Y[11], A[11], B[11]);
or(Y[10], A[10], B[10]);
or(Y[9], A[9], B[9]);
or(Y[8], A[8], B[8]);
or(Y[7], A[7], B[7]);
or(Y[6], A[6], B[6]);
or(Y[5], A[5], B[5]);
or(Y[4], A[4], B[4]);
or(Y[3], A[3], B[3]);
or(Y[2], A[2], B[2]);
or(Y[1], A[1], B[1]);
or(Y[0], A[0], B[0]);
endmodule

module invert(A, Y);
input [15:0] A;
output [15:0] Y;
not(Y[15], A[15]);
not(Y[14], A[14]);
not(Y[13], A[13]);
not(Y[12], A[12]);
not(Y[11], A[11]);
not(Y[10], A[10]);
not(Y[9], A[9]);
not(Y[8], A[8]);
not(Y[7], A[7]);
not(Y[6], A[6]);
not(Y[5], A[5]);
not(Y[4], A[4]);
not(Y[3], A[3]);
not(Y[2], A[2]);
not(Y[1], A[1]);
not(Y[0], A[0]);
endmodule