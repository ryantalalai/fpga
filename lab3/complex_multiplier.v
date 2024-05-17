`timescale 1ns / 1ps

module complex_multiplier (
    input clk,
    input signed [15:0] ar, ai,
    input signed [15:0] br, bi,
    output signed [31:0] pr, pi
    );

    wire signed [31:0] ar_br, ai_bi, ar_bi, ai_br;
    
    // DSP slices for multiplication
    assign ar_br = ar * br;
    assign ai_bi = ai * bi;
    assign ar_bi = ar * bi;
    assign ai_br = ai * br;
    
    assign pr = ar_br - ai_bi; // Real part of product
    assign pi = ar_bi + ai_br; // Imaginary part of product

endmodule
