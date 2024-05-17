`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Ryan Joseph Talalai 
// CMPEN 417 SP24
// 11 March 2024
//////////////////////////////////////////////////////////////////////////////////

module complex_multiplier(
    input clk,
    input reset,
    input output_ready,
    output reg output_valid,
    input input_valid,
    output reg input_ready,
    
    input [15:0] ar,
    input [15:0] ai,
    input [15:0] br,
    input [15:0] bi,
    
    output reg signed [31:0] result_r,
    output reg signed [31:0] result_i
);

    // STATES
    localparam IDLE = 2'b00, RECEIVE = 2'b01, CALCULATION = 2'b10, OUTPUT = 2'b11;
    reg [1:0] state = IDLE;

    // Pipleline registers
    reg signed [31:0] ar_br, ai_bi, ar_bi, ai_br;


    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            output_valid <= 0;
            input_ready <= 1;
            result_r <= 0;
            result_i <= 0;
        end else
        
            begin        
            case (state)
                IDLE: begin
                    if (input_valid && input_ready) begin
                        ar_br <= ar * br;
                        ai_bi <= ai * bi;
                        ar_bi <= ar * bi;
                        ai_br <= ai * br;
                        state <= RECEIVE;
                        input_ready <= 0;
                    end
                end
                
                RECEIVE: begin
                    state <= CALCULATION;
                end
                
                CALCULATION: begin
                    result_r <= ar_br - ai_bi;
                    result_i <= ar_bi + ai_br;
                    state <= OUTPUT;
                    output_valid <= 1;
                end
                
                OUTPUT: begin
                    if (output_ready) begin
                        output_valid <= 0;
                        input_ready <= 1;
                        state <= IDLE;
                    end
                end
                
                default: state <= IDLE;
            endcase
        end
    end
endmodule
