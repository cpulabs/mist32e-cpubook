default:
	#シミュレーション用のworkライブラリを作る
	vlib work
	
	#テストベンチとソースファイルをコンパイルしてworkライブラリに追加
	vlog -work work -sv tb_adder_4bit.sv
	vlog -work work -sv ../src/adder_4bit.sv

	#シミュレーション開始
	vsim -c -voptargs="+acc" tb_adder_4bit -do "radix -hexadecimal; log -r /*; run -all; finish"

