`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:29 10/04/2021 
// Design Name: 
// Module Name:    FA16 
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
module FAdd(
	input A, 
	input B,
	input Cin,
	output Sum,
	output Cout
	);
	
	wire x,y,z,v;
	
	xor(x,A,B);
	xor(Sum,x,Cin);
	and(y,A,B);
	and(z,B,Cin);
	and(v,A,Cin);
	or(Cout,y,z,v);
endmodule

module FA16(A,B,Cin,Cout,S);
	input Cin;
	input [15:0] A,B;
	output Cout;
	output [15:0] S;
	
	wire c0,c1,c2,c3,c4,c5,c6,c7,c8;
	wire c9,c10,c11,c12,c13,c14;
	
	
	FAdd fa0(A[0],B[0],Cin,S[0],c0);
	FAdd fa1(A[1],B[1],c0,S[1],c1);
	FAdd fa2(A[2],B[2],c1,S[2],c2);
	FAdd fa3(A[3],B[3],c2,S[3],c3);
	FAdd fa4(A[4],B[4],c3,S[4],c4);
	FAdd fa5(A[5],B[5],c4,S[5],c5);
	FAdd fa6(A[6],B[6],c5,S[6],c6);
	FAdd fa7(A[7],B[7],c6,S[7],c7);
	FAdd fa8(A[8],B[8],c7,S[8],c8);
	FAdd fa9(A[9],B[9],c8,S[9],c9);
	FAdd fa10(A[10],B[10],c9,S[10],c10);
	FAdd fa11(A[11],B[11],c10,S[11],c11);
	FAdd fa12(A[12],B[12],c11,S[12],c12);
	FAdd fa13(A[13],B[13],c12,S[13],c13);
	FAdd fa14(A[14],B[14],c13,S[14],c14);
	FAdd fa15(A[15],B[15],c14,S[15],Cout);
	
endmodule
