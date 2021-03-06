module MemoryV (input logic clk, clock_vga,
					input logic PCSrcM, RegWriteM, MemtoRegM, MemWriteM,
					input logic [255:0] ALUResultM, WriteDataM,
					input logic [2:0] WA3M,
					input logic [15:0] VGAArd,
					output logic PCSrcW, RegWriteW, MemtoRegW,
					output logic [255:0] ReadDataW, ALUOutW, ALUOutM, VGAData,
					output logic [2:0] WA3W);

	logic [255:0] MemOut;
	
	//MemDatos memdatos (clk, MemWriteM, ALUResultM, WriteDataM, MemOut);
	
	logic wren_b;
	logic [31:0] data_b;
	assign wren_b = 0;
	assign data_b = 32'b0;
	
	RamV memdatos(ALUResultM[15:0], clk, WriteDataM, MemWriteM, MemOut);
	
	
	//RAM memdatos (ALUResultM[15:0], VGAArd, clk, clock_vga, WriteDataM, data_b, MemWriteM, wren_b, MemOut, VGAData);
	
	//registro de Mem-WB
	
	assign ALUOutM = ALUResultM;
	
	RegMWV regmw(clk,
					PCSrcM, RegWriteM, MemtoRegM,
					MemOut, ALUResultM,
					WA3M,
					PCSrcW, RegWriteW, MemtoRegW,
					ReadDataW, ALUOutW,
					WA3W);

endmodule 