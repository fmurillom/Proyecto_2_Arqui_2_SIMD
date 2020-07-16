module ColorDecoder(
	input [7:0] codedColor,
	output logic [23:0] RGB
	);
	
always_comb

begin
	RGB[23:16]=codedColor;
	RGB[15:8]=codedColor;
	RGB[7:0]=codedColor;
end

endmodule
