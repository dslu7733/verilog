`timescale 1ns/1ns

module demux1to4_tb;

	reg r_data;
	reg[1:0] r_sel;

	wire w_a;
	wire w_b;
	wire w_c;
	wire w_d;

	demux1to4 I_demux1to4
	(
		.i_data(r_data),
		.i_sel(r_sel),
		.o_a(r_a),
		.o_b(r_b),
		.o_c(r_c),
		.o_d(r_d)
	);

	initial
	begin
		r_data = 1'b0;
		repeat(64)
		#2 r_data = ~r_data;
	end


	initial
	begin
		r_sel = 2'd0;
		repeat(4)
		#32 r_sel = r_sel + 4'd1;
	end


endmodule
