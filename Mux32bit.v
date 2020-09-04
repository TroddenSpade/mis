
module Mux32bit( input [31:0] a,
            input [31:0] b,
            input selector,
            output reg [31:0] out
   );

   always @ (a or b or selector) 
   begin
      case (selector)
         1'b0 : out <= a;
         1'b1 : out <= b;
      endcase
   end
   
endmodule