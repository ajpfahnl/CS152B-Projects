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
    output reg walkLight,
    output reg mainLightR,
    output reg mainLightY,
    output reg mainLightG,
    output reg sideLightR,
    output reg sideLightY,
	 output reg sideLightG,
	 input clk,
	 input rst
    );
	 
	 reg walk;
	 reg [4:0] state;
	 reg [4:0] next_state;
	 
	 parameter G1=5'd0, G2=5'd1, G3=5'd2, YR=5'd3, R1=5'd4, RG1=5'd5, RG2=5'd6, RY=5'd7;
	 reg [3:0] seconds_passed;
	 reg [1:0] G=2'b11, R=2'b0, Y=2'b01;
	 reg ON=1'b1, OFF=1'b0;
	 
	 always@ (state or seconds_passed) begin
		case(state)
			G1: begin if ((seconds_passed == 4'd6) && (Sensor)) begin
					next_state <= G3;
				end else if (seconds_passed == 4'd6) begin
					next_state <= G2;
				end else begin
					next_state <= G1;
				end
				end
			G2: begin if (seconds_passed == 4'd6) begin
					next_state <= YR;
				end else begin
					next_state <= G2;
				end
				end
			G3: begin if (seconds_passed == 4'd3) begin
					next_state <= YR;
				end else begin
					next_state <= G3;
				end
				end
			YR: begin if ((seconds_passed == 4'd2) && (walk)) begin
					next_state <= R1;
				end else if (seconds_passed == 4'd2) begin
					next_state <= RG1;
				end else begin
					next_state <= YR;
				end
				end
			R1: begin if (seconds_passed == 4'd3) begin
					next_state <= RG1;
				end else begin
					next_state <= R1;
				end
				
				end
			RG1: begin if ((seconds_passed == 4'd6) && (Sensor)) begin
					next_state <= RG2;
				end else if (seconds_passed == 4'd6) begin
					next_state <= RY;
				end else begin
					next_state <= RG1;
				end
				end
			RG2: begin if (seconds_passed == 4'd3) begin
					next_state <= RY;
				end else begin
					next_state <= RG2;
				end
				end
			RY: begin if (seconds_passed == 4'd2) begin
					next_state <= G1;
				end else begin
					next_state <= RY;
				end
				end
			default: next_state <= G1;
		endcase
	 end
	 
	 always@ (posedge clk) begin
		if (rst == 1'b1) begin
			state <= G1;
			seconds_passed <= 1;
			walk <= 0;
		end else if (state == next_state) begin
			seconds_passed <= seconds_passed + 4'd1;
			state <= next_state;
		end else begin
			state <= next_state;
			seconds_passed <= 1;
		end
		if (walkButton) begin
			walk <= 1;
		end
		if (state == RG1) begin
			walk <= 0;
		end
	 end

	 always@ (state) begin
		case(state)
			G1: begin
				mainLightG <= 1;
				mainLightY <= 0;
				mainLightR <= 0;
				sideLightR <= 1;
				sideLightY <= 1;
				sideLightG <= 1;
				walkLight <= OFF;
				end
			G2: begin
				mainLightG <= 1;
				mainLightY <= 0;
				mainLightR <= 0;
				sideLightR <= 1;
				sideLightY <= 0;
				sideLightG <= 0;
				walkLight <= OFF;
				end
			G3: begin
				mainLightG <= 1;
				mainLightY <= 0;
				mainLightR <= 0;
				sideLightR <= 1;
				sideLightY <= 0;
				sideLightG <= 0;
				walkLight <= OFF;
				end
			YR: begin
				mainLightY <= 1;
				mainLightG <= 0;
				mainLightR <= 0;
				sideLightR <= 1;
				sideLightY <= 0;
				sideLightG <= 0;
				walkLight <= OFF;
				end
			R1: begin
				mainLightR <= 1;
				mainLightY <= 0;
				mainLightG <= 0;
				sideLightR <= 1;
				sideLightY <= 0;
				sideLightG <= 0;
				walkLight <= ON;
				end
			RG1: begin
				mainLightR <= 1;
				mainLightY <= 0;
				mainLightG <= 0;
				sideLightG <= 1;
				sideLightY <= 0;
				sideLightR <= 0;
				walkLight <= OFF;
				end
			RG2: begin
				mainLightR <= 1;
				mainLightY <= 0;
				mainLightG <= 0;
				sideLightG <= 1;
				sideLightY <= 0;
				sideLightR <= 0;
				walkLight <= OFF;
				end
			RY: begin
				mainLightR <= 1;
				mainLightY <= 0;
				mainLightG <= 0;
				sideLightY <= 1;
				sideLightG <= 0;
				sideLightR <= 0;
				walkLight <= OFF;
				end
			default: begin
				mainLightR <= 1;
				mainLightY <= 0;
				mainLightG <= 0;
				sideLightR <= 1;
				sideLightY <= 0;
				sideLightG <= 0;
				walkLight <= OFF;
				end
		endcase
	 end

endmodule
