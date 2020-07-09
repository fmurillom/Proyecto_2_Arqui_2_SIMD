module PixProm_testbench();

logic [31:0] Pixout;
logic [7:0] red, green, blue;

PixProm dut(red, green, blue, Pixout);

initial
	begin
	
	red = 8'd0; green = 8'd5; blue = 8'd10;
	#10;
	red = 8'd10; green = 8'd10; blue = 8'd10;
	#10;
	
	end
endmodule
