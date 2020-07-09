module Pipeline_ARM (input logic clk50, reset, go,
							output logic [31:0] InstrD, ALUResultEA, ALUResultM, ResultW, WriteDataM,
							output logic V_SyncOut, H_SyncOut, and_enable,Stuck,clock_vga,vga_sync,
							output logic [7:0] RedOut, GreenOut, BlueOut);


logic [31:0] ReadDataW, /*WriteDataM,*/ PCPlus8, ExtImmE, ALUOutM, ALUOutW, RD1E, RD2E, VGAData;
logic [3:0] RA1E, RA2E, ra1d, ra2d, FlagsD, CondE, FlagsE, WA3E, WA3W, WA3M;
logic [1:0] ForwardAE, ForwardBE, FlagWriteE;
logic [2:0] ALUControlE;
logic clk;

//Hard stop circuit

StopCounter stopcount (Stuck, go, StopCont);

assign clk = StopCont ? 0 : clk50;

//VGA temp

logic [15:0] VGAArd;
logic [9:0] ColumnOut, RowOut;

assign vga_sync = 0;

always @(posedge clk50) begin
	if(clk50 == 1'b1)
		begin
			clock_vga = ~clock_vga;
		end
end


VGAController vga (	reset, clock_vga,
							VGAData[7:0], VGAData[15:8], VGAData[23:16],
							V_SyncOut, H_SyncOut,
							RedOut, GreenOut, BlueOut,
							ColumnOut, RowOut,
							and_enable);

	always_comb begin

		if ((RowOut > 10'd200) || (ColumnOut > 10'd200))
		begin
			VGAArd = 16'd65535;
		end

		else
		begin
			VGAArd = RowOut + ColumnOut * 10'd200;
		end
	end



Fetch fetch(clk, reset,
				ResultW, ALUResultEA,
				PCSrcW, BranchTakenE, ~StallF, ~StallD, FlushD,
				InstrD, PCPlus8);

Decode decode(	clk, reset, RegWriteW, FlushE,
					FlagsD,
					InstrD, PCPlus8, ResultW, WA3W,
					RD1E, RD2E, ExtImmE,
					PCSrcD, PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,Stuck,
					ALUControlE, FlagWriteE, 
					CondE, FlagsE, WA3E, ra1d, ra2d, RA1E, RA2E);

Execute execute(	clk, reset,
						RD1E, RD2E, ExtImmE, ResultW, ALUOutM,
						PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
						ALUControlE, FlagWriteE, ForwardAE, ForwardBE,
						CondE, FlagsE, WA3E,
						PCSrcM, RegWriteM, MemWriteM, MemtoRegM, BranchTakenE,
						ALUResultM, WriteDataM, ALUResultEA,
						WA3M, FlagsD);

Memory memory(	clk, clock_vga,
					PCSrcM, RegWriteM, MemtoRegM, MemWriteM,
					ALUResultM, WriteDataM,
					WA3M,
					VGAArd,
					PCSrcW, RegWriteW, MemtoRegW,
					ReadDataW, ALUOutW, ALUOutM, VGAData,
					WA3W); 

//Writeback

//logic [31:0] ResultW;

Mux2 # (32) mux_wb  (ALUOutW, ReadDataW, MemtoRegW, ResultW);

Hazard_Unit hazard(	RA1E, RA2E, WA3M, WA3W, ra1d, ra2d, WA3E,
							RegWriteM, RegWriteW, MemtoRegE,
							PCSrcD,PCSrcE,PCSrcM,PCSrcW, BranchTakenE,
							ForwardAE, ForwardBE,
							StallF, StallD, FlushE, FlushD);
							
											
								
endmodule
