

`default_nettype none


module top_pipeline(
`ifdef SYNTH_DE0_CV
		input wire CLOCK_50,
		input wire [9:0] SW,
		input wire [3:0] KEY,
		output wire [9:0] LEDR
`else
		input wire CLOCK_50,
		input wire [17:0] SW,
		input wire [3:0] KEY,
		output wire [7:0] LEDG
`endif
	);
	
	//Synth
`ifdef SYNTH_DE0_CV
	reg [9:0] b_sw_buff0;
	reg [9:0] b_sw_buff1;
`else
	reg [17:0] b_sw_buff0;
	reg [17:0] b_sw_buff1;
`endif
	reg [3:0] b_key_buff0;
	reg [3:0] b_key_buff1;

	always_ff@(posedge CLOCK_50)begin
		b_sw_buff0 <= SW;
		b_sw_buff1 <= b_sw_buff0;
		b_key_buff0 <= KEY;
		b_key_buff1 <= b_key_buff0;
	end
	
	
	localparam PL_CLK_TIMING = 26'd50000000 / 2;
	reg [25:0] b_clk_counter;
	
	always@(posedge CLOCK_50)begin
		if(b_clk_counter == PL_CLK_TIMING)begin
			b_clk_counter <= 26'h0;
		end
		else begin
			b_clk_counter <= b_clk_counter + 26'h1;
		end
	end
	
	reg b_clk;
	always@(posedge CLOCK_50)begin
		if(b_clk_counter == PL_CLK_TIMING)begin
			b_clk <= !b_clk;
		end
	end
	
	
	wire stage0_valid = !b_key_buff1[3];
	wire stage0_data = b_sw_buff1[0];
	
	wire stage0_to_stage1_valid;
	wire stage1_to_stage0_busy;
	wire stage0_to_stage1_data;
	
	pipeline_stage STAGE0(
		.iCLOCK(b_clk),
		.iRESET_SYNC(1'b0),
		//Previous
		.iPREV_VALID(stage0_valid),
		.oPREV_BUSY(),
		.iPREV_DATA(stage0_data),
		//Next
		.oNEXT_VALID(stage0_to_stage1_valid),
		.iNEXT_BUSY(stage1_to_stage0_busy),
		.oNEXT_DATA(stage0_to_stage1_data)
	);
	
	wire stage1_to_stage2_valid;
	wire stage2_to_stage1_busy;
	wire stage1_to_stage2_data;
	
	pipeline_stage STAGE1(
		.iCLOCK(b_clk),
		.iRESET_SYNC(1'b0),
		//Previous
		.iPREV_VALID(stage0_to_stage1_valid),
		.oPREV_BUSY(stage1_to_stage0_busy),
		.iPREV_DATA(stage0_to_stage1_data),
		//Next
		.oNEXT_VALID(stage1_to_stage2_valid),
		.iNEXT_BUSY(stage2_to_stage1_busy),
		.oNEXT_DATA(stage1_to_stage2_data)
	);
	
	wire stage2_to_stage3_valid;
	wire stage3_to_stage2_busy;
	wire stage2_to_stage3_data;
	
	pipeline_stage STAGE2(
		.iCLOCK(b_clk),
		.iRESET_SYNC(1'b0),
		//Previous
		.iPREV_VALID(stage1_to_stage2_valid),
		.oPREV_BUSY(stage2_to_stage1_busy),
		.iPREV_DATA(stage1_to_stage2_data),
		//Next
		.oNEXT_VALID(stage2_to_stage3_valid),
		.iNEXT_BUSY(stage3_to_stage2_busy),
		.oNEXT_DATA(stage2_to_stage3_data)
	);
	
	wire stage3_out_valid;
	wire stage3_out_data;
	
	pipeline_stage STAGE3(
		.iCLOCK(b_clk),
		.iRESET_SYNC(1'b0),
		//Previous
		.iPREV_VALID(stage2_to_stage3_valid),
		.oPREV_BUSY(stage3_to_stage2_busy),
		.iPREV_DATA(stage2_to_stage3_data),
		//Next
		.oNEXT_VALID(stage3_out_valid),
		.iNEXT_BUSY(!b_key_buff1[0]),
		.oNEXT_DATA(stage3_out_data)
	);

	/************************************
	LED Out
	************************************/
	wire stage0_valid_led = (stage0_valid && stage0_data);
	wire stage1_valid_led = (stage0_to_stage1_valid && stage0_to_stage1_data);
	wire stage2_valid_led = (stage1_to_stage2_valid && stage1_to_stage2_data);
	wire stage3_valid_led = (stage2_to_stage3_valid && stage2_to_stage3_data);
	wire stage4_valid_led = (stage3_out_valid && stage3_out_data);
	

`ifdef SYNTH_DE0_CV
	assign LEDR = {b_clk, 4'h0, stage0_valid_led, stage1_valid_led, stage2_valid_led, stage3_valid_led, stage4_valid_led};
`else
	assign LEDG = {b_clk, 2'h0, stage0_valid_led, stage1_valid_led, stage2_valid_led, stage3_valid_led, stage4_valid_led};
`endif

endmodule

`default_nettype wire







