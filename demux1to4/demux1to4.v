/*
数据分配器
一个输入，4个输出
*/
`timescale 1ns/1ns

module demux1to4
	(	
		input i_data,
		input[1:0] i_sel,

		output o_a,
		output o_b,
		output o_c,
		output o_d
	);

	reg r_a;
	reg r_b;
	reg r_c;
	reg r_d;

	assign o_a = r_a;
	assign o_b = r_b;
	assign o_c = r_c;
	assign o_d = r_d;



	always@(*)
	begin
		if( i_sel == 2'b00 )
			r_a = i_data;
		else
			r_a = 1'b0;
	end


	always@(*)
	begin
		if( i_sel == 2'b01 )
			r_b = i_data;
		else
			r_b = 1'b0;
	end


	always@(*)
	begin
		if( i_sel == 2'b10 )
			r_c = i_data;
		else
			r_c = 1'b0;
	end


	always@(*)
	begin
		if( i_sel == 2'b11 )
			r_d = i_data;
		else
			r_d = 1'b0;
	end

endmodule
