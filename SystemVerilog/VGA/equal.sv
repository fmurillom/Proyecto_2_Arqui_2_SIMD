module equal 
	(input [1:0] A,B,
	 output S
	);
	
	logic res [3:0];
	
	xnor xn1(res[0],A[0],B[0]);
	xnor xn2(res[1],A[1],B[1]);
	
	and n1(S,res[0],res[1]);

endmodule
