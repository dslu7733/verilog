/*
D锁存器
*/

`timescale 1ns/1ns

module d_latch
	(
		input i_enable,
		input i_d,

		output o_q
	);
	
	reg r_q;

	assign o_q = r_q;

	always@(i_enable, i_d)	//电平敏感
	begin
		if( 1'b1 == i_enable )
			r_q <= i_d;
	end
endmodule
