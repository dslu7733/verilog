module counter(q, cout, reset, cin, clk);
	parameter N = 4;

	input reset, cin, clk;
	output cout;
	output[N:1] q;
	reg[N:1] q;

	always @(posedge clk)
	begin
		if(reset) q<=0;
		else
			q<=q+cin;
	end

	assign cout=&q && cin;
endmodule

