module VGA_ControllerTB();

	logic FPGA_Clock;
	logic [7:0] R,G,B;
	logic [7:0] VGA_R,VGA_G,VGA_B;
	logic VGA_Clock, VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS;
	logic [9:0] H_COUNT,V_COUNT;

	VGA_Controller uut(FPGA_Clock,R,G,B,VGA_R,VGA_G,VGA_B,VGA_Clock, VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS,H_COUNT,V_COUNT);
	
	initial begin
	R=8'b0;
	G=8'b1;
	B=8'b0;
	
	FPGA_Clock = 0;
	forever #10000 FPGA_Clock = ~FPGA_Clock;
	end

endmodule
