

module ALUControl(    
		    input [1:0] ALUOP,
        input [5:0] func,
      		output reg [2:0] result
   	);
   	
	always @ (*) 
	begin
	   case (ALUOP)
      2'b00: result = 3'b000; // sw
      2'b01: result = 3'b001; //beq
      2'b10: 
        case (func)  
          6'b100100 : result = 3'b011; // and
          6'b100101 : result = 3'b100; // or
          6'b100000 : result = 3'b000; // add  
          6'b100010 : result = 3'b001; // sub
          default: result <= 3'b000;
        endcase  
    endcase
	end


endmodule


