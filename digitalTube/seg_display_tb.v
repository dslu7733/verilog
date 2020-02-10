`timescale 1ns/1ns

module seg_display_tb;
	
	reg[3:0] r_data;
	reg r_dp;

	//定义输出信号连线
	wire[6:0] w_seg;
	wire w_dp;



	seg_display I_seg_display
	(
		.i_data(r_data),
		.i_dp(r_dp),
		.o_seg(w_seg),
		.o_dp(w_dp)
	);


	//小数点显示激励信号
	initial
	begin
		r_dp=1'b0;
		repeat(8)	//执行8次
		#4 r_dp = ~r_dp;
	end


	//7段数码显示激励信号
	initial
	begin
		r_data=4'd0;
		repeat(16);
		#2 r_data = r_data + 4'd1;
	end


endmodule
