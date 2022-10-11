module memory_reg (
    input clk,
    input we3,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    
    output [31:0] RD1,
    output [31:0] RD2

);
    
    reg [31:0] mem[7:0];

initial
    $readmemb("D:/Code/jizu_final/reg_init.txt",mem);

always@(posedge clk)
    begin
    if (we3)
        mem[A3] <= WD3;
    end

assign RD1 = mem[A1];
assign RD2 = mem[A2];

endmodule