`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:41:12 10/04/2021
// Design Name:   invert
// Module Name:   /home/ise/xilinx_shared/152B/lab1-16alu/invert_tb.v
// Project Name:  lab1-16alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: invert
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module invert_tb;

	// Inputs
	reg [15:0] A;

	// Outputs
	wire [15:0] Y;

	// Instantiate the Unit Under Test (UUT)
	invert uut (
		.A(A), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;

		// Wait 100 ns for global reset to finish
		#100;
		end
        
		// Add stimulus here
	
	always #10 A = A + 1'b1;
	always @(A);
      
endmodule

