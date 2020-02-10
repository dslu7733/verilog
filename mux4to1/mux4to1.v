/*
4选1的数据选择器
*/

`timescale 1ns/1ns

module mux4to1
	(
		input i_a,
		input i_b,
		input i_c,
		input i_d,

		input[1:0] i_sel,	//2位的选择信号

		output o_data
	);

	reg r_data;

	assign o_data = r_data;


	always@(*)
	begin
		case(i_sel)
			2'b00: r_data = i_a;
			2'b01: r_data = i_b;
			2'b10: r_data = i_c;
			2'b11: r_data = i_d;
			default:r_data = 1'b0;	//其它情况输出0
		endcase
	end
endmodule
