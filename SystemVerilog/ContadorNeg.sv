module ContadorNeg #(parameter N = 10) (input logic clock,
												input logic reset,
												input logic Manual_Reset,
												output logic [N-1 : 0] cuenta);
	
	logic [N-1:0] temp = 0;
	
	always_ff @(negedge clock)
	begin
		if(reset | Manual_Reset)
			begin
				temp = 0;
			end
		else
			begin
				temp ++;
			end
	end
	
	assign cuenta = temp;
												
endmodule
