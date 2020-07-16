module MemInst(input logic [31:0] a,
				output logic [26:0] rd);

logic [26:0] RAM[255:0];

initial
	$readmemh("D:\\ArquiII\\GitVersion\\Proyecto_2_Arqui_2_SIMD\\SystemVerilog\\instrucciones.txt",RAM);
	assign rd = RAM[a[31:2]]; // word aligned

endmodule