module top;
wire out;
reg d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, s0, s1, s2, s3;
  m161 name(.Y(out), .D0(d0), .D1(d1), .D2(d2), .D3(d3), .D4(d4), .D5(d5), .D6(d6), .D7(d7), .D8(d8), .D9(d9), .D10(d10), .D11(d11), .D12(d12), .D13(d13), .D14(d14), .D15(d15), .S0(s0), .S1(s1), .S2(s2), .S3(s3));
initial
begin
d0=1'b0;
d1=1'b0;
d2=1'b0;
d3=1'b0;
d4=1'b0;
d5=1'b0;
d6=1'b0;
d7=1'b0;
d8=1'b0;
d9=1'b0;
d10=1'b0;
d11=1'b0;
d12=1'b0;
d13=1'b0;
d14=1'b0;
d15=1'b0;
  
s0=1'b0;
s1=1'b0;
s2=1'b0;
s3=1'b0;
#100 $finish;
end
always #2048 d7=~d7;
always #1024 d6=~d6;
always #512 d5=~d5;
always #256 d4=~d4;
always #128 d3=~d3;
always #64 d2=~d2;
always #32 d1=~d1;
always #16 d0=~d0;
always #8 s3=~s3;
always #4 s2=~s2;
always #2 s1=~s1;
always #1 s0=~s0;

  always@(d0 or d1 or d2 or d3 or d4 or d5 or d6 or d7 or s0 or s1 or s2 or s3)
    $monitor("At time = %t, input=%d%d%d%d %d%d%d%d sel=%d%d%d%d, Output = %d", $time, d0, d1, d2, d3, d4, d5, d6, d7, s0, s1, s2, s3, out);
endmodule