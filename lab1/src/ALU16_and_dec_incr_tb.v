`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:42:15 10/02/2021
// Design Name:   ALU16
// Module Name:   /home/ise/Desktop/CS152B/lab1/ALU16_and_dec_incr_tb.v
// Project Name:  lab1
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

module ALU16_and_dec_incr_tb;

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
		
		// AND Case 1
		A = 16'b10;
		B = 16'b10;
		ALUCtrl = 4'b0011;
		#20;
		
		// AND Case 2
		A = 16'b1111_1111_1111_1111;
		B = 16'b1111_1111_1111_1111;
		#20;
		
		// AND Case 3
		A = 16'd82;
		B = 16'b1111_1111_1111_1111;
		#20;
		
		// AND Case 4: set 0
		A = 16'b0;
		B = 16'b0;
		#20;
		
		// DECR Case 1
		A = 16'b1111_1111_1111_1111;
		B = 16'd23;
		ALUCtrl = 4'b0100;
		#20;
		
		// DECR Case 2: smallest, overflow
		A = 16'b1000_0000_0000_0000;
		B = 16'd91;
		#20;
		
		// DECR Case 3
		A = -16'd23;
		B = 16'd14;
		#20;
		
		// DECR Case 4: largest
		A = 16'b0111_1111_1111_1111;
		B = 16'd15;
		#20
		
		// DECR Case 5: 1, set zero
		A = 16'b1;
		B = 16'd16;
		#20;
		
		// INCR Case 1
		A = 16'b1111_1111_1111_1111;
		B = 16'd23;
		ALUCtrl = 4'b0101;
		#20;
		
		// INCR Case 2: smallest
		A = 16'b1000_0000_0000_0000;
		B = 16'd91;
		#20;
		
		// INCR Case 3
		A = -16'd23;
		B = 16'd14;
		#20;
		
		// DECR Case 4: largest, overflow
		A = 16'b0111_1111_1111_1111;
		B = 16'd15;
		
		#20 $finish;
		

	end
      
endmodule

