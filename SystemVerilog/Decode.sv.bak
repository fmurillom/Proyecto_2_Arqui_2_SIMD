module Decode (input logic clk, reset, RegWriteW, FlushE,
					input logic [3:0] InFlags,
					input logic [31:0] InstD, PCPlus8, ResultW, 
					input logic [3:0] WA3W,
					output logic [31:0] RD1E, RD2E, ExtImmE,
					output logic PCSrcD, PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE, Stuck,
					output logic [2:0] ALUControlE, 
					output logic [1:0] FlagWriteE, 
					output logic [3:0] CondE, FlagsE, WA3E, ra1d, ra2d, RA1E, RA2E);

	logic [31:0] RD1, RD2, ExtOut;
	logic [3:0] RA1D, RA2D;
	
	
	logic [3:0] CondD, Rd;
	logic [5:0] Funct;
	logic [1:0] Opcode;
	logic [1:0] RegSrcD, ImmSrcD;
	
	logic [1:0] FlagWriteD;
	logic RegWriteD,MemtoRegD;
	logic MemWriteD, BranchD,ALUSrcD;
	logic [2:0] ALUControlD;
	
	assign Opcode = InstD [27:26];
	assign Funct = InstD [25:20];
	assign Rd = InstD [15:12];
	assign CondD = InstD [31:28];
	
	//unidad de control
	Control_Unit controlUnit (	Opcode, Funct, Rd,
										FlagWriteD,
										PCSrcD, RegWriteD,MemtoRegD,
										MemWriteD, BranchD,ALUSrcD, Stuck,
										ALUControlD,ImmSrcD,RegSrcD);
	
	Mux2 # (4) mux_ra1 (InstD[19:16], 4'b1111, RegSrcD[0], RA1D);
	Mux2 # (4) mux_ra2 (InstD[3:0], InstD[15:12], RegSrcD[1], RA2D);
	
	BancoRegistros BR (clk, RegWriteW, reset, RA1D, RA2D, WA3W, ResultW, PCPlus8, RD1, RD2);
	
	Extend extend (InstD[23:0], ImmSrcD, ExtOut);
	
	//registro de Deco-Exe
	
	assign ra1d = RA1D;
	assign ra2d = RA2D;
	
	RegDE regde (	clk, FlushE,reset,
						PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUSrcD,
						ALUControlD, FlagWriteD, 
						CondD, InFlags,
						RD1, RD2, ExtOut,
						InstD[15:12], RA1D, RA2D,
						RD1E, RD2E, ExtImmE,
						WA3E, RA1E, RA2E,
						PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
						ALUControlE, FlagWriteE, 
						CondE, FlagsE);
						
endmodule 