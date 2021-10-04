module top;
wire out;
reg d0, d1, d2, d3, s0, s1;
  m41 name(.Y(out), .D0(d0), .D1(d1), .D2(d2), .D3(d3), .S0(s0), .S1(s1));
initial
begin
d0=1'b0;
d1=1'b0;
d2=1'b0;
d3=1'b0;
s0=1'b0;
s1=1'b0;
#100 $finish;
end
always #128 d3=~d3;
always #64 d2=~d2;
always #32 d1=~d1;
always #16 d0=~d0;
always #8 s1=~s1;
always #4 s0=~s0;

always@(d0 or d1 or d2 or d3 or s0 or s1)
  $monitor("At time = %t, input=%d%d%d%d sel=%d%d, Output = %d", $time, d0, d1, d2, d3, s0, s1, out);
endmodule