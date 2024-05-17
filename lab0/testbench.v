// Ryan Joseph Talalai
// CMPEN 417 SP24
// 21 January 2024

module test;

  reg clk;
  reg reset;

  wire [7:0]output_count;
  
//instantiate your counter here (the module counter, not module top)
  counter tb_counter(
      .clk(clk),
      .rst(reset),
      .number(output_count)
  );
//
//create a clock signal using always block constraint_mode

always
#10 clk = ~clk;

//


initial begin
clk = 0;  
// set reset at cycle 0 and also cycle 23 here
if (output_count == 0)
   reset <= 1;
else if (output_count == 23)
   reset <= 1;
   
   #10 $finish;
   
end


endmodule


