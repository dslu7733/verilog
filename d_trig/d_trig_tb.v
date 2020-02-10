`timescale 1ns/1ns

module d_trig_tb;
	
	reg r_clk;
	reg r_clr;
	reg r_enable;
	reg r_data;

	wire w_o;


	d_trig I_d_trig
	(
		.i_clk(r_clk),
		.i_d(r_data),
		.i_clr(r_clr),
		.i_enable(r_enable),
		.o_q(w_o)
	);


	initial
	begin
		r_clk = 1'b0;
		forever
		#10 r_clk = ~r_clk;
	end


	initial
	begin
		r_clr = 1'b1;
		#15 r_clr = 1'b0;
	end


	initial
	begin
		r_enable = 1'b1;
		#20 r_enable = 1'b0;
		#20 r_enable = 1'b1;
	end


	initial
	begin
		r_data = 1'b0;

		repeat(10)
		begin
			#2 r_data = 1'b1;
			#2 r_data = 1'b0;
			#4 r_data = 1'b1;
			#4 r_data = 1'b0;
			#2 r_data = 1'b1;
		end
	end

endmodule
