module spriteLoader(
	input FPGA_Clock,
	output reg [7:0] VGA_R,VGA_G,VGA_B
	);

	reg [7:0] redRam [0:1024];
	reg [7:0] greenRam [0:1024];
	reg [7:0] blueRam [0:1024];
	logic [0:3]index=4'b0000;
	
	initial begin
		$readmemb("C:/Users/Marco FG/Documents/Taller/Lab5/RED.txt", redRam);
		$readmemb("C:/Users/Marco FG/Documents/Taller/Lab5/GREEN.txt", greenRam);
		$readmemb("C:/Users/Marco FG/Documents/Taller/Lab5/BLUE.txt", blueRam);
	end
	
	always @ (posedge FPGA_Clock)
	begin
		VGA_R = redRam [index];
		VGA_G = greenRam [index];
		VGA_B = blueRam [index];
		index = index + 4'b0001;
	end
endmodule
