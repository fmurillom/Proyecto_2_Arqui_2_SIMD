module hdisplayareaverificator(
	input [9:0] h_count,
	output h_display_area
	);
	
	logic [1:0] carrys;
	logic [9:0] res1, res2;
	Comparador #(10) c1(10'b10001111,h_count,carrys[0],res1);
	Comparador #(10) c2(h_count,10'h30A,carrys[1],res2);
	
	and n1(h_display_area,carrys[0],carrys[1]);

	
endmodule
