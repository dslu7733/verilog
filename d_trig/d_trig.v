/*
D触发器建模
*/

`timescale 1ns/1ns

module d_trig
	(
		input i_clk,
		input i_clr,
		input i_enable,
		input i_d,

		output o_q
	);

	
	reg r_q;

	assign o_q = r_q;


	always@(posedge i_clk, posedge i_clr)//这里的逗号相当于or
	begin
		if(1'b1 == i_clr)	//同步清零
			r_q = 1'b0;
		else if( i_enable == 1'b1 )//同步使能
			r_q <= i_d;
	end

endmodule
