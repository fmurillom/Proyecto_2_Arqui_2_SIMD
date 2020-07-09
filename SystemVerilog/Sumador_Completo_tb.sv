module Sumador_Completo_tb ();

logic [3:0] A,B,S;
logic Cin,Cout;

Sumador_Completo #(4) DUT (A,B,Cin,S,Cout);

initial 
	begin
		A = 4'b0001; B = 4'b1110; Cin = 0; 
		#10
		assert (S === 4'b1111) $display("Correcto"); else $error("000 failed.");
		assert (Cout === 0) $display("Correcto"); else $error("000 failed.");
		#10;
		A = 4'b0001; B = 4'b1110; Cin = 1; 
		#10
		assert (S === 4'b0000) $display("Correcto"); else $error("000 failed.");
		assert (Cout === 1) $display("Correcto"); else $error("000 failed.");
		#10;
		A = 4'b0010; B = 4'b1110; Cin = 1; 
		#10
		assert (S === 4'b0001) $display("Correcto"); else $error("000 failed.");
		assert (Cout === 1) $display("Correcto"); else $error("000 failed.");
		#10;
		
	end

endmodule 