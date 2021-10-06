`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:33:55 10/06/2021
// Design Name:   slte
// Module Name:   C:/Users/Jacob/OneDrive - personalmicrosoftsoftware.ucla.edu/Docs/4th Year/1st Quarter/CS 152B/lab0/slte_tb.v
// Project Name:  lab0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: slte
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module slte_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;

	// Outputs
	wire Result;

	// Instantiate the Unit Under Test (UUT)
	slte uut (
		.A(A), 
		.B(B), 
		.Result(Result)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		A = 50;
		#50;
		A = -50;
		#50
		A = 100;
		B = 100;
		#50;
		B = 200;
		#50;
		A = 200;
		#50;
		B = 25;
		#50;
		A = 4000;
		#50;
		B = 4001;
		#50;
		A = 4001;
		#50;
		A = -2000;
		B = -2000;
		#50
		A = -1000;
		#50;
		B = -200;
        
		// Add stimulus here

	end
      
endmodule

