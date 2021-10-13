module ALU16_lls_rls_slte_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [3:0] ALUCtrl;

	// Outputs
	wire Overflow;
	wire Zero;
	wire [15:0] S;

	// Instantiate the Unit Under Test (UUT)
	ALU16 uut (
		.A(A), 
		.B(B), 
		.ALUCtrl(ALUCtrl), 
		.Overflow(Overflow), 
		.Zero(Zero), 
		.S(S)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		ALUCtrl = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		// LLS Case 1
		A = 16'b1;
		ALUCtrl = 4'b1000;
      $monitor("A=%b B=%b ALUCtrl=%b, Overflow=%b, Zero=%b, S=%b", A, B, ALUCtrl, Overflow, Zero, S);
		#20;
		
		// LLS Case 2
		A = 16'b1111_1111_1111_1111;
		#20;
		
		// LLS Case 3: overflow
		A = 16'b0111_1111_1111_1111;
		#20;
		
		// LLS Case 4
		A = 16'b0;
		#20;
      
      	//------------------------------------
		
		// RLS Case 1: overflow
		A = 16'b1111_1111_1111_1111;
		ALUCtrl = 4'b1010;
		#20;
		
		// RLS Case 2
		A = 16'b0000_0000_0000_0010;
		#20;
		
		// RLS Case 3
		A = 16'b0000_0000_0000_0001;
		#20;
		
		// RLS Case 4: overflow
		A = 16'b1111_1111_1111_1101;
		#20
		
		// RLS Case 5
		A = 16'b0;
		#20;
      
      //----------------------------------------
		
		// SLTE Case 1: equal
		A = 16'b1111_1111_1111_1111;
		B = 16'b1111_1111_1111_1111;
		ALUCtrl = 4'b1001;
		#20;
		
		// SLTE Case 2: equal
		A = 16'b0;
		B = 16'b0;
		#20;
		
		// SLTE Case 3: equal
		A = -16'd23;
		B = -16'd23;
		#20;
		
		// SLTE Case 4
		A = 16'b0;
		B = 16'b1111_1111_1111_1111;
      #20;
      	// SLTE Case 5
		A = 16'b1111_1111_1111_1111;
        B = 16'b0;
      #20;
      	// SLTE Case 6
      	A = 16'd45;
        B = 16'd46;
      #20;
      	// SLTE Case 7
      	A = -16'd45;
        B = -16'd46;
      #20;
      // SLTE Case 8
      	A = -16'd45;
        B = -16'd47;
		#50;
		A = -16'd30000;
		B = 16'd5000;
		#50;
		A = 16'd30000;
		B = -16'd5000;
		#50;
		A = 16'd30000;
		B = 16'd5000;
		#50;
		A = -16'd30000;
		B = -16'd5000;
		#50;
		B = -16'd30000;
		A = 16'd5000;
		#50;
		B = 16'd30000;
		A = -16'd5000;
		#50;
		B = 16'd30000;
		A = 16'd5000;
		#50;
		B = -16'd30000;
		A = -16'd5000;
		
		#20 $finish;
		

	end
      
endmodule
