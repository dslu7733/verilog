`timescale 1ns/1ns

module d_latch_tb;

	reg r_enable;
	reg r_d;

	wire w_q;


	d_latch I_d_latch
	(
		.i_enable(r_enable),
		.i_d(r_d),
		.o_q(w_q)
	);

	initial
	begin
		r_enable = 1'b0;
		forever
		#100 r_enable = ~r_enable;
	end


	initial
	begin
		r_d = 1'b0;
		forever
		#15 r_d = ~r_d;
	end

endmodule
