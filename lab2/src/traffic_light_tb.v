`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:53:10 10/15/2021
// Design Name:   traffic_light
// Module Name:   /home/ise/Desktop/CS152B/lab2/src/traffic_light_tb.v
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
	reg Sensor;
	reg walkButton;
	reg clk, rst;

	// Outputs
	wire walkLight;
	wire [1:0] mainLight;
	wire [1:0] sideLight;
	wire [4:0] state;
	wire [4:0] next_state;
	wire [3:0] seconds_passed;

	// Instantiate the Unit Under Test (UUT)
	traffic_light uut (
		.Sensor(Sensor), 
		.walkButton(walkButton), 
		.walkLight(walkLight), 
		.mainLight(mainLight), 
		.sideLight(sideLight),
		.state(state),
		.next_state(next_state),
		.seconds_passed(seconds_passed),
		.clk(clk),
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		Sensor = 0;
		walkButton = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 rst=0;
		
		#400 rst=1;
		
		#20 rst=0;
		walkButton = 1;
		Sensor = 1;
		#70 walkButton = 0;
		#40;
		#80;
		
		$finish;
	end
	
	always #5 clk = ~clk;
      
endmodule

