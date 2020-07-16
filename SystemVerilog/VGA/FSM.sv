module FSM(
	input clk,
	input rst,
	input button,
	output logic [1:0] S
);

	logic [1:0] state;
	logic [1:0] next_state;
	
	//Sequential logic
	
	always_ff @(posedge clk, posedge rst)
		begin
			if (rst) begin
				state<= 2'b00;
				S<=2'b00;
				end
			else begin 
				state<=next_state;
				S<=next_state;
				end
		end
		
	
	//Combinatioanl Logic
	always_comb
		begin
			case(state)
			3'b00: begin
				if(!button) begin 
					next_state= 3'b10;
					end
				else begin
					next_state=3'b00;
					end
				end
				
			3'b01: begin
				if(!button) begin
					next_state= 3'b11;
					end
				else begin 
					next_state=3'b01;
					end
				end
			3'b10: begin
				if(!button) begin 
					next_state= 3'b01;
					end
				else begin 
					next_state=3'b10;
					end
				end
			3'b11: begin
				if(!button) begin 
					next_state= 3'b00;
					end
				else begin 
					next_state=3'b11;
					end
				end
			endcase
		end
endmodule 