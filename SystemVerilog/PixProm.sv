module PixProm (	input logic [7:0] red, green, blue,
						output logic [31:0] Pixout);
												

logic [7:0] promedio;
assign promedio = (red+green+blue)/3;

assign Pixout[7:0] = promedio;
assign Pixout[15:8] = promedio;
assign Pixout[23:16] = promedio;
assign Pixout[31:24] = 8'b0;


endmodule
