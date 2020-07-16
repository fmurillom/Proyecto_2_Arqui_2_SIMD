module Random( //Linear Feedback Shift Register
	input clk,rst, stop,
	output reg [1:0] random
	);
	logic [4:0] cable;
	logic gate;
	logic stop_clock;

	initial cable=2'b00000;

	FlipFlop #(2) ffd1(gate,stop_clock,rst,1,cable[0]);
	FlipFlop #(2) ffd2(cable[0],stop_clock,rst,1,cable[1]);
	FlipFlop #(2) ffd3(cable[1],stop_clock,rst,1,cable[2]);
	FlipFlop #(2) ffd4(cable[2],stop_clock,rst,1,cable[3]);
	FlipFlop #(2) ffd5(cable[3],stop_clock,rst,1,cable[4]);
	
	always @(clk)
	begin
		if (stop) begin
			random[0]=cable[3];
			random[1]=cable[2];
			stop_clock=1'b0;
		end
		else begin
			stop_clock=clk;
			random[0]=1'b0;
			random[1]=1'b0;
		end
	end
	
	xnor xn1(gate,cable[2],cable[3],cable[4]);


endmodule
