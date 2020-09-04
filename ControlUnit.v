

module ControlUnit(
	input [5:0] opcode,
	output reg _reg_dst, _branch,
	_mem_read, _mem_write, 
	_mem_to_reg, _ALU_src, _reg_write,
	output reg [1:0] ALUOP
	);

	//initial
	//begin
	//	opcode <= 4'b000;
	//end

	always @ ( opcode )
	begin
		case(opcode)
		6'b000000: // R
		begin
		  _reg_dst = 1;
		  _ALU_src = 0;
		  _mem_to_reg = 0;
		  _reg_write = 1;
		  _mem_read = 0;
		  _mem_write = 0;
		  _branch = 0;
		  ALUOP = 2'b10;
		end 
		
		6'b100011: // lw 
		begin
		  _reg_dst = 0;
		  _ALU_src = 1;
		  _mem_to_reg = 1;
		  _reg_write = 1;
		  _mem_read = 1;
		  _mem_write = 0;
		  _branch = 0;
		  ALUOP = 2'b00;
		end 
		
		6'b101011: // sw 
		begin
		  _ALU_src = 1;
		  _reg_write = 0;
		  _mem_read = 0;
		  _mem_write = 1;
		  _branch = 0;
		  ALUOP = 2'b00;
		end
		
		6'b000100: // beq 
		begin
		  _ALU_src = 0;
		  _reg_write = 0;
		  _mem_read = 0;
		  _mem_write = 0;
		  _branch = 1;
		  ALUOP = 2'b01;
		end
		
		endcase
	end
	


endmodule

