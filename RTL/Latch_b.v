module  Latch_b(
    input           clk,
    input   [31:0]  RD1D,
    input   [31:0]  RD2D,
    input   [31:0]  SignlmmD,
    input   [31:0]  PCPlus4D,

    input           RegWriteD,
    input           MemtoRegD,
    input           MemWriteD,
    input           BranchD,
    input   [2:0]   ALUControlD,
    input           AluSrcD,
    input           RegDstD,

    input   [4:0]   RtD,
    input   [4:0]   RdD,


    output  reg    [31:0]  RD1E,
    output  reg    [31:0]  RD2E,
    output  reg    [31:0]  SignlmmE,
    output  reg    [31:0]  PCPlus4E,

    output  reg            RegWriteE,
    output  reg            MemtoRegE,
    output  reg             MemWriteE,
    output  reg             BranchE,
    output  reg    [2:0]    ALUControlE,
    output  reg      AluSrcE,
    output  reg     RegDstE,

    output  reg [4:0]   RtE,
    output  reg [4:0]   RdE
);

    always@(posedge clk)begin
        RD1E <= RD1D;
        RD2E <= RD2D;
        SignlmmE <= SignlmmD;
        PCPlus4E <= PCPlus4D;

        RegWriteE <= RegWriteD;
        MemtoRegE <= MemtoRegD;
        MemWriteE <= MemWriteD;
        BranchE <= BranchD;
        ALUControlE <= ALUControlD;
        AluSrcE <= AluSrcD;
        RegDstE <= RegDstD;

        RtE <= RtD;
        RdE <= RdD;
    end
endmodule