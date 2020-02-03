module mux(out, in0, in1, sel);
	parameter N = 8;

	input sel;
	input[N:1] in0, in1;
	output[N:1] out;

	assign out=sel?in1:in0;
endmodule
