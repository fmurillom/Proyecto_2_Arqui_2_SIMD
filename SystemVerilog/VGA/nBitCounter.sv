module nBitCounter #(parameter n=3)( 
	input clk, rst_n,
	output logic [n-1:0] count
	);
	
	//output reg [n-1:0] count;
  //input clk;
  //input rst_n;
 
  // Set the initial value
  initial
    count = 0;
 
  // Increment count on clock
  always @(posedge clk or posedge rst_n)
    if (rst_n)
      count = 0;
    else
      count = count + 1;
 
endmodule