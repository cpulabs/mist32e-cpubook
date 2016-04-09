
module top_adder_4bit(
		input wire CLOCK_50,
		input wire [17:0] SW,
		input wire [3:0] KEY,
		output wire [9:0] LEDR
	);


	//Synth
	reg [17:0] b_sw_buff0;
	reg [17:0] b_sw_buff1;
	reg [3:0] b_key_buff0;
	reg [3:0] b_key_buff1;

	always_ff@(posedge CLOCK_50)begin
		b_sw_buff0 <= SW;
		b_sw_buff1 <= b_sw_buff0;
		b_key_buff0 <= KEY;
		b_key_buff1 <= b_key_buff0;
	end

	//Adder
	wire [4:0] out_data;

	adder_4bit ADDER(
		.iCLOCK(CLOCK_50),
		.inRESET_SYNC(b_key_buff1[0]),
		.iDATA_A(b_sw_buff1[7:4]),
		.iDATA_B(b_sw_buff1[3:0]),
		.oDATA(out_data[3:0]),
		.oC(out_data[4])
	);

	assign LEDR = {5'h0, out_data};

endmodule
