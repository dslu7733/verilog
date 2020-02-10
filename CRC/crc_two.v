/*
* 这是根据 串行CRC电路 写出的代码
* 根据 串行CRC电路 可以推导出 并行CRC电路(纯组合逻辑)
*/
module crc_two
	(
		input i_rst_n,
		input i_clk,

		input i_data,
		output o_code,
		output o_crc_done
	);

	reg r_code;
	reg r_crc_done;

	reg[3:0] r_shift;
	reg[2:0] r_cnt;


	assign o_code = r_code;
	assign o_crc_done= r_crc_done;


	always@( posedge clk,  negedge r_rst_n)
	begin
		if(~r_rst_n)
		begin
			r_shift <= 4'b0;
			r_code <= 1'b0;
			r_cnt <= 3'b0;
			r_crc_done <= 1'b0;
		end
		else
		begin
			if( r_cnt < 3'b3 )
			begin
				r_shift[3] <= i_data ^ r_shift[0];
				r_shift[2] <= i_data ^ r_shift[0] ^ r_shift[3];
				r_shift[1] <= i_data ^ r_shift[0] ^ r_shift[2];
				r_shift[0] <= r_shift[1];

				r_cnt <= r_cnt + 3'd1;
				r_crc_done <= 1'b0;
				//这是初始的3位
				r_code <= i_data;
			end
			else
			begin
				if(r_cnt == 3'd6)//7位的时候结束
				begin
					r_cnt <= 3'b0;
					r_crc_done <= 1'b1;
				end
				else
				begin
					r_cnt <= r_cnt + 3'b1;
					r_crc_done <= 1'b0;
				end

				r_shift <= {1'b0, r_shift[3:1]};
				r_code <= r_shift[0];

			end
		end
	end

endmodule
