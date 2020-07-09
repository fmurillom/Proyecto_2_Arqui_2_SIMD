module Memory (input logic clk, clock_vga,
					input logic PCSrcM, RegWriteM, MemtoRegM, MemWriteM,
					input logic [31:0] ALUResultM, WriteDataM,
					input logic [3:0] WA3M,
					input logic [15:0] VGAArd,
					output logic PCSrcW, RegWriteW, MemtoRegW,
					output logic [31:0] ReadDataW, ALUOutW, ALUOutM, VGAData,
					output logic [3:0] WA3W);

	logic [31:0] MemOut;
	
	//MemDatos memdatos (clk, MemWriteM, ALUResultM, WriteDataM, MemOut);
	
	logic wren_b;
	logic [31:0] data_b;
	assign wren_b = 0;
	assign data_b = 32'b0;
	
	RAM memdatos (ALUResultM[15:0], VGAArd, clk, clock_vga, WriteDataM, data_b, MemWriteM, wren_b, MemOut, VGAData);
	
	//registro de Mem-WB
	
	RegMW regmw(clk,
					PCSrcM, RegWriteM, MemtoRegM,
					MemOut, ALUResultM,
					WA3M,
					PCSrcW, RegWriteW, MemtoRegW,
					ReadDataW, ALUOutW,
					WA3W);
					
	assign ALUOutM = ALUResultM;

endmodule 