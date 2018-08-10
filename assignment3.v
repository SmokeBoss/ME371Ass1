module assignment3(
	input [17:0] SW,
	output [2:0] LEDR
);

	wire s0;
	wire s1;
	wire s2;
	wire [2:0] u;
	wire [2:0] v;
	wire [2:0] w;
	wire [2:0] x;
	wire [2:0] y;
	
	assign s0 = SW[15];
	assign s1 = SW[16];
	assign s2 = SW[17];
	
	assign u = SW[2:0];
	assign v = SW[5:3];
	assign w = SW[8:6];
	assign x = SW[11:9];
	assign y = SW[14:12];
	
	
	
	// assign LEDR = ((~{5{s2}} & ((~{5{s1}} & ((~{5{s0}} & u) | ({5{s0}} & v))) | ({5{s1}} & ((~{5{s1}} & w) | ({5{s1}} & x))))) | ({5{s2}} & ((~{5{s0}} & w) | ({5{s0}} & x))));
	// Assignments
	//LEDR1 = ((~{3{s0}} & u) | ({3{s0}} & v));
	//LEDR2 = ((~{3{s0}} & w) | ({3{s0}} & x));
	//LEDR3 = ((~{3{s1}} & LEDR1) | ({3{s1}} & LEDR2));
	//LEDR5 = ((~{3{s2}} & LEDR3) | ({3{s2}} & y));
	
	assign LEDR = ((~{3{s2}} & ((~{3{s1}} & ((~{3{s0}} & u) | ({3{s0}} & v))) | ({3{s1}} & ((~{3{s0}} & w) | ({3{s0}} & x))))) | ({3{s2}} & y));

endmodule