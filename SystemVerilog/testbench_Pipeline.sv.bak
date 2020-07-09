`timescale 1 ps / 1 ps

module testbench_Pipeline();



logic clk;
logic reset, V_SyncOut, H_SyncOut, and_enable, Stuck, go,clock_vga,vga_sync;
logic [31:0] InstrD, ALUResultEA, ALUResultM, ResultW,WriteDataM,VGAData;
logic [7:0] RedOut, GreenOut, BlueOut;

Pipeline_ARM dut(	clk, reset, go,
						InstrD, ALUResultEA, ALUResultM, ResultW,WriteDataM,
						V_SyncOut, H_SyncOut, and_enable, Stuck,clock_vga,vga_sync,
						RedOut, GreenOut, BlueOut);

// initialize test
initial

	begin
		reset <= 1; # 10; reset <= 0;
	end
// generate clock to sequence tests

	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;

	end
	

endmodule
