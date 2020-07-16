module charizardColorDecoder(
	input [7:0] codedColor,
	output logic [23:0] RGB
	);
	
always_comb
//case(codedColor)
//	8'b00000000: //Fondo
//			RGB=24'h000000;
//	8'b00000001: //Negro
//			RGB=24'h303030;
//	8'b00000010: //Naranja
//			RGB=24'h606060;
//	8'b00000011: //Amarillo
//			RGB=24'h7d7d7d;
//	8'b00000100: //Rosado
//			RGB=24'h909090;
//	8'b00000101: //Rosado Oscuro
//			RGB=24'ha8a8a8;		
//	8'b00000110: //Rojo
//			RGB=24'hc5c5c5;
//	8'b00000111: //cafe
//			RGB=24'h67380f;
//	8'b00001000: //Gris
//			RGB=24'hf0f0f0;
//	default:
//			RGB=24'h000000;
//endcase
//case(codedColor)
//default:
begin
	RGB[23:16]=codedColor;
	RGB[15:8]=codedColor;
	RGB[7:0]=codedColor;
end

endmodule
