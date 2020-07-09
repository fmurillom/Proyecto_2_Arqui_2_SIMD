module SuperALU_tb ();


logic [2:0] Control;
logic [31:0] A,B,Result;
logic [3:0] Flags;

SuperALU DUT (A,B,Control, Flags, Result);

initial 
	begin
		$display("Testbench para Umbral");
		Control = 3'b110; A = 32'd10; B = 32'd10; 
		#10
		#10;
		Control = 3'b110; A = 32'd1; B = 32'd10; 
		#10
		#10;
		Control = 3'b110; A = 32'd7; B = 32'd5; 
		#10
		#10;
		Control = 3'b110; A = 32'd4; B = 32'd5; 
		#10
		#10;
	
		$display("Testbench para PixProm");
		Control = 3'b101; A = 32'h000A0A0A;
		#10
		#10;
		Control = 3'b101; A = 32'h000A0500;
		#10
		#10;
		Control = 3'b101; A = 32'h00505003;
		#10
		#10;
		Control = 3'b101; A = 32'h000A0908;
		#10
		#10;
	
		$display("Testbench para Multiplicar");
		Control = 3'b100; A = 32'd10; B = 32'd10; 
		#10
		#10;
		Control = 3'b100; A = 32'd1; B = 32'd1; 
		#10
		#10;
		Control = 3'b100; A = 32'd7; B = 32'd5; 
		#10
		#10;
		Control = 3'b100; A = 32'd20; B = 32'd7; 
		#10
		#10;
	
		$display("Testbench para Sumador");
		Control = 3'b000; A = 32'b0001; B = 32'b1110; 
		#10
		#10;
		Control = 3'b000; A = 32'b0000; B = 32'b0000; 
		#10
		#10;
		Control = 3'b000; A = 32'b0001; B = 32'b1111; 
		#10
		#10;
		Control = 3'b000; A = 32'b0100; B = 32'b0101; 
		#10
		#10;
		
		$display("Testbench para Restador");
		Control = 3'b001; A = 32'b0010; B = 32'b0001; 
		#10;
		#10;
		Control = 3'b001; A = 32'b0000; B = 32'b1101; 
		#10;
		#10;
		Control = 3'b001; A = 32'b0111; B = 32'b0010; 
		#10;
		#10;
		Control = 3'b001; A = 32'b0100; B = 32'b0010; 
		#10;
		#10;
		Control = 3'b001; A = 32'b0100; B = 32'b0100; 
		#10;
		#10;
		
		$display("Testbench para AND");
		Control = 3'b010; A = 32'b0100; B = 32'b0010; 
		#10;
		#10;
		Control = 3'b010; A = 32'b0110; B = 32'b0010; 
		#10;
		#10;
		
		$display("Testbench para OR");
		Control = 3'b011; A = 32'b0001; B = 32'b1110;
		#10
		#10;
		Control = 3'b011; A = 32'b1001; B = 32'b0101; 
		#10
		#10;
		Control = 3'b011; A = 32'b0111; B = 32'b0100;
		#10
		#10;
		Control = 3'b011; A = 32'b0011; B = 32'b0011; 
		#10
		#10;
		
	end

endmodule 