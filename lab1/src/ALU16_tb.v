`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:42:49 10/04/2021
// Design Name:   ALU16
// Module Name:   C:/Users/Jacob/OneDrive - personalmicrosoftsoftware.ucla.edu/Docs/4th Year/1st Quarter/CS 152B/lab0/ALU16_tb.v
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

module ALU16_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [3:0] ALUCtrl;

	// Outputs
	wire Overflow;
	wire Zero;
	wire [15:0] S;
	wire [15:0] AND;
	wire [15:0] OR;
	wire [15:0] ADD;
	wire [15:0] SUB;
	wire [15:0] ANOT;
	wire [15:0] BNOT;
	wire [15:0] INC;
	wire [15:0] DEC;

	// Instantiate the Unit Under Test (UUT)
	ALU16 uut (
		.A(A), 
		.B(B), 
		.ALUCtrl(ALUCtrl), 
		.Overflow(Overflow), 
		.Zero(Zero), 
		.S(S), 
		.AND(AND), 
		.OR(OR), 
		.ADD(ADD), 
		.SUB(SUB), 
		.ANOT(ANOT), 
		.BNOT(BNOT), 
		.INC(INC), 
		.DEC(DEC)
	);

	integer i,j;
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		ALUCtrl = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		for(i = -10; i < 10; i = i +1) begin
			A = A + 16'b1;
			for(j = -10; j < 10; j = j + 1) begin
				B = B + 16'b1;
				#10;
			end
		end
        
		// Add stimulus here

	end
      
endmodule

