`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:19:02 10/13/2021
// Design Name:   ALU16
// Module Name:   /home/ise/git152b/lab1/shifts_invert_tb.v
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

module shifts_invert_tb;

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
        
		//Invert 
		ALUCtrl = 4'b0110;
		A = -16'd32768;
		repeat(8) #10 A = A + 16'd8192; 
		
		ALUCtrl = 0;
		A = 0;
		#100;
		
		//Left Arithmetic Shift
		ALUCtrl = 4'b1100;
		A = -16'd32768;
		repeat(8) begin
			B = 16'd1;
			repeat(6) #10 B = B + 16'd3;
			A = A + 16'd8192;
		end
		A = 16'd32767;
		B = 16'd1;
		repeat(6) #10 B = B + 16'd3;
		
		ALUCtrl = 0;
		A = 0;
		B = 0;
		#100;
		
		//Right Arithmetic Shift 
		ALUCtrl = 4'b1110;
		A = -16'd32768;
		repeat(8) begin
			B = 16'd1;
			repeat(6) #10 B = B + 16'd3;
			A = A + 16'd8192;
		end
		A = 16'd32767;
		B = 16'd1;
		repeat(6) #10 B = B + 16'd3;
		
		ALUCtrl = 0;
		A = 0;
		B = 0;
		#100;
		
		//Logical Shift Left
		ALUCtrl = 4'b1000;
		A = -16'd32768;
		repeat(8) begin
			B = 16'd1;
			repeat(6) #10 B = B + 16'd3;
			A = A + 16'd8192;
		end
		A = 16'd32767;
		B = 16'd1;
		repeat(6) #10 B = B + 16'd3;
		
		ALUCtrl = 0;
		A = 0;
		B = 0;
		#100;
		
		//Logical Shift Right
		ALUCtrl = 4'b1010;
		A = -16'd32768;
		repeat(8) begin
			B = 16'd1;
			repeat(6) #10 B = B + 16'd3;
			A = A + 16'd8192;
		end
		A = 16'd32767;
		B = 16'd1;
		repeat(6) #10 B = B + 16'd3;
		
		ALUCtrl = 0;
		A = 0;
		B = 0;
		#100 $finish;

	end
      
endmodule

