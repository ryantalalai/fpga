`timescale 1ns / 1ps

module part3 (
    input clk,
    input signed [31:0] ar, ai, br, bi,
    output reg signed [63:0] pr, pi
);


reg signed [63:0] arbr, aibi, arbi, aibr;
reg signed [63:0] pr_temp, pi_temp;

always @(posedge clk) begin
    arbr <= ar * br;  // a*c
    aibi <= ai * bi;  // b*d
    arbi <= ar * bi;  // a*d
    aibr <= ai * br;  // b*c
end

always @(posedge clk) begin
    pr_temp <= arbr - aibi;  // (ac - bd)
    pi_temp <= arbi + aibr;  // (ad + bc)
end

always @(posedge clk) begin
    pr <= pr_temp;
    pi <= pi_temp;
end

endmodule
