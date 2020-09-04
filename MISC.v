
module SE (input [15:0] in, output reg [31:0] out);
  always @( * ) begin
    out[31:0] <= { {16{in[15]}}, in[15:0] };
  end
  
endmodule

module AND (input a,b , output reg out);
  always @( * ) begin
    out <= a & b;
  end
  
endmodule

module Shift (input a , output reg out);
  always @( * ) begin
    out <= a << 2;
  end
  
endmodule