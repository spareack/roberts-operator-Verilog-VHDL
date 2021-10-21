module counter(
	clk,
	reset,
	counter
);
input clk, reset;
output reg [7:0] counter;

always @(negedge clk) begin
	if(reset)
		counter <= 8'd0;
	else
		counter <= counter + 8'd1;
end
endmodule