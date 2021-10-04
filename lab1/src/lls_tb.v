`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:49:35 10/04/2021
// Design Name:   left_logic_shift
// Module Name:   /home/ise/xilinx_shared/152B/shifts/lls_tb.v
// Project Name:  shifts
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: left_logic_shift
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lls_tb;

	// Inputs
	reg [15:0] A;

	// Outputs
	wire [15:0] Y;

	// Instantiate the Unit Under Test (UUT)
	left_logic_shift uut (
		.A(A), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #10 A = A + 1'b1;
	always @(A);
      
endmodule

