module mainControllerTB();

	logic FPGA_Clock;
	logic [7:0] VGA_R,VGA_G,VGA_B;
	logic VGA_Clock, LED_Sleep;
	logic VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS;
	integer f, count;
	
	mainController main(FPGA_Clock,VGA_R,VGA_G,VGA_B,VGA_Clock,LED_Sleep,VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS, visible);
	

	initial begin
		FPGA_Clock = 0;
		f = $fopen("D:\\ArquiII\\Pixeles\\output.txt","w");
		count = 0;
		forever begin
			#10 FPGA_Clock = ~FPGA_Clock;
			if (visible == 1) begin
				count = count + 1;
				if (count == 4) begin
					$fwrite(f,"VGA CLK %b\n",VGA_Clock);
					$fwrite(f,"HSYNC %b\n",VGA_HS);
					$fwrite(f,"VSYNC %b\n",VGA_VS);
					$fwrite(f,"R %b\n",VGA_R);
					$fwrite(f,"G %b\n",VGA_G);
					$fwrite(f,"B %b\n",VGA_B);
					count = 0;
				end
			end
		end
		
		
	end

endmodule