module clockDividerTB();
 reg clockin;
 logic clockout;

 clockDivider uut (clockin,clockout);
 initial begin
  clockin = 0;
  forever #10 clockin = ~clockin;
 end      
endmodule
