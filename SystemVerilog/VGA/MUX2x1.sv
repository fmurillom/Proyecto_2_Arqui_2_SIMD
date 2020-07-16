module MUX2x1 #(parameter nbits= 8)(
	input [nbits-1:0] ExponenteA, ExponenteB,
	input Selector,
	output [nbits-1:0] ExponenteS
	);
	
	logic notSel;
	logic [nbits-1:0] and1, and2;
	
	not n1(notSel,Selector);
	
	genvar i;
	generate
		for (i=0; i<nbits ; i++)begin :forloop
			and(and1[i],ExponenteA[i],notSel);
			and(and2[i],ExponenteB[i],Selector);
		end
		
		for (i=0;i<nbits ; i++)begin :forloop2
			or(ExponenteS[i],and1[i],and2[i]);
		end
	endgenerate
	
endmodule
