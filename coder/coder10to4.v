`timescale 1ns/1ns

module coder10to4
	(
		input[9:0] i_data,
		output[3:0] o_code
	);
	
	//定义输出信号o_code的缓存
	reg[3:0] r_coder;

	assign o_code = r_coder;


	always@(*)
	begin
		case(i_data)
			//组合电路使用阻塞语句赋值
			10'b0000000001:r_coder=4'b0001;
			10'b0000000010:r_coder=4'b0010;
			10'b0000000100:r_coder=4'b0011;
			10'b0000001000:r_coder=4'b0100;
			10'b0000010000:r_coder=4'b0101;
			10'b0000100000:r_coder=4'b0110;
			10'b0001000000:r_coder=4'b0111;
			10'b0010000000:r_coder=4'b1000;
			10'b0100000000:r_coder=4'b1001;
			10'b1000000000:r_coder=4'b1010;
			default: r_coder=4`b0000;//添加默认分支的赋值，避免产生锁存器
		endcase
	end
endmodule
