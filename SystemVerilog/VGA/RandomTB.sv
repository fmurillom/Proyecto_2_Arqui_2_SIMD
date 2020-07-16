module RandomTB();

	logic clk, rst,stop;
	logic [1:0] random;
	
	Random ran(clk,rst,random);
	
	initial begin
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;

	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	clk =0; rst=0; #10;
	clk =1; rst=0; #10;
	
	end

	
endmodule
