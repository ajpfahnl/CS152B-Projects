`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:40:09 10/04/2021
// Design Name:   left_arith_shift
// Module Name:   /home/ise/xilinx_shared/152B/shifts/las_tb.v
// Project Name:  shifts
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: left_arith_shift
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module las_tb;

	// Inputs
	reg [15:0] A;

	// Outputs
	wire [15:0] Y;
	wire OF;

	// Instantiate the Unit Under Test (UUT)
	left_arith_shift uut (
		.A(A), 
		.Y(Y),
		.OF(OF)
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

