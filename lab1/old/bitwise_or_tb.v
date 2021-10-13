`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:39:12 10/04/2021
// Design Name:   bitwise_or
// Module Name:   /home/ise/xilinx_shared/152B/lab1-16alu/bitwise_or_tb.v
// Project Name:  lab1-16alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bitwise_or
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bitwise_or_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;

	// Outputs
	wire [15:0] Y;

	// Instantiate the Unit Under Test (UUT)
	bitwise_or uut (
		.A(A), 
		.B(B), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
		end
        
		// Add stimulus here
		always #20 A = A + 1'b1;
		always #10 B = B + 1'b1;
		always @ (A or B);
      
endmodule

