module spritePositionVerificator(
	input [9:0] x_pos, y_pos,
	input [9:0] h_count, v_count,
	output visible,
	output [9:0] i_pos,j_pos
	);
//	userSelectionVerificator #(10) usv(h_count,v_count,x_pos, y_pos,10'b10000000,10'b10000000,visible);
	userSelectionVerificator #(10) usv(h_count,v_count,x_pos, y_pos,10'b101,10'b101,visible);
	
	
	logic carry1,carry2;
	Comparador #(10) c1(h_count,x_pos,carry1,i_pos);
	Comparador #(10) c2(v_count,y_pos,carry2,j_pos);
	
	
endmodule
