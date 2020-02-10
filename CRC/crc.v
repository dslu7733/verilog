/*
4位CRC校验
生成多项式10111
*/

module crc
	(
		input i_rst_n,
		input i_clk,

		input[2:0] i_data,
		output[3:0] o_crc_code,

		output o_crc_done
	);

	parameter GX = 5'b10111;

	reg[7:0] r_shift;
	reg[2:0] r_cnt;

	reg[3:0] r_crc_code;
	reg r_crc_done;

	assign o_crc_done = r_crc_done;
	assign o_crc_code = r_crc_code;


	always@( posedge i_clk, negedge i_rst_n)
	begin
		if(~i_rst_n)
		begin
			r_crc_code <= 4'b0;
			r_crc_done <= 1'b0;
			r_shift <= 8'b0;
			r_cnt <= 3'b0;
		end
		else
			if(r_cnt == 3'd3)	//CRC编码完成
			begin
				//重新置0
				r_shift <= {1'b0, i_data, 4'b0};
				r_cnt <= 3'b0;
				//读出结果
				r_crc_code <= r_shift[6:3];
				r_crc_done <= 1'b1;
			end
			else
			begin
				if(r_shift[6] == 1'b1)//最高位为1则为除法
				begin
					r_shift[7:3] <= r_shift[6:2] ^ GX;
					r_shift[2:0] <= {r_shift[1:0], 1'b0};
				end
				else	//否则借位
					r_shift <= {r_shift[6:0], 1'b0};

				//每计算一位，r_cnt加1
				r_cnt <= r_cnt + 3'd1;
				r_crc_done <= 1'b0;
			end
	end

endmodule
