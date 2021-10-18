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
	 input clk,
    input Sensor,
    input walkButton,
    output walkLight,
    output reg [1:0] mainLight,
    output reg [1:0] sideLight,
	 input clk,
	 input rst
    );
	 
	 reg [4:0] state;
	 reg [4:0] next_state;
	 
	 parameter G1=5'd0, G2=5'd1, G3=5'd2, YR=5'd3, R1=5'd4, RG1=5'd5, RG2=5'd6, RY=5'd7;
	 reg [3:0] seconds_passed;
	 reg [1:0] G=2'b11, R=2'b0, Y=2'b01;
	 
	 always@ (state) begin
		case(state)
			G1: begin if ((seconds_passed == 4'd6) && (Sensor)) begin
					next_state <= G3;
				end else if (seconds_passed == 4'd6) begin
					next_state <= G2;
				end else begin
					next_state <= G1;
				end
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
	 
	 always@ (posedge clk) begin
		if (rst == 1'b1) begin
			state <= G1;
			seconds_passed <= 0;
		end else if (state == next_state) begin
			seconds_passed <= seconds_passed + 1;
		end else begin
			state <= next_state;
			seconds_passed <= 0;
		end
	 end

	 always@ (posedge clk) begin
		case(state)
			G1: begin
				mainLight <= G;
				sideLight <= R;
				end
			G2: begin
				mainLight <= G;
				sideLight <= R;
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
			default: begin
				end
		endcase
	 end

endmodule
