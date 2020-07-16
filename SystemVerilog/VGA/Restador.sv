module Restador 
	( 
	input X1, X2, Cin, 
	output S, Cout
	);  
	logic a1, a2, a3, a4;
	logic notX1;
	
	not n0(notX1, X1);
	
	xor u1(a1,X1,X2);
	and u2(a2,X2,notX1);
	and u3(a3,notX1,Cin);
	and u4(a4,X2,Cin);
	or u5(Cout,a4,a2,a3);
	xor u6(S,a1,Cin);
	
endmodule
