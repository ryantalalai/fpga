// Ryan Joseph Talalai
// CMPEN 417 SP24
// 21 January 2024

//send the boards 50MHz clock to this and on the output will be 1Hz clock
module clock_divider(
	input clk,
	output reg new_clk
);
	reg [27:0] counter = 0;
	
	always@(posedge clk)
	begin
		if(counter == 28'd25_000_000)
		begin
			counter <= counter + 1;
			new_clk <= 1;
		end else if(counter == 28'd50_000_000)
		begin
			counter <= 0;
			new_clk <= 0;
		end else begin
			counter <= counter + 1;
			new_clk <= new_clk;
		end
	end
endmodule

