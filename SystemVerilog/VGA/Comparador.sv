module Comparador #(parameter N=11) 
	( 
	input [N-1:0] Contador, Constante,
	output Cout,
	output [N-1:0] S
	); 
	logic [N-1:0] carrys;
	assign carrys[0]=0;
	genvar i;
	generate
		for (i=0; i<N ; i++)begin :forloop
			if(i==N-1) begin
				Restador i1(Contador[i],Constante[i],carrys[i],S[i],Cout);
			end
			else begin
				Restador i2(Contador[i],Constante[i],carrys[i],S[i],carrys[i+1]);
			end

		end
		
	endgenerate

	
	
endmodule

