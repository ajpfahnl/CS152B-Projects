module m21(Y, D0, D1, S);

output Y;
input D0, D1, S;
wire T1, T2, Sbar;

and (T1, D1, S), (T2, D0, Sbar);
not (Sbar, S);
or (Y, T1, T2);

endmodule

module m41(Y, D0, D1, D2, D3, S0, S1);
  
  output Y;
  input D0, D1, D2, D3, S0, S1;
  wire T1, T2;
  
  m21 m2a(T1, D0, D1, S0);
  m21 m2b(T2, D2, D3, S0);
  m21 m2c(Y, T1, T2, S1);
  
endmodule

module m161(Y, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, S0, S1, S2, S3);
  
  output Y;
  input D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, S0, S1, S2, S3;
  wire T1, T2, T3, T4;
  
  m41 m2a(T1, D0, D1, D2, D3, S0, S1);
  m41 m2b(T2, D4, D5, D6, D7, S0, S1);
  m41 m2c(T3, D8, D9, D10, D11, S0, S1);
  m41 m2d(T4, D12, D13, D14, D15, S0, S1);
  
  m41 m3e(Y, T1, T2, T3, T4, S2, S3);
  
endmodule