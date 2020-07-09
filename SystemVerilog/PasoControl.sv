module PasoControl (input logic clk,FlushE,reset,
						  input logic [1:0] Op,
						  input logic [3:0] Rd, CondD,
						  input logic [5:0] Funct,
						  input logic [3:0] ALUFlags,
						  output logic [1:0] RegSrcD, ImmSrcD,
						  output logic RegWriteW, MemtoRegW,PCSrcW,ALUSrcE, MemWriteM,
						  output logic MemtoRegE,RegWriteM,BranchTakenE,
						  output logic [1:0] ALUControlE);
						  
						  
// Unidad de Control 

logic [1:0] FlagWriteD,ALUControlD,ImmSrcDO,RegSrcDO;
logic PCSrcD, RegWriteD,MemtoRegD;
logic MemWriteD, BranchD,ALUSrcD;


Control_Unit ctrl_unit (.Op(Op),
						  .Funct(Funct),
						  .Rd(Rd),
						  .FlagWriteD(FlagWriteD),
						  .PCSrcD(PCSrcD), .RegWriteD(RegWriteD),.MemtoRegD(MemtoRegD),
						  .MemWriteD(MemWriteD), .BranchD(BranchD),.ALUSrcD(ALUSrcD) ,
						  .ALUControlD(ALUControlD),.ImmSrcD(ImmSrcDO),.RegSrcD(RegSrcDO));
						  
						  
assign ImmSrcD = ImmSrcDO;
assign RegSrcD = RegSrcDO;

// Pipe de etapa Decode-Execution

logic [3:0] ALUFlags_Out;
logic [3:0] FlagsE;

logic PCSrcE,RegWriteE,MemtoRegEO;
logic MemWriteE,BranchE,ALUSrcEO;
logic [1:0] ALUControlEO,FlagWriteE;
logic [3:0] FlagOut,CondE;

PipeDE pipede (.clk(clk),.Clear(FlushE),
					.PCSrcD(PCSrcD),.RegWriteD(RegWriteD),.MemtoRegD(MemtoRegD),
					.MemWriteD(MemWriteD),.BranchD(BranchD),.ALUSrcD(ALUSrcD),
					.ALUControlD(ALUControlD),.FlagWriteD(FlagWriteD),
					.FlagIn(ALUFlags_Out),.CondD(CondD),
					
					.PCSrcE(PCSrcE),.RegWriteE(RegWriteE),.MemtoRegE(MemtoRegEO),
					.MemWriteE(MemWriteE),.BranchE(BranchE),.ALUSrcE(ALUSrcEO),
					.ALUControlE(ALUControlEO),.FlagWriteE(FlagWriteE),
					.FlagsE(FlagsE),.CondE(CondE));
					
					
assign ALUSrcE = ALUSrcEO;
assign ALUControlE = ALUControlEO;
assign MemtoRegE = MemtoRegEO;


// Condition Unit 

logic In1, In2,In3, In4;

Condition_Unit condition_unit (.clk(clk), .reset(reset),
										 .CondE(CondE),
										 .ALUFlags(ALUFlags),
										 .FlagsE(FlagsE),
										 .ALUFlags_Out(ALUFlags_Out),
										 .FlagWriteE(FlagWriteE),
										 .PCSrcE(PCSrcE), .RegWriteE(RegWriteE), .MemWriteE(MemWriteE),
										 .BranchE(BranchE),.PCSrcM(In1), .RegWriteM(In2),
										 .MemWriteM(In3), .BranchTakenE(In4));
										 
assign BranchTakenE = In4;
										 
										 
// Pipe de etapa Execution-Memory

logic PCSrcM,RegWriteMO,MemtoRegM,MemWriteMO;

PipeEM pipeem(.clk(clk),
				  .in1(In1),.in2(In2),.in3(MemtoRegEO),.in4(In3),
				  .PCSrcM(PCSrcM),.RegWriteM(RegWriteMO),.MemtoRegM(MemtoRegM),
				  .MemWriteM(MemWriteMO));
				  

assign RegWriteM = RegWriteMO;


// Pipe de etapa Memory-Writeback

logic PCSrcWO,RegWriteWO,MemtoRegWO;

PipeMW pipemw(
.clk(clk),
.PCSrcM(PCSrcM),.RegWriteM(RegWriteMO),.MemtoRegM(MemtoRegM),
.PCSrcW(PCSrcWO),.RegWriteW(RegWriteWO),.MemtoRegW(MemtoRegWO));
					
assign RegWriteW = RegWriteWO;
assign MemtoRegW = MemtoRegWO;
assign PCSrcW = PCSrcWO;


endmodule












