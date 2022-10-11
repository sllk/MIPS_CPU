`timescale 1ns/1ns

module memory_ram_tb();

    reg clk;
    reg we;
    reg [31:0] A;
    reg [31:0] WD;

    wire [31:0] RD;
    //reg [31:0] mem[7:0];

always begin
    clk = 1'b1;
    #10;
    clk = 1'b0;
    #10;
end

initial begin
    we = 1'b1;
    WD = 32'hf001;
     A = 32'h0000;
     #5 A = 32'b0001;
     #5 A = 32'b0010;
     #5 A = 32'b0011;
     #5 A = 32'b0100;
     #5 A = 32'b0101;
     #5 A = 32'b0110;
     #5 A = 32'b0111;
     #5 A = 32'b0111;
     #3;
   
  //  $readmemb("D:/Code/jizu/E2/mem_initia.txt",mem);
end

memory_ram memory_ram_inst
(
    .clk(clk),
    .we(we),
    .A(A),
    .WD(WD),
    .RD(RD)
);

endmodule