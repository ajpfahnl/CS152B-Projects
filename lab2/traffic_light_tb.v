`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:19:42 10/18/2021
// Design Name:   traffic_light
// Module Name:   C:/Users/Jacob/OneDrive - personalmicrosoftsoftware.ucla.edu/Docs/4th Year/1st Quarter/CS 152B/CS152B-Projects/lab2/traffic_light_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module traffic_light_tb;

	// Inputs
	reg clk;
	reg Sensor;
	reg walkButton;
	reg clk;
	reg rst;

	// Outputs
	wire walkLight;
	wire [1:0] mainLight;
	wire [1:0] sideLight;

	// Instantiate the Unit Under Test (UUT)
	traffic_light uut (
		.clk(clk), 
		.Sensor(Sensor), 
		.walkButton(walkButton), 
		.walkLight(walkLight), 
		.mainLight(mainLight), 
		.sideLight(sideLight), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Sensor = 0;
		walkButton = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		integer i;
		for(i = 0; i < 20; i = i +1) begin
			$display("clk = %0d, main = %0d, side = %0d", clk, mainLight, sideLight);
			#10
		end
		// Add stimulus here

	end
      
endmodule

