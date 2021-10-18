`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:15:19 10/18/2021
// Design Name:   clock_divider
// Module Name:   /home/ise/git152b/lab2/lab2/clk_dv_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_dv_tb;

	reg clk;
	
	// Outputs
	wire clk_dv;

	// Instantiate the Unit Under Test (UUT)
	clock_divider uut (
		.clk(clk),
		.clk_dv(clk_dv)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		repeat (1000) #10 clk = ~clk;

	end
      
endmodule

