//Use System Verilog Style

module tb_adder_4bit;
	localparam PL_CYCLE = 20;

	reg iCLOCK;
	reg inRESET_SYNC;
	reg [3:0] iDATA_A;
	reg [3:0] iDATA_B;
	wire [3:0] oDATA;
	wire oC;

	//ターゲットのHDLモジュールをしていし接続する
	adder_4bit TARGET(
		.*
	);


	//クロックを生成する
	always#(PL_CYCLE/2)begin
		iCLOCK = !iCLOCK;
	end

	//標準のクロック信号を設定する
	default clocking clk@(posedge iCLOCK);
	endclocking

	integer i, j, exp;

	task tsk_check;
		begin
			for(i = 0; i < 16; i = i + 1)begin
				for(j = 0; j < 16; j = j + 1)begin
					//入力信号をセット
					iDATA_A = i;
					iDATA_B = j;
					exp = iDATA_A + iDATA_B;

					//1クロック後に出力される結果と期待値を比較
					##1;
					if(exp != {oC, oDATA})begin
						//結果がおかしければ途中でもシミュレーションを停止
						$display("Simulation Error, Expect:0x%x, Result:0x%x", exp, {oC, oDATA});
						$finish;
					end
				end
			end
		end
	endtask


	initial begin
		//シミュレーション開始時の状態を指定する。
		iCLOCK = 1'b0;
		inRESET_SYNC = 1'b0;
		iDATA_A = 4'h0;
		iDATA_B = 4'h0;

		//5クロック後に、リセット状態の解除
		##5;
		inRESET_SYNC = 1'b1;

		//10クロック後にテストコードを流し、期待値と比較
		##5;
		tsk_check();

		//シミュレーションが完了
		$display("Simulation done");
		$finish;
	end
	
endmodule
