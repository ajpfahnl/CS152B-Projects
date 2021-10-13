`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:55 10/04/2021 
// Design Name: 
// Module Name:    shifts 
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
module left_shift(A, B, Y, OF);
input [15:0] A;
input [15:0] B;
output reg [15:0] Y;
output OF;

wire [4:0] N;
assign N = B[4:0];
reg [4:0] i;

always @(*) begin
	Y = A;
	for(i = 0; i < N; i = i + 1) begin
		Y[0] = Y[1];
		Y[1] = Y[2];
		Y[2] = Y[3];
		Y[3] = Y[4];
		Y[4] = Y[5];
		Y[5] = Y[6];
		Y[6] = Y[7];
		Y[7] = Y[8];
		Y[8] = Y[9];
		Y[9] = Y[10];
		Y[10] = Y[11];
		Y[11] = Y[12];
		Y[12] = Y[13];
		Y[13] = Y[14];
		Y[14] = Y[15];
		Y[15] = 0;
	end
end
xor(OF, A[15], Y[15]);	
endmodule
		
		
module right_logic_shift(A, B, Y, OF);
input [15:0] A;
input [15:0] B;
output reg [15:0] Y;
output OF;

wire [4:0] N;
assign N = B[4:0];
reg [4:0] i;

always @(*) begin
	Y = A;
	for(i = 0; i < N; i = i + 1) begin
		Y[0] = 0;
		Y[1] = Y[0];
		Y[2] = Y[1];
		Y[3] = Y[2];
		Y[4] = Y[3];
		Y[5] = Y[4];
		Y[6] = Y[5];
		Y[7] = Y[6];
		Y[8] = Y[7];
		Y[9] = Y[8];
		Y[10] = Y[9];
		Y[11] = Y[10];
		Y[12] = Y[11];
		Y[13] = Y[12];
		Y[14] = Y[13];
		Y[15] = Y[14];
	end
end
xor(OF, A[15], Y[15]);	
endmodule

/*module left_arith_shift(A, Y, OF);
input [15:0] A;
output wire [15:0] Y;
output OF;
assign Y[0] = 0;
assign Y[1] = A[0];
assign Y[2] = A[1];
assign Y[3] = A[2];
assign Y[4] = A[3];
assign Y[5] = A[4];
assign Y[6] = A[5];
assign Y[7] = A[6];
assign Y[8] = A[7];
assign Y[9] = A[8];
assign Y[10] = A[9];
assign Y[11] = A[10];
assign Y[12] = A[11];
assign Y[13] = A[12];
assign Y[14] = A[13];
assign Y[15] = A[14];
xor(OF, A[15], Y[15]);
endmodule*/

module right_arith_shift(A, B, Y, OF);
input [15:0] A;
input [15:0] B;
output reg [15:0] Y;
output OF;

wire [4:0] N;
assign N = B[4:0];
reg [4:0] i;

always @(*) begin
	Y = A;
	for(i = 0; i < N; i = i + 1) begin
		Y[0] = Y[0];
		Y[1] = Y[0];
		Y[2] = Y[1];
		Y[3] = Y[2];
		Y[4] = Y[3];
		Y[5] = Y[4];
		Y[6] = Y[5];
		Y[7] = Y[6];
		Y[8] = Y[7];
		Y[9] = Y[8];
		Y[10] = Y[9];
		Y[11] = Y[10];
		Y[12] = Y[11];
		Y[13] = Y[12];
		Y[14] = Y[13];
		Y[15] = Y[14];
	end
end
xor(OF, A[15], Y[15]);	
endmodule
