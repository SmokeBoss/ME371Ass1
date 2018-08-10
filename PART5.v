module PART5 (SW, HEX0, HEX1, HEX2, HEX3, HEX4);
	input [17:0] SW; 
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX2;
	output [0:6] HEX3;
	output [0:6] HEX4;

	wire [2:0] M0;
	mux_3bit_5to1 MX0 (SW[17:15], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[2:0], M0);
	wire [2:0] M1;
	mux_3bit_5to1 MX1 (SW[17:15], SW[11:9], SW[8:6], SW[5:3], SW[2:0], SW[14:12], M1);
	wire [2:0] M2;
	mux_3bit_5to1 MX2 (SW[17:15], SW[8:6], SW[5:3], SW[2:0], SW[14:12], SW[11:9], M2);
	wire [2:0] M3;
	mux_3bit_5to1 MX3 (SW[17:15], SW[5:3], SW[2:0], SW[14:12], SW[11:9], SW[8:6], M3);
	wire [2:0] M4;
	mux_3bit_5to1 MX4 (SW[17:15], SW[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], M4);

	char_7seg H0 (M0, HEX4);
	char_7seg H1 (M1, HEX3);
	char_7seg H2 (M2, HEX2);
	char_7seg H3 (M3, HEX1);
	char_7seg H4 (M4, HEX0);
	
endmodule


module mux_3bit_5to1 (S, U, V, W, X, Y, M);
	input [2:0] S, U, V, W, X, Y;
	output [2:0] M;
	
	assign M = ((~{3{S[2]}} & ((~{3{S[1]}} & ((~{3{S[0]}} & U) | ({3{S[0]}} & V))) | ({3{S[1]}} & ((~{3{S[0]}} & W) | ({3{S[0]}} & X))))) | ({3{S[2]}} & Y));
endmodule


module char_7seg (C, Display);
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