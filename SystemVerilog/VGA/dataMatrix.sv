module dataMatrix(
	input [9:0] i_pos,j_pos,
	output [15:0] contador
	);
	
	logic [15:0] temp1;
	logic [15:0] width = 16'b1001011000;
	
	assign temp1 = j_pos*width;
	
	assign contador = i_pos + temp1;
	
			
endmodule