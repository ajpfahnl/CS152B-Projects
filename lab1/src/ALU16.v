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
module CalcZero (
  S,
  Zero
);
  input [15:0] S;
  output Zero;
  
  wire [15:0] temp;
  or(temp[0], S[0], S[1]);
  or(temp[1], temp[0], S[2]);
  or(temp[2], temp[1], S[3]);
  or(temp[3], temp[2], S[4]);
  or(temp[4], temp[3], S[5]);
  or(temp[5], temp[4], S[6]);
  or(temp[6], temp[5], S[7]);
  or(temp[7], temp[6], S[8]);
  or(temp[8], temp[7], S[9]);
  or(temp[9], temp[8], S[10]);
  or(temp[10], temp[9], S[11]);
  or(temp[11], temp[10], S[12]);
  or(temp[12], temp[11], S[13]);
  or(temp[13], temp[12], S[14]);
  or(temp[14], temp[13], S[15]);
  not(Zero, temp[14]);
endmodule

module ALU16(
    input [15:0] A,
    input [15:0] B,
    input [3:0] ALUCtrl,
    output Overflow,
    output Zero,
    output [15:0] S
    );
	 
	 wire [15:0] AND, OR, ADD, SUB, ANOT, BNOT, AINV;
	 wire [15:0] INC, DEC, LLS, RLS, LAS, RAS, SLT;
	 wire CoutAdd, CoutSub,CoutInc, CoutDec, CoutInv, LLS_OF, RLS_OF, LAS_OF, RAS_OF;
	 
	 
	 
	 bitwise_and and16(A,B,AND);
	 bitwise_or or16(A,B,OR);
	 invert anot16(A,ANOT);
	 invert bnot16(B,BNOT);
	 //invert inv16(A, AINV);
	 FA16 add16(A,B,0,CoutAdd,ADD);
	 FA16 sub16(A,BNOT,1,CoutSub,SUB);
	 FA16 inc16(A,16'd1,0,CoutInc, INC);
	 FA16 dec(A, -16'd1,0, CoutDec, DEC);
	 FA16 inv16(ANOT, 1, 0, CoutInv, AINV);
	
	 left_logic_shift lls(A, LLS, LLS_OF);
	 right_logic_shift rls(A, RLS, RLS_OF);
  	 left_arith_shift las(A, LAS, LAS_OF);
  	 right_arith_shift ras(A, RAS, RAS_OF);
	
	 slte slte16(A,B,SLT);
	
	 // mux all the operations
	m121 m1(S, SUB, ADD, OR, AND, DEC, INC, AINV, 0, LLS, SLT, RLS, 0, LAS, 0, RAS, 0, ALUCtrl[0], ALUCtrl[1], ALUCtrl[2], ALUCtrl[3]);
	
	// mux overflow outputs, hardcode zeros for operations with no overflow
	m121 m2(Overflow, CoutSub, CoutAdd, 0, 0, CoutDec, CoutInc, 0, 0, LLS_OF, 0, RLS_OF, 0, LAS_OF, 0, RAS_OF, 0, ALUCtrl[0], ALUCtrl[1], ALUCtrl[2], ALUCtrl[3]); 
	
	// calculates zero
  	CalcZero c0(S, Zero); 

endmodule

