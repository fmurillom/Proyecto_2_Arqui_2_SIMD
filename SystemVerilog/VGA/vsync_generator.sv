module vsync_generator (
	input enable,
	output [9:0] v_count,
	output vga_vs
	);
logic reset=1'b0;
	logic [9:0] v_count_temp;
	nBitCounter #(10) nb1(enable,reset,v_count_temp);
	assign v_count=v_count_temp;
	
	
	logic [9:0] res1;//No se usa
	Comparador #(10) c1(10'b0000000010,v_count_temp,vga_vs,res1);
	
	logic [9:0] res2;//No se usa
	Comparador #(10) c2(10'b1000001101,v_count_temp,reset,res2);
	
	
endmodule
