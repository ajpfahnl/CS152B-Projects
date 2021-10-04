`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:39:30 10/01/2021
// Design Name:   ALU
// Module Name:   C:/Users/Jacob/OneDrive - personalmicrosoftsoftware.ucla.edu/Docs/4th Year/1st Quarter/CS 152B/lab0/ALU_tb.v
// Project Name:  lab0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg A;
	reg B;
	reg Cin;
	reg Binvert;
	reg [1:0] Operation;

	// Outputs
	wire Result;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.Binvert(Binvert), 
		.Operation(Operation), 
		.Result(Result), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;
		Binvert = 0;
		Operation = 0;

		// Wait 100 ns for global reset to finish
		
		
		//AND
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		B = 0;
		Cin = 1;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		A = 1;
		Cin = 0;
		#100;
		Cin = 1;
		#100;
		Binvert = 1;
		A = 0;
		B = 0;
		Cin = 0;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		B = 0;
		Cin = 1;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		A = 1;
		Cin = 0;
		#100;
		Cin = 1;
		#100;
		
		
		//OR
		Operation = 2'd1;
		A = 0;
		B = 0;
		Cin = 0;
		Binvert = 0;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		B = 0;
		Cin = 1;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		A = 1;
		Cin = 0;
		#100;
		Cin = 1;
		#100;
		Binvert = 1;
		A = 0;
		B = 0;
		Cin = 0;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		B = 0;
		Cin = 1;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		A = 1;
		Cin = 0;
		#100;
		Cin = 1;
		#100;
		
		//Add
		Operation = 2'd2;
		A = 0;
		B = 0;
		Cin = 0;
		Binvert = 0;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		B = 0;
		Cin = 1;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		A = 1;
		Cin = 0;
		#100;
		Cin = 1;
		#100;
		Binvert = 1;
		A = 0;
		B = 0;
		Cin = 0;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		B = 0;
		Cin = 1;
		#100;
		A = 1;
		#100;
		A = 0;
		B = 1;
		#100;
		A = 1;
		Cin = 0;
		#100;
		Cin = 1;
		#100;
		
		
		// Add stimulus here

	end
      
endmodule

