module VGA_Controller(
	input FPGA_Clock,
	input [7:0] R,G,B,
	output [7:0] VGA_R,VGA_G,VGA_B,
	output VGA_Clock, 
	output VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS,
	output [9:0] H_COUNT,V_COUNT
	);

	logic dividedClock;
	clockDivider #(2) cd1(FPGA_Clock,dividedClock);
	assign VGA_Clock= dividedClock;
	
	logic ENABLE;
	logic VGA_HS_TEMP;
	
	logic [9:0]H_COUNT_TEMP;
	
	hsync_generator hsg(dividedClock, H_COUNT_TEMP, VGA_HS_TEMP, ENABLE);
	assign VGA_HS=VGA_HS_TEMP;
	assign H_COUNT=H_COUNT_TEMP;
		
	logic [9:0] V_COUNT_TEMP;
	logic VGA_VS_TEMP;
	vsync_generator vsg(ENABLE, V_COUNT_TEMP, VGA_VS_TEMP);
	assign VGA_VS=VGA_VS_TEMP;
	assign V_COUNT=V_COUNT_TEMP;

	displayAreaVerificator dav(H_COUNT_TEMP,V_COUNT_TEMP,VGA_BLANK_N);
	
		
	and n1(VGA_SYNC_N,VGA_HS_TEMP,VGA_VS_TEMP);
	
	
	assign VGA_R=R;
	assign VGA_G=G;
	assign VGA_B=B;
	
endmodule
