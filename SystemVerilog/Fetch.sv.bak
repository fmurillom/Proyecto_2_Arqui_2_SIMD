module Fetch ( input logic clk, reset,
					input logic [31:0] ResultW, ALUResultE,
					input logic PCSrcW, BranchTakenE, StallF, StallD, FlushD,
					output logic [31:0] InstrD, PCPlus8D);


	logic [31:0] PCPlus4, PCJump, PCNext, PCout, InstOut;
		
	PCreg # (32) PC (clk, reset, StallF, PCNext, PCout);
	
	assign PCPlus4 = PCout + 4;
	
	assign PCPlus8D = PCPlus4;
	
	Mux2 #(32) mux_pc4 (PCPlus4, ResultW, PCSrcW, PCJump);
	
	Mux2 # (32) mux_pcnext (PCJump, ALUResultE, BranchTakenE, PCNext);
	
	MemInst MI (PCout, InstOut);
	
	//Registro de Fetch-Deco
	RegFD regfd (clk, StallD, FlushD, InstOut, InstrD);

endmodule 