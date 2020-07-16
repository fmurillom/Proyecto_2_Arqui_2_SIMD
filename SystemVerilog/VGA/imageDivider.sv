module imageDivider(
	input FPGA_Clock, enable, selected,
	input [9:0] h_count,v_count,
	output reg [7:0] R,G,B,
	output [1:0] cuadrante
	//output [9:0] hc,vc
);

	logic dividedClock;
	clockDivider #(2) cd1(FPGA_Clock,dividedClock);

	
	logic [9:0] reset5,reset6;
	logic [1:0] mit=2'b00;
	Comparador #(10) mitadHorizontal(10'b111001100,h_count,mit[0],reset5);
	Comparador #(10) mitadVertical(10'b100010000,v_count,mit[1],reset6);
	assign cuadrante=mit;
	always @ (posedge dividedClock)
	begin
		if(enable)
			begin
				case(mit)
					2'b00:begin
							R=8'b11111111;
							G=8'b00000000;
							B=8'b00000000;
							end
					2'b01:begin
							R=8'b00000000;
							G=8'b11111111;
							B=8'b00000000;
						end
					2'b10:begin
							R=8'b00000000;
							G=8'b00000000;
							B=8'b11111111;
						end
					2'b11:begin
							R=8'b11111111;
							G=8'b11111111;
							B=8'b11111111;
						end
					default:begin
							R=8'b00000000;
							G=8'b00000000;
							B=8'b00000000;
						end
				endcase
			end
			else
				begin
					R=8'b00010000;
					G=8'b00010000;
					B=8'b00010000;
				end
	end

endmodule
