/*
七段数码管
小数点位DP
*/
`timescale 1ns/1ns

module seg_display
	(
		input[3:0] i_data,
		input i_dp,

		output[6:0] o_seg,
		output o_dp
	);

	reg[6:0] r_seg;

	assign o_seg = r_seg;

	assign o_dp = i_dp;	//小数点直接输出


	always@(*)
	begin
		//根据7段数码管 显示数字与对应信号关系 来编码
		case(i_data)
			4'b0000:r_seg=7'b1111110;//显示数字0
			//下面类似，就不写其它情况了
			default:r_seg=7'b1111111;//不亮
		endcase
	end

endmodule
