module vdisplayareaverificator(
	input [9:0] v_count,
	output v_display_area
	);
	
	logic [1:0] carrys;
	logic [9:0] res1, res2;
	Comparador #(10) c1(10'b100011,v_count,carrys[0],res1);
	Comparador #(10) c2(v_count,10'b1000000011,carrys[1],res2);
	
	and n1(v_display_area,carrys[0],carrys[1]);

	
endmodule
