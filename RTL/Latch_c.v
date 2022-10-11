module latch_c(
    input           clk,

    input           RegWriteE,
    input           MemtoRegE,
    input           MemWriteE,
    input           BranchE,
    input           ZeroE,
    input   [31:0]  ALUOutE,
    input   [31:0]  WriteDataE,
    input   [4:0]   WriteRegE,
    input   [31:0]  PCBranchE,

    output  reg         RegWriteM,
    output  reg         MemtoRegM,
    output  reg         MemWriteM,
    output  reg         BranchM,
    output  reg         ZeroM,
    output  reg [31:0]  ALUOutM,
    output  reg [31:0]  WriteDataM,
    output  reg [4:0]   WriteRegM,
    output  reg [31:0]  PCBranchM
);

always @(posedge clk)begin
    RegWriteM <= RegWriteE;
    MemtoRegM <= MemtoRegE;
    MemWriteM <= MemWriteE;
    BranchM <= BranchE;
    ZeroM <= ZeroE;
    ALUOutM <= ALUOutE;
    WriteDataM <= WriteDataE;
    WriteRegM <= WriteRegE;
    PCBranchM <= PCBranchE;
end

endmodule