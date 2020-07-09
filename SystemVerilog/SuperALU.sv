module SuperALU (	input logic [31 : 0] Op_A,
						 input logic [31 : 0] Op_B,
						 input logic [2:0] Control,
						 output logic [3:0] Flags, // Flag[0]=overflow, Flag[1]=carry, Flag[2]=cero, Flag[3]=negativo
						 output logic [31 : 0] Result);

	logic [3:0] FlagsALU;
	logic [31:0] ResultALU, Mult, Pixout, Umbout, Shift;	
						 
	ALU #(32) alu( Op_A, Op_B, Control[1:0], FlagsALU, ResultALU);
	
	PixProm pixprom(Op_A[23:16], Op_A[15:8], Op_A[7:0], Pixout);
	
	Umbral umbral(Op_A, Op_B, Umbout);
	
	assign Shift = Op_A << Op_B;
	
	assign Mult = Op_A * Op_B;
	
	always_comb begin
	
		if (Control == 3'b100)
		begin
			Flags = 4'b0;
			Result = Mult;
			
		end
		
		else if (Control == 3'b101)
		begin
			Flags = 4'b0;
			Result = Pixout;
			
		end
		
		else if (Control == 3'b110)
		begin
			Flags = 4'b0;
			Result = Umbout;
			
		end
		
		else if (Control == 3'b111)
		begin
			Flags = 4'b0;
			Result = Shift;
			
		end
		
		else
		begin
			Flags = FlagsALU;
			Result = ResultALU;
		end
	end

endmodule 