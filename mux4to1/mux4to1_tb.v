`timescale 1ns/1ns

module mux4to1_tb;

	//定义激励源
	reg[3:0] r_cnt;
	reg[1:0] r_sel;

	wire w_data;


	mux4to1 I_mux4to1
	(
		.i_a(r_cnt[0]),	
		.i_b(r_cnt[1]),	
		.i_c(r_cnt[2]),	
		.i_d(r_cnt[3]),	
		.i_sel(r_sel),
		.o_data(w_data)
	);
	

	initial
	begin
		r_cnt = 4'd0;
		repeat(64)
		#2 r_cnt = r_cnt + 4'd1;
	end


	initial
	begin
		r_sel = 2'd0;
		repeat(4)
		#32 r_sel = r_sel + 4'd1;
	end
endmodule
