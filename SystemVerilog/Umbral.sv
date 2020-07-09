module Umbral (input logic [31 : 0] Op_A,
					input logic [31 : 0] Op_B,
					output logic [31 : 0] Result);

	always_comb begin
		
			if (Op_A >= Op_B)
			begin
				Result = 32'hffffffff;
			end
			
			else
			begin
				Result = 32'b0;
			end
	end

endmodule 