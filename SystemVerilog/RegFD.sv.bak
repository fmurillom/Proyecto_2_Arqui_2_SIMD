module RegFD (	input logic clk, en, clr,
					input logic [31:0] instF,
					output logic [31:0] instD);
					

always_ff @(posedge clk) begin

	if(clr)begin
				instD <= 32'b0;
		end

	else if (en) instD <= instF;

end

endmodule