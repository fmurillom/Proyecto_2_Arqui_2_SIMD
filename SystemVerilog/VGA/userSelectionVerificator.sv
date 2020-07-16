module userSelectionVerificator #(parameter N=10)
	(
	input [N-1:0] h_count,v_count,
	input [N-1:0] x_pos,y_pos,
	input [N-1:0] width, height,
	output user_area
	);
	logic [N-1:0] res1,res2,res3,res4,res5,res6;
	logic carry1,carry2,carry3,carry4,carry5,carry6;
	
	Comparador #(N) c1(x_pos,h_count,carry1,res1);
	Comparador #(N) c2(y_pos,v_count,carry2,res2);
	
	Comparador #(N) c3(h_count,x_pos,carry3,res3);
	Comparador #(N) c4(v_count,y_pos,carry4,res4);
	
	Comparador #(N) c5(res3,width,carry5,res5);
	Comparador #(N) c6(res4,height,carry6,res6);
	
	logic initialLimit, finalLimit;
	and and1(initialLimit,carry1,carry2);
	and and2(finalLimit,carry5,carry6);
	
	and and3(user_area,initialLimit,finalLimit);
	
	
	

endmodule
