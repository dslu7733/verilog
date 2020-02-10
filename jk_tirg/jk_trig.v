/*
JK触发器
*/
`timescale 1ns/1ns

module jk_trig
	(
		input i_clk,
		input i_j,
		input i_k,

		output o_q,	//JK触发器正输出
		output o_qb	//JK触发器负输出

	);

	//模块内的r_q是没有初始值的
	reg r_q;
	
	assign o_q = r_q;
	assign o_qb = ~r_q;


	always@(posedge clk)
	begin
		case({i_j, i_k})
			2'b00: r_q <= r_q;
			2'b01: r_q <= 1'b0;
			2'b10: r_q <= 1'b1;
			2'b11: r_q <= ~r_q;
			default: r_q <= r_q;
		endcase
	end

endmodule
