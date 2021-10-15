`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:46:40 10/15/2021
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
	reg [1:0] mainLight;
	reg [1:0] sideLight;

	// Outputs
	wire walkLight;

	// Instantiate the Unit Under Test (UUT)
	traffic_light uut (
		.Sensor(Sensor), 
		.walkButton(walkButton), 
		.walkLight(walkLight), 
		.mainLight(mainLight), 
		.sideLight(sideLight)
	);

	initial begin
		// Initialize Inputs
		Sensor = 0;
		walkButton = 0;
		mainLight = 0;
		sideLight = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

