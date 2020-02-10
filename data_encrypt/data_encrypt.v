`timescale 1ns/1ns

module data_encrypt
	(
		input i_rst_n,//低有效
		input i_clk,

		input i_data,
		output o_code
	);

	reg[4:0] r_shift;

	assign o_code = r_shift[4];



	always@(negedge i_rst_n, posedge clk )
	begin
		if(~i_rst_n)
			r_shift <= 5'b0;
		else
		begin
			r_shift[3:0] <= r_shift[4:1];
			r_shift[4] <= r_shift[0] ^ r_shift[2] ^ i_data;
		end
	end

endmodule
