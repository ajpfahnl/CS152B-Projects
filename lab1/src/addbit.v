`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:43:30 10/08/2021 
// Design Name: 
// Module Name:    addbit 
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
module addbit(a,b,ci,sum,co);
	input a;
	input b;
	input ci;
	output sum;
	output co;
	
	wire x,y,z,v;
	
	xor(x,a,b);
	xor(sum,x,ci);
	and(y,a,b);
	and(z,b,ci);
	and(v,a,ci);
	or(co,y,z,v);

endmodule
