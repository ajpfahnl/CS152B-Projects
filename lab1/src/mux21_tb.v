module top;
  wire [15:0] out;
  reg [15:0] d0, d1;
reg s;
m21 name(.Y(out), .D0(d0), .D1(d1), .S(s));
initial
begin
d0=16'b0000000000000000;
d1=16'b1111111100000000;
s=1'b0;
#100 $finish;
end
always #40 d0=d0+1;
always #20 d1=d1+1;
always #10 s=~s;
always@(d0 or d1 or s)
  $monitor("At time = %t, d0=%b d1=%b sel=%d, Output = %b", $time, d0, d1, s, out);
endmodule