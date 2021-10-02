`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:44:05 10/04/2021
// Design Name:   FA16
// Module Name:   C:/Users/Jacob/OneDrive - personalmicrosoftsoftware.ucla.edu/Docs/4th Year/1st Quarter/CS 152B/lab0/FA16_tb.v
// Project Name:  lab0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FA16_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg Cin;

	// Outputs
	wire Cout;
	wire [15:0] S;

	// Instantiate the Unit Under Test (UUT)
	FA16 uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.Cout(Cout), 
		.S(S)
	);

	integer i,j;
	initial begin
		// Initialize Inputs
		A = -16'd100;
		B = -16'd100;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#50;
		
		// Case 1
		for(i=-100; i < 100; i=i+1) begin
			A = A + 20;
			
			for(j = -10; j < 10; j=j+1) begin
			B = B + 2;
			#10;
			end
		end
		
		// Case 2: -1 + 1
		#50;
		A = 16'b1111_1111_1111_1111;
		B = 16'b1;
		
		// Case 3: overflow addition
		#50;
		A = 16'b0111_1111_1111_1111;
		B = 16'b1;
		
		#50 $finish;

	end
      
endmodule

