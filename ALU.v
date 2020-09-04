

module ALU(    
      		input [31:0] a,
      		input [31:0] b,
      		input [2:0] ALUCTRL,
      		output reg [31:0] result,
      		output reg zero
   	); 
   	
	always @ (*) 
	begin
	   case (ALUCTRL)
      3'b000: result = a + b;
      3'b001: result = a - b;
      3'b011: result = a & b;
      3'b100: result = a | b;
    endcase
    if(result == 0)
      zero = 1;
    else
      zero = 0;
	end


endmodule

