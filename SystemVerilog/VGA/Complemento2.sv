module Complemento2 #(parameter N=11) 
	( 
	input [N-1:0] Exponente,
	input val,
	output reg [N-1:0] S
	);
	always @(val )
	begin

		if(val==1)begin
			S=~Exponente+1;
		end
		else begin
			S= Exponente;
		end
	end
endmodule
