
module InstructionMemory(
	input [31:0] address, 
	output reg [31:0] out
	);

	reg [7:0] mem[1023:0];

	initial
	begin
	  mem[0] = 8'b000000_00;
	  mem[1] = 8'b001_00010;
		mem[2] = 8'b00011_000;
		mem[3] = 8'b00_100000;
  end

	always @ ( * )
	begin
		 out = {mem[address], mem[address+1], mem[address+2], mem[address+3]};
	end
	
endmodule
