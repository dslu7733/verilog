`timescale 1ns/1ns

module gate_construct_tb;

	reg r_a;
	reg r_b;
	reg r_c;
	reg r_d;
	reg r_e;

	reg[4:0] r_cnt;

	//定义输出信号连线
	wire w_v;
	
	//实例化
	gate_construct I_gate_construct_tb
		(
			.i_a(r_a),
			.i_b(r_b),
			.i_c(r_c),
			.i_d(r_d),
			.i_e(r_e)
		);

	
	initial
	begin
		r_cnt = 5'd0;
		forever
			#2 r_cnt = r_cnt + 5'd1;
	end

	always@(r_cnt)
	begin
		r_a = r_cnt[0];
		r_b = r_cnt[1];
		r_c = r_cnt[2];
		r_d = r_cnt[3];
		r_e = r_cnt[4];
	end

endmodule
