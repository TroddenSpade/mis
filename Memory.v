module Memory(
	input [31:0] address, 
	input [31:0] write_data, 
	output reg [31:0] out,
	input _mem_read, _mem_write, clk
	);

	reg [7:0] mem[1023:0];

	initial
	begin
	end

 always @ ( posedge clk )
  begin
  		if(_mem_write)
  		  begin
			mem[address] <= write_data[7:0];
			mem[address+1] <= write_data[15:8];
			mem[address+2] <= write_data[23:16];
			mem[address+3] <= write_data[31:24];
			end
  end

	always @ ( * )
	begin
		if(_mem_read)
		  	out = { mem[address], mem[address+1], mem[address+2], mem[address+3] };
	end
	
endmodule
