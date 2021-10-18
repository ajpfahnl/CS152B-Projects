`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:29 10/15/2021 
// Design Name: 
// Module Name:    traffic_light 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module traffic_light(
    input Sensor,
    input walkButton,
    output walkLight,
    output [1:0] mainLight,
    output [1:0] sideLight,
	 input clk,
	 input rst
    );
	 
	 reg [4:0] state;
	 reg [4:0] next_state;
	 
	 parameter G1=5'd0, G2=5'd1, G3=5'd2, YR=5'd3, R1=5'd4, RG1=5'd5, RG2=5'd6, RY=5'd7;
	 
	 always@ (state) begin
		case(state)
			G1: begin
			end
			G2: begin
			end
			G3: begin
			end
			YR: begin
			end
			R1: begin
			end
			RG1: begin
			end
			RG2: begin
			end
			RY: begin
			end
			default: next_state <= G1;
		endcase
	 end

endmodule
