`timescale 1ns/1ns

module function_app();
	parameter N = 15;
	parameter M = 4;

	reg[N:0] data_one;
	reg[N:0] data_two;
	reg[M:0] num_one;
	reg[M:0] num_two;

	task cal_num_one;
		input[N:0] data;
		output[M:0] num_one;

		integer i, j;
		begin
			i = 0;
			for(j=0; j<N+1; j=j+1)	//++ error
				if(data[j])
					i = i + 1;

			num_one = i[4:0];
		end
	endtask

	initial
	begin
		data_one = 1;
		data_two = ~data_one;
	#2	data_one = 3;
		data_two = ~data_one;
	#2	data_one = 100;
		data_two = ~data_one;
	#2	data_one = 10001;
		data_two = ~data_one;
	end


	initial
	begin
		cal_num_one(data_one, num_one);
		cal_num_one(data_two, num_two);

	#2	cal_num_one(data_one, num_one);
		cal_num_one(data_two, num_two);
	#2	cal_num_one(data_one, num_one);
		cal_num_one(data_two, num_two);
	#2	cal_num_one(data_one, num_one);
		cal_num_one(data_two, num_two);
	#2	cal_num_one(data_one, num_one);
		cal_num_one(data_two, num_two);

	end

	initial $monitor("$time=%d, data_one=%d, num_one=%d, data_two=%d, num_two=%d",
			$time, data_one, num_one, data_two, num_two);


endmodule
