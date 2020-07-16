module changeOrder(
	input [23:0] inArray,
	output [23:0] reverseArray
	);
	
	assign reverseArray [23:16] = inArray [7:0];
	assign reverseArray [15:8] = inArray [15:8];
	assign reverseArray [7:0] = inArray [23:16];

endmodule 