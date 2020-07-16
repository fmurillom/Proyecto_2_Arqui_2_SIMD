module Substractor #(parameter N=11)
	(
	input [N-1:0] ValueA, ValueB,
	output [N-1:0] Result
	);
	logic carrys;
	logic [N-1:0] temp_result;
	
	Comparador #(N) comp(ValueA,ValueB,carrys,temp_result);
	Complemento2 #(N) complement(temp_result,carrys,Result);

endmodule
