`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:35:55 10/08/2021
// Design Name:   ALU16
// Module Name:   C:/Users/Jacob/OneDrive - personalmicrosoftsoftware.ucla.edu/Docs/4th Year/1st Quarter/CS 152B/lab0/ALU16_sub_add_or_TB.v
// Project Name:  lab0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU16_sub_add_or_TB;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [3:0] ALUCtrl;

	// Outputs
	wire Overflow;
	wire Zero;
	wire [15:0] S;

	// Instantiate the Unit Under Test (UUT)
	ALU16 uut (
		.A(A), 
		.B(B), 
		.ALUCtrl(ALUCtrl), 
		.Overflow(Overflow), 
		.Zero(Zero), 
		.S(S)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		ALUCtrl = 0;

		// Wait 100 ns for global reset to finish
		
		#100;
		
		//SUB
		ALUCtrl = 4'b0000;
		A = 1;
		#50;
		B = 1;
		#50;
		B = 2;
		#50
		A = 100;
		#50;
		B = 200;
		#50;
		A = 200;
		#50
		A = -20000;
		#50
		B = -50;
		#50;
		B =  -21000;
		#50;
		A = -21000;
		#50;
		A = 0;
		#50;
		A = 1000;
		#50;
		
		A = 16'b1000000000000000;
		B = 1;
		#50;
		
		B = 10000;
		#50
		B = 16'b1000000000000000;
		# 50;
		B = -500;
		#50;
		B = 0;
		#50;
		A = 16'b0111111111111111;
		#50;
		B = -1;
		#50;
		B = -100;
		#50;
		B = 2000;
		#50;
		B = 16'b0111111111111111;
		#50;
		A = -10;
		
		
		//ADD
		ALUCtrl = 4'b0001;
		A = 0;
		B = 0;
		#50
		A = 1;
		#50;
		B = 1;
		#50;
		B = 2;
		#50
		A = 100;
		#50;
		B = 200;
		#50;
		A = 200;
		#50
		A = -20000;
		#50
		B = -50;
		#50;
		B =  -21000;
		#50;
		A = -21000;
		#50;
		A = 0;
		#50;
		A = 1000;
		#50;
		
		A = 16'b1000000000000000;
		B = 1;
		#50;
		
		B = 10000;
		#50
		B = 16'b1000000000000000;
		# 50;
		B = -500;
		#50;
		B = 0;
		#50;
		A = 16'b0111111111111111;
		#50;
		B = -1;
		#50;
		B = -100;
		#50;
		B = 2000;
		#50;
		B = 16'b0111111111111111;
		#50;
		A = -10;
		
		
		
		//OR
		ALUCtrl = 4'b0010;
		A = 0;
		B = 0;
		#50
		A = 16'b0101010101010101;
		#50;
		B = 16'b1010101010101010;
		#50;
		A = 16'b0000000011111111;
		B = 0;
		#50;
		B = 16'b0000000011111111;
		#50;
		A = 16'b0111111111111111;
		#50;
		B = 16'b1000000000000000;
		#50;
		A = 16'b1100101010010101;
		B = 16'b0010100101001010;
		#50;
		A = 16'b1111000100100111;
		B = 16'b0010001111001110;
		#50
		A = 16'b0101110001110010;
		B = 16'b0000111111110000;
		#50
		A = 16'b1111100000000000;
		B = 16'b0011001100110011;
		
		
		
		
		
		
        
		// Add stimulus here

	end
      
endmodule

