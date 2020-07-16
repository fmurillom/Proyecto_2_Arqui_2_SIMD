module imageDividerTB();
	logic FPGA_Clock;
	logic [7:0] VGA_R,VGA_G,VGA_B;
	logic VGA_Clock;
	logic VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS;

	
	mainController uut(FPGA_Clock, VGA_R,VGA_G,VGA_B, VGA_Clock, VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS);

	 initial begin
	  FPGA_Clock = 0;
	  forever #10 FPGA_Clock = ~FPGA_Clock;
	 end    
endmodule
