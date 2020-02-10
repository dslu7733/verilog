`timescale 1ns/1ns

module decoder10to4
	(
		input[3:0] i_data,
		output[9:0] o_decode;
	);

	reg[9:0] r_decode;
	assign o_decode = r_decode;

	always@(*)
	begin
		case(i_data)
			4'b0001:r_decode=10'b0000000001;
			4'b0010:r_decode=10'b0000000010;
			4'b0011:r_decode=10'b0000000100;
			4'b0100:r_decode=10'b0000001000;
			4'b0101:r_decode=10'b0000010000;
			4'b0110:r_decode=10'b0000100000;
			4'b0111:r_decode=10'b0001000000;
			4'b1000:r_decode=10'b0010000000;
			4'b1001:r_decode=10'b0100000000;
			4'b1010:r_decode=10'b1000000000;
			default:r_decode=10'b0000000000;
		endcase
	end
endmodule
