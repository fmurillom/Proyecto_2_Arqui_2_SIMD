module debounce(
	input FPGA_Clock, Button, reset,
	output sal
	);
	logic slowClock;
	logic q1,q2;
	clockDivider #(100) (FPGA_Clock,slowClock);
	FlipFlop #(1) ff1(Button,slowClock,reset,1'b1,q1);
	FlipFlop #(1) ff2(q1,slowClock,reset,1'b1,q2);
	FlipFlop #(1) ff3(q2,slowClock,reset,1'b1,sal);

endmodule
