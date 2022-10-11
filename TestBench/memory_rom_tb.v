`timescale 1ns/1ns

module memory_rom_tb();

    reg clk;
    reg [31:0] A;
    wire [31:0] RD;

    //reg [31:0] mem[7:0];

always begin
    clk = 1'b1;
    #10;
    clk = 1'b0;
    #10;
end

initial begin

    A = 32'b0000;
    #5  A = 32'b0001;
    #5  A = 32'b0010;
    #5  A = 32'b0011;
    #5  A = 32'b0100;
    #5  A = 32'b0101;
    #5  A = 32'b0110;
   //$readmemb("D:/Code/jizu/E3/mem_initia.txt",mem);
end

memory_rom memory_rom_inst
(
    .clk(clk),
    .A(A),
    .RD(RD)
);

endmodule