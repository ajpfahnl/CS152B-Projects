// Code your design here

module m21(Y, D0, D1, S);

  output [15:0] Y;
  input [15:0] D0, D1;
  input S;
  wire [15:0] T1, T2;
  wire Sbar;

  not (Sbar, S);
  
  // bitwise AND for T1 = D1 & S
  and(T1[0], D1[0], S);
  and(T1[1], D1[1], S);
  and(T1[2], D1[2], S);
  and(T1[3], D1[3], S);
  and(T1[4], D1[4], S);
  and(T1[5], D1[5], S);
  and(T1[6], D1[6], S);
  and(T1[7], D1[7], S);
  and(T1[8], D1[8], S);
  and(T1[9], D1[9], S);
  and(T1[10], D1[10], S);
  and(T1[11], D1[11], S);
  and(T1[12], D1[12], S);
  and(T1[13], D1[13], S);
  and(T1[14], D1[14], S);
  and(T1[15], D1[15], S);
  
  // bitwise AND for T1 = D1 & S
  and(T2[0], D0[0], Sbar);
  and(T2[1], D0[1], Sbar);
  and(T2[2], D0[2], Sbar);
  and(T2[3], D0[3], Sbar);
  and(T2[4], D0[4], Sbar);
  and(T2[5], D0[5], Sbar);
  and(T2[6], D0[6], Sbar);
  and(T2[7], D0[7], Sbar);
  and(T2[8], D0[8], Sbar);
  and(T2[9], D0[9], Sbar);
  and(T2[10], D0[10], Sbar);
  and(T2[11], D0[11], Sbar);
  and(T2[12], D0[12], Sbar);
  and(T2[13], D0[13], Sbar);
  and(T2[14], D0[14], Sbar);
  and(T2[15], D0[15], Sbar);
  
  // TA said using bitwise OR was ok here
  assign Y = T1 | T2;
endmodule


module m41(Y, D0, D1, D2, D3, S0, S1);
  
  output [15:0] Y;
  input [15:0] D0, D1, D2, D3;
  input S0, S1;
  wire [15:0] T1, T2;
  
  m21 m2a(T1, D0, D1, S0);
  m21 m2b(T2, D2, D3, S0);
  m21 m2c(Y, T1, T2, S1);
  
endmodule

module m121(Y, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, S0, S1, S2, S3);
  
  output [15:0] Y;
  input [15:0] D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15;
  input S0, S1, S2, S3;
  wire [15:0] T1, T2, T3, T4;
  
  m41 m2a(T1, D0, D1, D2, D3, S0, S1);
  m41 m2b(T2, D4, D5, D6, D7, S0, S1);
  m41 m2c(T3, D8, D9, D10, D11, S0, S1);
  m41 m2d(T4, D12, D13, D14, D15, S0, S1);
  
  // if selector is larger than 11, Y = 0
  m41 m3e(Y, T1, T2, T3, T4, S2, S3);
  
endmodule
