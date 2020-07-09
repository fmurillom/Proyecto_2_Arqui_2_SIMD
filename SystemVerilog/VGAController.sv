module VGAController (input logic Reset,
							input logic Clock25,
							input logic [7:0] Red,
							input logic [7:0] Green,
							input logic [7:0] Blue,
							output logic V_SyncOut,
							output logic H_SyncOut,
							output logic [7:0] RedOut,
							output logic [7:0] GreenOut,
							output logic [7:0] BlueOut,
							output logic [9:0] ColumnOut,
							output logic [9:0] RowOut,
							output logic and_enable);


	//HCount
	logic  [9:0] HCount;
	logic HCount_Reset;
	logic HD,HE,HB,HC;
	
	ContadorNeg #(10) HCount_Contador(Clock25,HCount_Reset,Reset,HCount);
	
	assign HD = HCount[9] & ~HCount[8] & HCount[7] & ~HCount[6] & ~HCount[5] & ~HCount[4] & ~HCount[3] & ~HCount[2] & ~HCount[1] & ~HCount[0];
	
	assign HE = HCount[9] & ~HCount[8] & HCount[7] & ~HCount[6] & ~HCount[5] & HCount[4] & ~HCount[3] & HCount[2] & ~HCount[1] & ~HCount[0];

	assign HB = HCount[9] & ~HCount[8] & HCount[7] & HCount[6] & HCount[5] & HCount[4] & ~HCount[3] & ~HCount[2] & HCount[1] & HCount[0];

	assign HC = HCount[9] & HCount[8] & ~HCount[7] & ~HCount[6] & HCount[5] & ~HCount[4] & ~HCount[3] & ~HCount[2] & ~HCount[1] & ~HCount[0];

	assign HCount_Reset = HC;
	
	//VController
	
	logic  [9:0] VCount;
	logic VCount_Reset;
	logic VR,VS,VP,VQ;
	
	ContadorNeg #(10) VCount_Contador(HC,VCount_Reset,Reset,VCount);
	
	assign VR = ~VCount[9] & VCount[8] & VCount[7] & VCount[6] & VCount[5] & ~VCount[4] & ~VCount[3] & ~VCount[2] & ~VCount[1] & ~VCount[0];
	
	assign VS = ~VCount[9] & VCount[8] & VCount[7] & VCount[6] & VCount[5] & ~VCount[4] & VCount[3] & VCount[2] & VCount[1] & ~VCount[0];

	assign VQ =	VCount[9] & ~VCount[8] & ~VCount[7] & ~VCount[6] & ~VCount[5] & VCount[4] & ~VCount[3] & ~VCount[2] & ~VCount[1] & ~VCount[0];

	assign VP = ~VCount[9] & VCount[8] & VCount[7] & VCount[6] & VCount[5] & VCount[4] & ~VCount[3] & ~VCount[2] & ~VCount[1] & ~VCount[0];
	
	
	assign VCount_Reset = VQ;
	
	//Flip-Flops
	
	logic H_Data_On, V_Data_On;

	FlipFlop_SR HSYNCOUT(HB,HE,H_SyncOut);
	
	FlipFlop_SR VSYNCOUT(VP,VS,V_SyncOut);
	
	FlipFlop_SR HON(HC,HD,H_Data_On);
	
	FlipFlop_SR VON(VQ,VR,V_Data_On);
	
	//Muxes
	
	assign and_enable = H_Data_On & V_Data_On;
	
	always_comb begin
		if (and_enable)
			begin
				RedOut = Red;
				GreenOut = Green;
				BlueOut = Blue;
			end
		else
			begin
				RedOut = 0;
				GreenOut = 0;
				BlueOut = 0;
			end
	end
				
	//Salida Contadores
	assign ColumnOut = HCount;
	assign RowOut = VCount;
	
							
endmodule
