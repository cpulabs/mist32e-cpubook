`default_nettype none

module pipeline_stage(
		input wire iCLOCK,
		input wire iRESET_SYNC,
		//Previous
		input wire iPREV_VALID,
		output wire oPREV_BUSY,
		input wire iPREV_DATA,
		//Next
		output wire oNEXT_VALID,
		input wire iNEXT_BUSY,
		output wire oNEXT_DATA
	);


	reg b_valid;
	reg b_data;

	always@(posedge iCLOCK)begin
		if(iRESET_SYNC)begin
			b_valid <= 1'b0;
		end
		else begin
			if(!iNEXT_BUSY)begin
				b_valid <= iPREV_VALID;
			end
		end
	end

	always@(posedge iCLOCK)begin
		if(iRESET_SYNC)begin
			b_data <= 1'b0;
		end
		else begin
			if(!iNEXT_BUSY && iPREV_VALID)begin
				b_data <= iPREV_DATA;
			end
		end
	end

	assign oNEXT_VALID = b_valid;
	assign oNEXT_DATA = b_data;

	assign oPREV_BUSY = iNEXT_BUSY;
endmodule

`default_nettype wire