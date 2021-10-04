module top;
  wire [15:0] out;
  reg [15:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15;
  reg s0, s1, s2, s3;
  m121 name(.Y(out), .D0(d0), .D1(d1), .D2(d2), .D3(d3), .D4(d4), .D5(d5), .D6(d6), .D7(d7), .D8(d8), .D9(d9), .D10(d10), .D11(d11), .S0(s0), .S1(s1), .S2(s2), .S3(s3));
initial
begin
d0=16'b0000000000000000;
d1=16'b0000000000000001;
d2=16'b0000000000000010;
d3=16'b0000000000000011;
d4=16'b0000000000000100;
d5=16'b0000000000000101;
d6=16'b0000000000000110;
d7=16'b0000000000000111;
d8=16'b0000000000001000;
d9=16'b0000000000001001;
d10=16'b0000000000001010;
d11=16'b0000000000001011;
  
s0=1'b0;
s1=1'b0;
s2=1'b0;
s3=1'b0;
#200 $finish;
end
  always #128 d3=d3+1; 
  always #128 d7=d7+1; 
  always #128 d11=d11+1; 
always #64 d2=d2+1; 
  always #64 d6=d6+1; 
  always #64 d10=d10+1; 
always #32 d1=d1+1; 
  always #32 d5=d5+1; 
  always #32 d9=d9+1; 
always #16 d0=d0+1; 
  always #16 d4=d4+1; 
  always #16 d8=d8+1; 
always #8 s3=~s3;
always #4 s2=~s2;
always #2 s1=~s1;
always #1 s0=~s0;

  always@(s0)
    $monitor("%d%d%d%d %d%d%d%d %d%d%d%d sel=%d%d%d%d, Output = %d", d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, s3, s2, s1, s0, out);
endmodule