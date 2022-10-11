`timescale 1ns/1ns

module memory_reg_tb();

    reg clk;
    reg we3;
    reg [4:0] A1;
    reg [4:0] A2;
    reg [4:0] A3;
    reg [31:0] WD3;

    wire [31:0] RD1;
    wire [31:0] RD2;
    //reg [31:0] mem[7:0];

always begin
    clk = 1'b1;
    #10;
    clk = 1'b0;
    #10;
end

initial begin
    we3 = 1'b1;
    
    WD3 = 32'hf000;
   A1 = 5'b0;
   A2 = 5'b0;
   A3 = 5'b0;
   #5  A1 = 5'b0001;
        A2 = 5'b0001;
        A3 = 5'b0001;
         #5  A1 = 5'b0010;
        A2 = 5'b0010;
        A3 = 5'b0010;
    //$readmemb("D:/Code/jizu/E4/mem_initia.txt",mem);
end

memory_reg memory_reg_inst
(
    .clk(clk),
    .we3(we3),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WD3(WD3),
    .RD1(RD1),
    .RD2(RD2)
);

endmodule