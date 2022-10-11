`timescale 1ps/1ps
module CU_tb();
    reg   [5:0]   op;
    reg   [5:0]   funct;

    wire  RegWrite;
    wire  RegDst;
    wire  AluSrc;
    wire  Branch;
    wire  MemWrite;
    wire  MemtoReg;
    wire  [2:0] ALUControl;

    initial begin
       op = 6'b000000;
       funct = 6'b100000;
       #10
       op = 6'b000000;
       funct = 6'b100010;
        #10
        op = 6'b000000;
        funct = 6'b100100;
        #10
        op = 6'b000000;
        funct = 6'b100101;
        #10
        op = 6'b000000;
        funct = 6'b101010;
        #10;
    end

    CU CU_inst(
        .op(op),
        .funct(funct),
        .RegWrite(RegWrite),
        .RegDst(RegDst),
        .AluSrc(AluSrc),
        .Branch(Branch),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .ALUControl(ALUControl)
    );

    endmodule