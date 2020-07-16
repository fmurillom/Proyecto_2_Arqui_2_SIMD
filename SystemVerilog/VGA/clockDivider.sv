module clockDivider #(parameter DIVISOR = 28'd2)
	(
	input inclok,
	output outclok
    );

logic[27:0] counter=28'd0;

always @(posedge inclok)
begin
 counter <= counter + 28'd1;
 if(counter>=(DIVISOR-1))
  counter <= 28'd0;
end
assign outclok = (counter<DIVISOR/2)?1'b0:1'b1;
endmodule