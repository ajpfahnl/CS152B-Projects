`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:13 09/29/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input A,
    input B,
    input Cin,
	 input Binvert,
	 input [1:0] Operation,
    output Result,
    output Cout
    );
	 
	 
	 wire bMux, abAnd, abOr, abSum, notB;
	 
	 not(notB,B);
	 mux2x1 muxB(B,notB,Binvert, bMux);
	 and(abAnd,A,bMux);
	 or(abOr,A,bMux);
	 FA adder(A,bMux,Cin,abSum,Cout);
	 mux3x1 muxRes(abAnd,abOr,abSum,Operation[0],Operation[1], Result);
	 
	 
endmodule


module FA(
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

module mux2x1(in0, in1, s, out);
	output out;
	input in0, in1, s;
	wire w1, w2, w3;
	and(w1, in1, s);
	not(w2, s);
	and(w3, in0, w2);
	or(out, w1, w3);
endmodule

module mux3x1(in0, in1, in2, s0, s1, out);
	output out;
	input in0, in1, in2, s0, s1;
	wire w;
	mux2x1 m2a(in0, in1, s0, w);
	mux2x1 m2b(w, in2, s1, out);
endmodule



