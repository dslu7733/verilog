`timescale 1ns/1ns

module data_decrypt
	(
		input i_rst_n,
		input i_clk,
		input i_data,

		output o_decode
	);

	
	reg[4:0] r_shift;

	assign o_decode = r_shift[0] ^ r_shift[2] ^ i_data;


	always@(posedge i_clk, negedge i_rst_n)
	begin
		if(~i_rst_n)
			r_shift <= 5'b0;
		else
		begin
			r_shift[3:0] <= r_shift[4:1];
			r_shift[4] <= i_data;
		end
	end

endmodule
