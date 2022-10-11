module latch_a(
    input   clk,
    input       [31:0] RD,
    input       [31:0] PCPlus4F,
    output  reg [31:0] InstrD,
    output  reg [31:0] PCPlus4D
);


always @(posedge clk)begin

        InstrD <= RD;
        PCPlus4D <= PCPlus4F;
    end


endmodule