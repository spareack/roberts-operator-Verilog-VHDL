`timescale 1ns / 1ns

module Top(
	clk,
	data_in,
	data_out,
	element,
	outmatrix
);
input clk, data_in, data_out;
input [7:0] element;
output reg [7:0] outmatrix;

reg [7:0] mem [63:0];
reg [7:0] result [63:0];
wire [7:0] wres [63:0];
wire [7:0] Wadr, Radr;

counter countin(
	.clk(clk),
	.reset(!data_in),
	.counter(Wadr)
);

counter countout(
	.clk(clk),
	.reset(!data_out),
	.counter(Radr)
);

genvar i;
generate for(i = 0; i < 6; i = i + 1) begin : first_6_roberts
	robert Robert(
		.clk(clk),
		.p0(mem[i]), 
		.p1(mem[i+1]), 
		.p2(mem[i+2]), 
		.p3(mem[i+8]), 
		.p4(mem[i+9]),
		.p5(mem[i+10]), 
		.p6(mem[i+16]), 
		.p7(mem[i+17]), 
		.p8(mem[i+18]), 
		.out(wres[i+9])
	);
end endgenerate

generate for(i = 8; i < 14; i = i + 1) begin : second_6_roberts
	robert Robert(
		.clk(clk),
		.p0(mem[i]), 
		.p1(mem[i+1]), 
		.p2(mem[i+2]), 
		.p3(mem[i+8]), 
		.p4(mem[i+9]),
		.p5(mem[i+10]), 
		.p6(mem[i+16]), 
		.p7(mem[i+17]), 
		.p8(mem[i+18]), 
		.out(wres[i+9])
	);
end endgenerate

generate for(i = 16; i < 22; i = i + 1) begin : third_6_roberts
	robert Robert(
		.clk(clk),
		.p0(mem[i]), 
		.p1(mem[i+1]), 
		.p2(mem[i+2]), 
		.p3(mem[i+8]), 
		.p4(mem[i+9]),
		.p5(mem[i+10]), 
		.p6(mem[i+16]), 
		.p7(mem[i+17]), 
		.p8(mem[i+18]), 
		.out(wres[i+9])
	);
end endgenerate

generate for(i = 24; i < 30; i = i + 1) begin : fourth_6_roberts
	robert Robert(
		.clk(clk),
		.p0(mem[i]), 
		.p1(mem[i+1]), 
		.p2(mem[i+2]), 
		.p3(mem[i+8]), 
		.p4(mem[i+9]),
		.p5(mem[i+10]), 
		.p6(mem[i+16]), 
		.p7(mem[i+17]), 
		.p8(mem[i+18]), 
		.out(wres[i+9])
	);
end endgenerate

generate for(i = 32; i < 38; i = i + 1) begin : fifth_6_roberts
	robert Robert(
		.clk(clk),
		.p0(mem[i]), 
		.p1(mem[i+1]), 
		.p2(mem[i+2]), 
		.p3(mem[i+8]), 
		.p4(mem[i+9]),
		.p5(mem[i+10]), 
		.p6(mem[i+16]), 
		.p7(mem[i+17]), 
		.p8(mem[i+18]), 
		.out(wres[i+9])
	);
end endgenerate

generate for(i = 40; i < 46; i = i + 1) begin : last_6_roberts
	robert Robert(
		.clk(clk),
		.p0(mem[i]), 
		.p1(mem[i+1]), 
		.p2(mem[i+2]), 
		.p3(mem[i+8]), 
		.p4(mem[i+9]),
		.p5(mem[i+10]), 
		.p6(mem[i+16]), 
		.p7(mem[i+17]), 
		.p8(mem[i+18]), 
		.out(wres[i+9])
	);
end endgenerate

always @(posedge clk)begin
	if(data_in)
		mem[Wadr] <= element;
	else if(data_out)
		outmatrix <= result[Radr];
end

always @(posedge clk)
begin
	result[0] = wres[0]; result[16] = wres[16]; result[32] = wres[32]; result[48] = wres[48];
	result[1] = wres[1]; result[17] = wres[17]; result[33] = wres[33]; result[49] = wres[49];
	result[2] = wres[2]; result[18] = wres[18]; result[34] = wres[34]; result[50] = wres[50];
	result[3] = wres[3]; result[19] = wres[19]; result[35] = wres[35]; result[51] = wres[51];
	result[4] = wres[4]; result[31] = wres[31]; result[36] = wres[36]; result[52] = wres[52];
	result[5] = wres[5]; result[20] = wres[20]; result[37] = wres[37]; result[53] = wres[53];
	result[6] = wres[6]; result[21] = wres[21]; result[38] = wres[38]; result[54] = wres[54];
	result[7] = wres[7]; result[22] = wres[22]; result[39] = wres[39]; result[55] = wres[55];
	result[8] = wres[8]; result[23] = wres[23]; result[40] = wres[40]; result[56] = wres[56];
	result[9] = wres[9]; result[24] = wres[24]; result[41] = wres[41]; result[57] = wres[57];
	result[10] = wres[10]; result[25] = wres[25]; result[42] = wres[42]; result[58] = wres[58];
	result[11] = wres[11]; result[26] = wres[26]; result[43] = wres[43]; result[59] = wres[59];
	result[12] = wres[12]; result[27] = wres[27]; result[44] = wres[44]; result[60] = wres[60];
	result[13] = wres[13]; result[28] = wres[28]; result[45] = wres[45]; result[61] = wres[61];
	result[14] = wres[14]; result[29] = wres[29]; result[46] = wres[46]; result[62] = wres[62];
	result[15] = wres[15]; result[30] = wres[30]; result[47] = wres[47]; result[63] = wres[63];
end
endmodule