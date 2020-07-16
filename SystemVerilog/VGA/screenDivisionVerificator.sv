module screenDivisionVerificator(

	input [9:0] h_count,v_count,
	output cross_area
	);
	
	logic [9:0] result1,result2,result3,result4;
	logic comp1,comp2,comp3,comp4;
	
	Comparador #(10) c1(10'b111001100,h_count,comp1,result1);
	Comparador #(10) c2(h_count,10'b111010001,comp2,result2);
	Comparador #(10) c3(10'b100010000,v_count,comp3,result3);
	Comparador #(10) c4(v_count,10'b100010101,comp4,result4);
	
	logic and1, and2;
	
	and n1(and1, comp1, comp2);
	and n2(and2, comp3, comp4);
	
	or n3(cross_area, and1, and2);

endmodule
