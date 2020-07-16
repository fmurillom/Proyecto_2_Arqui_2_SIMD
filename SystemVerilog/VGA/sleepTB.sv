module sleepTB();
 reg clockin;
 logic clockout,timelimit;

 sleep uut (clockin,clockout,timelimit);
 initial begin
  clockin = 0;
  forever #10 clockin = ~clockin;
 end      
endmodule
