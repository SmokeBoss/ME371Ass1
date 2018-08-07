module assignment2(
	input [16:0] SW,
	output [7:0] LEDR
);
	wire [7:0] x;
	wire [7:0] y;
	wire s;
	
	assign x = SW[7:0];
	assign y = SW[15:8];
	assign s = SW[16];
	assign LEDR = (~{8{s}} & x) | ({8{s}} & y); //Replication operator used for s
	
endmodule