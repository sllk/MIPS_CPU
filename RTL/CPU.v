module  CPU (
    input           clk,
    input           Rst
    
);

    //tread1(F)
    //wire    [4:0]   WriteReg; 
    wire    [31:0]  RDF;
    wire    [31:0]  PCPlus4F;
    wire    [31:0]  PCF;
    wire    [31:0]  PC;

    //tread2(D)
    wire    [31:0]  InstrD;
    wire    [31:0]  PCPlus4D;
    wire            RegWriteD;
    wire            MemtoRegD;
    wire            MemWriteD;
    wire            BranchD;
    wire    [2:0]   ALUControlD;
    wire            AluSrcD;
    wire            RegDstD;
    wire    [31:0]  RD1D;
    wire    [31:0]  RD2D;  
    wire    [31:0]  SignlmmD; 

    //tread3(E)
    wire    [31:0]  RD2E;  
    wire            RegWriteE;
    wire            MemtoRegE;
    wire            MemWriteE;
    wire            BranchE;
    wire    [2:0]   ALUControlE;
    wire            AluSrcE;
    wire            RegDstE;
    wire    [31:0]  SrcAE;
    wire    [31:0]  SrcBE;
    wire    [31:0]  WriteDataE;
    wire    [4:0]   RtE;
    wire    [4:0]   RdE;
    wire    [4:0]   WriteRegE;
    wire    [31:0]  SignlmmE;
    wire    [31:0]  PCPlus4E;
    wire            ZeroE;
    wire    [31:0]  ALUOutE;
    wire    [31:0]  PCBranchE;

    //tread4(M)
    wire            RegWriteM;
    wire            MemtoRegM;
    wire            MemWriteM;
    wire            BranchM;
    wire            PCSrcM;
    wire            ZeroM;
    wire    [31:0]  ALUOutM;
    wire    [31:0]  WriteDataM;
    wire    [4:0]  WriteRegM;
    wire    [31:0]  PCBranchM;
    wire    [31:0]  RDM;

    //tread5(W)
    wire            RegWriteW;
    wire            MemtoRegW;
    wire    [31:0]  ALUOutW;
    wire    [31:0]  ReadDataW;
    wire    [4:0]   WriteRegW;
    wire    [31:0]  ResultW;


    Mux MuxF(
            .sel(PCSrcM),
            .in1(PCBranchM),
            .in2(PCPlus4F),
            .out(PC)
        );

    Latch_PC Latch_PC_inst(
        .clk(clk),
        .Rst(Rst),
        .PC(PC),
        .PCF(PCF)
    );

    adder adderF(
    .in1(PCF),  
    .in2(32'h1),
    .out(PCPlus4F)
    );

    memory_rom memory_rom_inst(
        .clk(clk),
        .A(PCF),
        .RD(RDF) 
    );

    latch_a latch_a_inst(           //触发器
        .clk(clk),
        .RD(RDF),
        .PCPlus4F(PCPlus4F),
        .InstrD(InstrD),
        .PCPlus4D(PCPlus4D)
    );

    CU  CU_inst(                    //CU
        .op(InstrD[31:26]),
        .funct(InstrD[5:0]),
        .RegWrite(RegWriteD),
        .RegDst(RegDstD),
        .AluSrc(AluSrcD),
        .Branch(BranchD),
        .MemWrite(MemWriteD),
        .MemtoReg(MemtoRegD),
        .ALUControl(ALUControlD)
    );

    memory_reg memory_reg_inst(     //寄存器
        .clk(clk),
        .A1(InstrD[25:21]),
        .A2(InstrD[20:16]),
        .A3(WriteRegW),
        .WD3(ResultW),
        .we3(RegWriteW),
        .RD1(RD1D),
        .RD2(RD2D)
    );

    Sign_Extend Sign_Extend_inst(
        .instrD(InstrD[15:0]),
        .SignlmmD(SignlmmD)
    );

    Latch_b Latch_b_inst(
        .clk(clk),
        .RD1D(RD1D),
        .RD2D(RD2D),
        .SignlmmD(SignlmmD),
        .PCPlus4D(PCPlus4D),
        .RD1E(SrcAE),
        .RD2E(RD2E),
        .SignlmmE(SignlmmE),
        .PCPlus4E(PCPlus4E),

        .RegWriteE(RegWriteE),
        .RegWriteD(RegWriteD),
        .MemtoRegE(MemtoRegE),
        .MemtoRegD(MemtoRegD),
        .MemWriteE(MemWriteE),
        .MemWriteD(MemWriteD),
        .BranchE(BranchE),
        .BranchD(BranchD),
        .ALUControlE(ALUControlE),
        .ALUControlD(ALUControlD),
        .AluSrcE(AluSrcE),
        .AluSrcD(AluSrcD),
        .RegDstE(RegDstE),
        .RegDstD(RegDstD),

        .RtE(RtE),
        .RdE(RdE),
        .RtD(InstrD[20:16]),
        .RdD(InstrD[15:11])
    ); 

    Mux MuxE1(
        .sel(AluSrcE),
        .in1(SignlmmE),
        .in2(RD2E),
        .out(SrcBE)
    );

    Mux5bit MuxE2(
        .sel(RegDstE),
        .in1(RdE),
        .in2(RtE),
        .out(WriteRegE)
    );

    ALU ALU_inst(
        .A(SrcAE),
        .B(SrcBE),
        .F(ALUControlE),
        .Y(ALUOutE),
        .zero(ZeroE)
    );

    adder adderE(
        .in1(SignlmmE),  //左移两位
        .in2(PCPlus4E),     //debug:    PCPlus4E -> 0
        .out(PCBranchE)
    );

    latch_c latch_c_inst(
        .clk(clk),

        .RegWriteE(RegWriteE),
        .MemtoRegE(MemtoRegE),
        .MemWriteE(MemWriteE),
        .BranchE(BranchE),              //(BranchE => SignlmmE)
        .ZeroE(ZeroE),
        .ALUOutE(ALUOutE),
        .WriteDataE(WriteDataE),
        .WriteRegE(WriteRegE),
        .PCBranchE(PCBranchE),
        
        .RegWriteM(RegWriteM),
        .MemtoRegM(MemtoRegM),
        .MemWriteM(MemWriteM),
        .BranchM(BranchM),
        .ZeroM(ZeroM),
        .ALUOutM(ALUOutM),
        .WriteDataM(WriteDataM),
        .WriteRegM(WriteRegM),
        .PCBranchM(PCBranchM)
    );

    memory_ram memory_ram_inst(
        .clk(clk),
        .we(MemWriteM),
        .A(ALUOutM),
        .WD(WriteDataM),
        .RD(RDM)
    );

    latch_d latch_d_inst(
        .clk(clk),

        .RegWriteM(RegWriteM),
        .MemtoRegM(MemtoRegM),
        .ALUOutM(ALUOutM),
        .RDM(RDM),
        .WriteRegM(WriteRegM),
        .RegWriteW(RegWriteW),
        .MemtoRegW(MemtoRegW),
        .ALUOutW(ALUOutW),
        .ReadDataW(ReadDataW),
        .WriteRegW(WriteRegW)
    );

    Mux MuxW(
            .sel(MemtoRegW),
            .in1(ReadDataW),
            .in2(ALUOutW),
            .out(ResultW)
        );

    assign  PCSrcM = BranchM & ZeroM;
    //assign  PCSrcM = 1'b0;
    assign  WriteDataE = RD2E;


endmodule