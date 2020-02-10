module crc_tb;
	
	reg r_rst_n;
	reg r_clk;

	reg[2:0] r_data;

	wire[3:0] w_crc_code;
	wire w_crc_done;

	crc I_crc(
		.i_data(r_data),
		.i_rst_n(r_rst_n),
		.i_clk(r_clk),
		.o_crc_code(w_crc_code),
		.o_crc_done(w_crc_done)
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
		r_data = 3'b0;
		forever
		#8 r_data = r_data + 3'd1;
	end
endmodule
