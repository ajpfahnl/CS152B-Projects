`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:06 10/01/2021 
// Design Name: 
// Module Name:    regfile 
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
module regfile(
    input [4:0] Ra,
    input [4:0] Rb,
    input [4:0] Rw,
    input WrEn,
    input [15:0] busW,
    input clk,
    input rst,
    output reg [15:0] busA,
    output reg [15:0] busB
    );
	 
	 reg [15:0] registers [31:0];
	 
	 always@ (posedge clk) begin
		if (WrEn) begin
			registers[Rw] = busW;
		end
		busA = registers[Ra];
		busB = registers[Rb];
	 end
	 
	 // resetting on falling edge
	 reg [4:0] i;
	 always@ (negedge clk) begin
		if (rst) begin
			for(i=0; i<16; i=i+5'b1) begin
				registers[i] = 0;
			end
		end
	 end

endmodule
