module VGAController_tb();
logic clk, reset, vSync, hSync, and_enable;
logic [7:0] red, green, blue, redout, greenout, blueout;
logic [9:0] colout, rowout;

VGAController DUT (reset, clk, red, green, blue, vSync, hSync, redout, greenout, blueout, colout, rowout,and_enable);

initial begin
	clk=0; reset=0;
	#10
	green=8'b11111111;
	red=8'b00000000;
	blue=8'b00000000;
	#10
	green=8'b00000000;
	red=8'b11111111;
	blue=8'b00000000;
	#10;
end
always
	#40 clk=~clk; // Codigo para la senal de reloj que cambia cada 5
	initial
	#160000000 $stop; // Despues de 150 el testbench se detiene para que no corra infinitamente
endmodule