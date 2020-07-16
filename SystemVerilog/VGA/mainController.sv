module mainController(
	input FPGA_Clock,
	input [7:0] R_IN, G_IN, B_IN,
	output [7:0] VGA_R,VGA_G,VGA_B,
	output VGA_Clock, LED_Sleep,
	output VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS,
	output visible

);
	logic [7:0] R,G,B;
	logic VGA_BLANK_N_TEMP;
	logic [9:0] h_count, v_count;
	logic [1:0] cuadrante;
	logic [1:0] FSM_state;
	logic [23:0] Black=24'h000000;
	logic [23:0] Gray=24'b111111110000000000000000;
	logic user_area;
	logic [9:0] X_POS_User,Y_POS_User;
	logic [9:0] X_POS_Sprite,Y_POS_Sprite;
	logic [9:0] X_POS_Win=10'd446;
	logic [9:0] Y_POS_Win=10'd259;
	logic cross_area;
	logic [23:0] resultMUX;
	logic [23:0] RGB_temp1;
	logic [1:0] random_Num;
	logic [23:0] RGB_Sprite;
	logic [23:0] RGB_Sprite2;
	logic [23:0] RGB_WinSprite;
	logic visible_Sprite;
	logic show;
	logic [23:0] RGB;
	logic timeUP;
	logic showSpriteTimer;
	logic winner;
	logic finalSelector;
	logic visible_winSprite;
	//FSM maquina(ButtonFSM,SwitchReset,1'b0,FSM_state);
	
	sleep timer(FPGA_Clock,LED_Sleep,timeUP);
	
	assign RGB_Sprite = {R_IN, G_IN, B_IN};


	SpriteCharacter sc(FPGA_Clock, 10'b010011000,10'b00101000,h_count, v_count,RGB_Sprite2,visible_Sprite);


	or timerSprite(showSpriteTimer,1,timeUP);	
	and showSprite(show, visible_Sprite,1,showSpriteTimer);
	
	MUX2x1 #(24) MUX(Gray,RGB_Sprite,show,resultMUX);
	

	VGA_Controller vgac(FPGA_Clock,R,G,B,VGA_R,VGA_G,VGA_B,VGA_Clock,VGA_SYNC_N, VGA_BLANK_N_TEMP, VGA_HS, VGA_VS, h_count, v_count);

	
	assign R=resultMUX[23:16];
	assign G=resultMUX[15:8];
	assign B=resultMUX[7:0];
	
	assign VGA_BLANK_N=VGA_BLANK_N_TEMP;
	
	assign visible=show;


endmodule 