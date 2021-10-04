`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:39:03 09/29/2021
// Design Name:   FA
// Module Name:   C:/Users/Jacob/OneDrive - personalmicrosoftsoftware.ucla.edu/Docs/4th Year/1st Quarter/CS 152B/lab0/FA_tb.v
// Project Name:  lab0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FA_tb;

	// Inputs
	reg A;
	reg B;
	reg Cin;

	// Outputs
	wire Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	FA uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;
		
		#100

		A = 1;
		// Wait 100 ns for global reset to finish
		#100;
		
		B = 1;
        
		#100

		B = 0;
		Cin = 1;
		
		#100
		
		B = 1;
		// Add stimulus here

	end
      
endmodule

