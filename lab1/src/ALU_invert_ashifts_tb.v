
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:28:47 10/11/2021
// Design Name:   ALU16
// Module Name:   /home/ise/git152b/lab1/src/ALU_invert_ashifts_tb.v
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

module ALU_invert_ashifts_tb;

	// Inputs
	reg signed [15:0] A;
	reg [15:0] B;
	reg [3:0] ALUCtrl;
	reg [15:0] i;

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
		i = 0;
		ALUCtrl = 0;

		// Wait 100 ns for global reset to finish
		#100; 
        
		//Invert
		// Add stimulus here
		ALUCtrl = 4'b0110;
		/*for(i = 0; i < 16'b1111111111111111; i = i + 4'b11111111)
			#10 A = A + i;*/
		A = 16'b1000000000000000;
		repeat(15)#10 A = A >>> 1;
		
		#100;
		 
		//Arithmetic left shift 
		ALUCtrl = 4'b1100;
		/*A = 0;
		for(i = 0; i < 16'b1111111111111111; i = i + 4'b11111111) 
			#10 A = A + i;*/
		A = 16'b1000000000000000;
		repeat(15)#10 A = A >>> 1;
		
		#100;
		
		//Arithmetic right shift 
		ALUCtrl = 4'b1110;
		/*A = 0;
		for(i = 0; i < 16'b1111111111111111; i = i + 4'b11111111)
			#10 A = A + i;*/
		A = 16'b1000000000000000;
		repeat(15)#10 A = A >>> 1; 
		
		$finish;
		end
      
endmodule

