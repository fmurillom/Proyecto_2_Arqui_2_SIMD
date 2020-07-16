module hsync_generatorTB();
 reg clockin;
 logic [9:0] h_out;
 logic vga_hs;
 
 

 vsync_generator uut (clockin,h_out,vga_hs);
 initial begin
  clockin = 0;
  forever #20000 clockin = ~clockin;
 end      
endmodule
