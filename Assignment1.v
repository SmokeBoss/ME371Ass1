// Assigns the switches to LEDs 

module Assignment1(SW, LEDR);

	input [17:0] SW; 
	output [17:0] LEDR;

	assign LEDR = SW;

endmodule