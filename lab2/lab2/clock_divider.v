`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:28 10/18/2021 
// Design Name: 
// Module Name:    clock_divider 
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
module clock_divider(clk, clk_dv);
input clk;			
output reg clk_dv;
reg [15:0] counter = 0;
parameter dv = 15'd100;
always @(posedge clk) begin
	counter = counter + 1;
	if(counter == dv) 
		counter = 0;
	if(counter < dv/2) 
		clk_dv = 1;
	else 
		clk_dv = 0;
end
endmodule
