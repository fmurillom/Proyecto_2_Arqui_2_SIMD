module FSMTB();

	logic FPGA_Clock;
	logic rst;
	logic button;
	logic start;
	logic [1:0] S;

	FSM uut(FPGA_Clock,rst,button,start,S);

	initial begin
		FPGA_Clock = 0;
		button=1;
		forever begin
			#20 button =~button;
			#10 FPGA_Clock = ~FPGA_Clock;
		end
		
	end
endmodule
