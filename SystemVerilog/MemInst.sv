module MemInst(input logic [31:0] a,
				output logic [25:0] rd);

logic [25:0] RAM[255:0];

initial
	$readmemh("D:\\ArquiII\\Proyecto#2\\instrucciones.txt",RAM);
	assign rd = RAM[a[31:2]]; // word aligned

endmodule