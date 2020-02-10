`timescale 1ns/1ns

module jk_trig_tb;
	
	reg r_clk;
	reg[1:0] r_cnt;

	wire w_q;
	wire w_qb;


	jk_trig I_jk_trig
	(
		.i_k(r_k[1]),
		.i_j(r_j[0]),
		.i_clk(r_clk),
		.o_qb(w_qb),
		.o_q(w_q)
	);

	initial
	begin
		r_clk = 1'd0;
		forever
		#10 r_clk = ~r_clk;
	end


	initial
	begin
		r_cnt = 2'd0;
		forever
		#20 r_cnt = r_cnt + 2'd1;

	end
endmodule
