`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:44 10/06/2021 
// Design Name: 
// Module Name:    slte 
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
module slte(
    input [15:0] A,
    input [15:0] B,
    output Result
    );
	 
	 wire Cout, xnorREs;
	 wire[15:0] sum, BNOT; 
	 
	 invert notB(B,BNOT);
	 FA16 sub(A,BNOT,16'd1,Cout,sum);
	 xnor(xnorRes,sum);
	 or(Result,sum[15],xnorRes);

endmodule
