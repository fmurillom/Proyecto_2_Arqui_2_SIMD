module pokeballColorDecoder(
	input [2:0] codedColor,
	output logic [23:0] RGB
	);
always_comb
case(codedColor)
	3'b000: //Fondo
			RGB=24'h000000;
	3'b001: //Blanco
			RGB=24'hf2f2f2;
	3'b010: //Negro
			RGB=24'h000000;
	3'b011: //Gris
			RGB=24'hcecece;
	3'b100: //Rojo
			RGB=24'hff0000;
	default:
			RGB=24'h000000;
endcase
endmodule
