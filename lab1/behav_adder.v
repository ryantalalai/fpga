`timescale 1ns/1ps

module behav_adder
#(parameter WIDTH = 128) (
    input clk,
    input [WIDTH-1:0] A, B,
    input Cin,
    output reg [WIDTH-1:0] S, 
    output reg Cout
);
    always @(posedge clk) begin
        {Cout, S} <= A + B + Cin;
    end

endmodule
