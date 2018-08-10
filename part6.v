module part6 (SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input [17:0] SW; 
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX2;
	output [0:6] HEX3;
	output [0:6] HEX4;
	output [0:6] HEX5;
	output [0:6] HEX6;
	output [0:6] HEX7;
	
	wire [2:0] Blank;
	assign Blank[0] = 1;
	assign Blank[1] = 1;
	assign Blank[2] = 1;

	wire [2:0] M0;
	mux_3bit_8to1 MX0 (SW[17:15], Blank[2:0], Blank[2:0], Blank[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[2:0], M0);
	wire [2:0] M1;
	mux_3bit_8to1 MX1 (SW[17:15], Blank[2:0], Blank[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[2:0], Blank[2:0], M1);
	wire [2:0] M2;
	mux_3bit_8to1 MX2 (SW[17:15], Blank[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[2:0], Blank[2:0], Blank[2:0], M2);
	wire [2:0] M3;
	mux_3bit_8to1 MX3 (SW[17:15], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[2:0], Blank[2:0], Blank[2:0], Blank[2:0], M3);
	wire [2:0] M4;
	mux_3bit_8to1 MX4 (SW[17:15], SW[11:9], SW[8:6], SW[5:3], SW[2:0], Blank[2:0], Blank[2:0], Blank[2:0], SW[14:12], M4);
	wire [2:0] M5;
	mux_3bit_8to1 MX5 (SW[17:15], SW[8:6], SW[5:3], SW[2:0], Blank[2:0], Blank[2:0], Blank[2:0], SW[14:12], SW[11:9], M5);
	wire [2:0] M6;
	mux_3bit_8to1 MX6 (SW[17:15], SW[5:3], SW[2:0], Blank[2:0], Blank[2:0], Blank[2:0], SW[14:12], SW[11:9], SW[8:6], M6);
	wire [2:0] M7;
	mux_3bit_8to1 MX7 (SW[17:15], SW[2:0], Blank[2:0], Blank[2:0], Blank[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], M7);

	char_7seg1 H0 (M7, HEX0); 
	char_7seg1 H1 (M6, HEX1);
	char_7seg1 H2 (M5, HEX2);
	char_7seg1 H3 (M4, HEX3);
	char_7seg1 H4 (M3, HEX4);
	char_7seg1 H5 (M2, HEX5);
	char_7seg1 H6 (M1, HEX6);
	char_7seg1 H7 (M0, HEX7);
	
	
endmodule


module mux_3bit_8to1 (S, A, B, C, D, E, F, G, H, M);
	input [2:0] S, A, B, C, D, E, F, G, H;
	output [2:0] M;
	
	wire [2:0] mux1;
	wire [2:0] mux2;
	wire [2:0] mux3;
	wire [2:0] mux4;
	wire [2:0] mux5;
	wire [2:0] mux6;

	assign mux1 = ((~{3{S[0]}} & A) | ({3{S[0]}} & B));
	assign mux2 = ((~{3{S[0]}} & C) | ({3{S[0]}} & D));
	assign mux3 = ((~{3{S[0]}} & E) | ({3{S[0]}} & F));
	assign mux4 = ((~{3{S[0]}} & G) | ({3{S[0]}} & H));
	assign mux5 = ((~{3{S[1]}} & mux1) | ({3{S[1]}} & mux2));
	assign mux6 = ((~{3{S[1]}} & mux3) | ({3{S[1]}} & mux4));
	assign M = ((~{3{S[2]}} & mux5) | ({3{S[2]}} & mux6));
		
endmodule


module char_7seg1 (C, Display);
	input [2:0] C; 
	output [0:6] Display;
	
	assign Display[0] = ~(C[0] & ~C[2]);
	assign Display[1] = ~((~C[0] & ~C[1] & ~C[2]) | (C[0] & C[1] & ~C[2]));
	assign Display[2] = Display[1];
	assign Display[3] = ~((~C[2] & C[1]) | (~C[2] & C[0]));
	assign Display[4] = C[2];
	assign Display[5] = Display[4];
	assign Display[6] = ~(~C[1] & ~C[2]);

endmodule
