// Ryan Joseph Talalai
// CMPEN 417 SP24
// 21 January 2024

module counter(
    input clk,
    input rst,
    output reg[7:0] number
);

// put your code here

    always@(posedge clk or posedge rst) begin
        if (rst) begin
            number <= 8'b0;
        end else begin
            number <= number + 1'b1;
        end
    end
endmodule