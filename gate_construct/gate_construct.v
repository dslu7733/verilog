`timescale 1ns/1ns

module gate_construct
	(
		input i_a,
		input i_b,
		input i_c,
		input i_d,
		input i_e,

		output o_y
	);

	//定义门电路之间的连线信号
	wire w_and_o;
	wire w_or1_o;
	wire w_xor_o;


	//实例化门电路模块
	and I_and(w_and_o, i_a, i_b);
	or I1_or(w_or1_o, i_c, i_d);
	xor I_xor(w_xor_o, w_and_o, w_or1_o );
	or I2_or(o_y, w_xor_o, i_e);

endmodule
