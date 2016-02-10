module adder_4bit(
		input wire iCLOCK,
		input wire inRESET_SYNC,
		input wire [3:0] iDATA_A,
		input wire [3:0] iDATA_B,
		output wire [3:0] oDATA,
		output wire oC
	);


	function [1:0] func_full_adder;
		input func_a;
		input func_b;
		input func_c;
		begin
			func_full_adder[0] = func_a ^ func_b ^ func_c;
			func_full_adder[1] = (func_a & func_b) | ((func_a ^ func_b) & func_c);
		end
	endfunction


	wire [3:0] adder_out;
	wire [3:0] adder_c;

	assign {adder_c[0], adder_out[0]} = func_full_adder(iDATA_A[0], iDATA_B[0], 1'b0);
	assign {adder_c[1], adder_out[1]} = func_full_adder(iDATA_A[1], iDATA_B[1], adder_c[0]);
	assign {adder_c[2], adder_out[2]} = func_full_adder(iDATA_A[2], iDATA_B[2], adder_c[1]);
	assign {adder_c[3], adder_out[3]} = func_full_adder(iDATA_A[3], iDATA_B[3], adder_c[2]);
	 
	reg [4:0] b_data;

	always@(posedge iCLOCK)begin
		if(!inRESET_SYNC)begin
			b_data <= 5'h0;
		end
		else begin
			b_data <= {adder_c[3], adder_out};
		end
	end

	assign {oC, oDATA} = b_data;

endmodule
