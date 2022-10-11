module  latch_d(
    input           clk,

    input           RegWriteM,
    input           MemtoRegM,
    input   [31:0]  ALUOutM,
    input   [31:0]  RDM,
    input   [4:0]   WriteRegM,

    output  reg         RegWriteW,
    output  reg         MemtoRegW,
    output  reg [31:0]  ALUOutW,
    output  reg [31:0]  ReadDataW,
    output  reg [4:0]   WriteRegW      
);

always @(posedge clk)begin
    RegWriteW <= RegWriteM;
    MemtoRegW <= MemtoRegM;
    ALUOutW <= ALUOutM;
    ReadDataW <= RDM;
    WriteRegW <= WriteRegM;
end

endmodule