`timescale

module data_encrypt_tb;
	
	reg r_clk;
	reg r_rst_n;
	reg r_data;

	wire w_code;
	wire w_data;


	data_encrypt I_data_encrypt
	(
		.i_clk(r_clk),
		.i_rst_n( r_rst_n),
		.i_data(r_data),
		.o_code(w_code)
	);

	data_decrypt I_data_decrypt
	(
		.i_clk(r_clk),
		.i_rst_n( r_rst_n),
		.i_data(w_code),
		.o_decode(w_data)
	);

	initial
	begin
		r_clk = 1'b0;
		forever
		#1 r_clk = ~r_clk;
	end


	initial
	begin
		r_rst_n = 1'b0;
		#10 r_rst_n = 1'b1;
	end

	initial
	begin
		r_data = 1'b0;
		forever
		#2 r_data = $random % 2;
	end
endmodule
