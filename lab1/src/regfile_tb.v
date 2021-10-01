`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:58:46 10/01/2021
// Design Name:   regfile
// Module Name:   /home/ise/Desktop/CS152B/lab1/regfile_tb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: regfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module regfile_tb;

	// Inputs
	reg [4:0] Ra;
	reg [4:0] Rb;
	reg [4:0] Rw;
	reg WrEn;
	reg [15:0] busW;
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] busA;
	wire [15:0] busB;

	// Instantiate the Unit Under Test (UUT)
	regfile uut (
		.Ra(Ra), 
		.Rb(Rb), 
		.Rw(Rw), 
		.WrEn(WrEn), 
		.busW(busW), 
		.clk(clk), 
		.rst(rst), 
		.busA(busA), 
		.busB(busB)
	);

	initial begin
		$monitor ("%g\t %b %b %b", $time, clk, rst, WrEn);
		// Initialize Inputs
		Ra = 0;
		Rb = 0;
		Rw = 0;
		WrEn = 0;
		busW = 0;
		clk = 1;
		rst = 0;

		// Wait for global reset to finish
		#10;
		rst = 1;
		#10 rst = 0;
        
		//Case 1: write then read from one
		busW = 16;
		Rw = 2;
		WrEn = 1;
		#10 Ra = 2;
		#20;
		
		// Case 2: write to two registers, read from both
		rst = 1;
		Ra = 0;
		Rb = 0;
		#10 rst = 0;
		busW = 15;
		Rw = 1;
		WrEn = 1;
		#10;
		busW = 20;
		Rw = 2;
		#10;
		Ra = 1;
		Rb = 2;
		#20;
		
		// Case 3: concurrent read and write
		rst = 1;
		Ra = 0;
		Rb = 0;
		WrEn = 1;
		#10 rst = 0;
		busW = 13;
		Rw = 3;
		Ra = 3;
		Rb = 3;
		#20;
		
		
		$finish;
	end
	
	
	always begin
		#5 clk = ~clk;
	end
      
endmodule

