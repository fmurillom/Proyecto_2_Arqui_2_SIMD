module hsync_generator (
	input vga_clock,
	output [9:0] h_count,
	output vga_hs, enable
	);
logic reset=1'b0;
	logic [9:0] h_count_temp;
	nBitCounter #(10) nb1(vga_clock,reset,h_count_temp);
	assign h_count=h_count_temp;
	
	
	logic [9:0] res1;//No se usa
	Comparador #(10) c1(10'b0001011111,h_count_temp,vga_hs,res1);
	
	logic [9:0] res2;//No se usa
	Comparador #(10) c2(10'b1100011001,h_count_temp,reset,res2);
	assign enable=reset;
	
	
endmodule
