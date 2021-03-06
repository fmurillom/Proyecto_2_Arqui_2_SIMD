//`timescale 1 ns / 1 ps


module main (addr_in, clk, data_in, wr_en, data_out);
	
	input clk;
   input wr_en;
   input [7:0] data_in;
   input [15:0] addr_in;
    // Outputs
   output logic  [7:0] data_out;
	
	logic [15:0] addr1, addr2, addr3, addr4, addr5;
	
	assign addr1 = addr_in;
	assign addr2 = addr_in - 65536;
	assign addr3 = addr_in - 131072;
	assign addr4 = addr_in - 196608;
	assign addr5 = addr_in - 262144;
	
	
	
	
	logic  [7:0] dataMem1;
	Memoria_1 f0 (addr1, clk, data_in, wr_en, dataMem1);
	
//	logic  [7:0] dataMem2;
//	Memoria_2 f1 (addr2, clk, data_in, wr_en, dataMem2);
//	
//	logic  [7:0] dataMem3;
//	Memoria_3 f2 (addr3, clk, data_in, wr_en, dataMem3);
//	
//	logic  [7:0] dataMem4;
//	Memoria_4 f3 (addr4, clk, data_in, wr_en, dataMem4);
//	
//	logic  [7:0] dataMem5;
//	Memoria_5 f4 (addr5, clk, data_in, wr_en, dataMem5);
	
	
//	always @ (clk)
//    begin
//        case (CMem)
//            1: data_out <= dataMem1;
//				2: data_out <= dataMem2;
//				3: data_out <= dataMem3;
//				4: data_out <= dataMem4;
//				5: data_out <= dataMem5;
//        endcase
//    end

	 always@ (clk)
	 begin
		if (addr_in >= 0 && addr_in <= 65535) begin
			data_out <= dataMem1;
		end
		
//		else if (addr_in >= 65536 && addr_in <= 131071) begin
//			data_out <= dataMem2;
//		end
//			
//		else if (addr_in >= 131072 && addr_in <= 196607) begin
//			data_out <= dataMem3;
//		end
//		
//		else if (addr_in >= 196608 && addr_in <= 262143) begin
//			data_out <= dataMem4;
//		end
//		
//		else if (addr_in >= 262144 && addr_in <= 327679) begin
//			data_out <= dataMem5;
//		end
	 
	 end

     
	
endmodule: main