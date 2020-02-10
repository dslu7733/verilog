module string_test;
	//一个字符8bit
	reg[19*8:1] str;

	initial
	begin
		str = "I love verilog HDL!";
		$display("str is :%H",str);
	end
endmodule

