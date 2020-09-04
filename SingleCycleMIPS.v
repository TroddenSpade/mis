
module SingleCycleMIPS( input clk, reset ); 

	wire [31:0] pc, pc_in, pc_plus, pc_two, im;
	wire [31:0] data_mem, mem_out;
	wire [31:0] r1, r2, data_in;
	wire [31:0] alu_src, alu_res;
	wire zero, _pc_mux;
	
	wire [4:0] rr1 = im[25:21];
	wire [4:0] rr2 = im[20:16];
	wire [4:0] rr3 = im[15:11];
	wire [5:0] opcode = im[31:25];
	wire [5:0] func = im[5:0]; 
	wire [31:0] imd_se, shifted_imd;
  wire [15:0] imd = im[15:0];

	wire _reg_dst, _branch,
	 _mem_read, _mem_write, 
	 _mem_to_reg, _ALU_src, _reg_write;

	wire [1:0] ALUOP, ALUCTRL ;

	ControlUnit cu(
	 opcode,
	 _reg_dst, _branch,
	 _mem_read, _mem_write, 
	 _mem_to_reg, _ALU_src, _reg_write,
	 ALUOP
	);
	
	PC pc_reg(pc_in, pc, clk);
	
	ALUAdd add1(pc, 32'b100, pc_plus);
	
	InstructionMemory instm(pc, im);
	
	wire [4:0] wr;
	
	Mux5bit mux_dst(rr2, rr3, _reg_dst, wr);
	
	RegisterFile rf(rr1, rr2, wr, data_in, r1, r2, _reg_write, clk);
	
	ALUControl aluc(ALUOP, func, ALUCTRL);
	
	SE se(imd, imd_se);
	
	Mux32bit alu_mux(r2, imd_se, _ALU_src, alu_src);
	
	ALU alu(r1, alu_src, ALUCTRL, alu_res, zero);
	
	Memory mem(alu_src, r2, mem_out, _mem_read, _mem_write, clk);
	
	Mux32bit reg_mux(alu_res, mem_out, _mem_to_reg, data_in);
	
	Shift shl2(imd_se, shifted_imd);
	
	ALUAdd add2(pc_plus, shifted_imd, pc_two);
	
	AND mux_and(_branch, zero, _pc_mux);

  Mux32bit pc_mux(pc_plus, pc_two,_pc_mux ,pc_in);
	
endmodule
