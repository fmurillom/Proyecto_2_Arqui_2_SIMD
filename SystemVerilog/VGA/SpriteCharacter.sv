module SpriteCharacter(
	input FPGA_Clock,
	input [9:0] x_pos,y_pos,
	input [9:0] h_count,v_count,
	output logic [23:0] RGB,
	output visible
	);
	logic [9:0] i_pos,j_pos;
	logic [7:0] sprite [0:3][0:3];

	assign sprite='{
	'{8'b00000001, 8'b00010000, 8'b11000000, 8'b11101110}, 
	'{8'b00000010, 8'b00100000, 8'b00110000, 8'b01110000}, 
	'{8'b00000100, 8'b01000000, 8'b00001100, 8'b00001110}, 
	'{8'b00001000, 8'b10000000, 8'b00000011, 8'b00000111} 	
	};
	

	logic [7:0] codedColor;
	logic inArea;
	spritePositionVerificator spv(x_pos,y_pos,h_count,v_count,inArea,i_pos,j_pos);
	
//	logic [15:0] contador;
//	logic [7:0] tempData;
//	dataMatrix pos(i_pos, j_pos, contador);
//	
//	main data(contador, FPGA_Clock, 0, 0, TempData);
//	
//	assign codedColor=TempData;
//	
	
	assign codedColor=sprite[j_pos-1][i_pos-1];
	//Comparador igual
	logic res [7:0];
	logic S;
	xnor xn1(res[0],codedColor[0],1'b0);
	xnor xn2(res[1],codedColor[1],1'b0);
	xnor xn3(res[2],codedColor[2],1'b0);
	xnor xn4(res[3],codedColor[3],1'b0);
	
	xnor xn5(res[4],codedColor[4],1'b0);
	xnor xn6(res[5],codedColor[5],1'b0);
	xnor xn7(res[6],codedColor[6],1'b0);
	xnor xn8(res[7],codedColor[7],1'b0);
	
	and n1(S,res[0],res[1],res[2],res[3], res[4],res[5],res[6],res[7]);
//   and n1(S,res[0],res[1],res[2],res[3]);
	
	
	
	logic notS;
	not comparador(notS,S);
	and and1(visible,notS,inArea);
	
	
	
	ColorDecoder decoder(codedColor,RGB);
	
endmodule
