// Ryan Joseph Talalai
// CMPEN 417 SP24
// 21 January 2024

module top(
    input clk,
    input rst,
    output [7:0] count
);
wire slow_clock;

clock_divider i_clock_divider(
    .clk(clk),
    .new_clk(slow_clock)
);

//instantiate your counter here

counter i_counter(
    .clk(slow_clock),
    .rst(rst),
    .number(count)
);


endmodule