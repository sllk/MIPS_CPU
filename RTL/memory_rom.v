module memory_rom (
    input clk,
    input [31:0] A,
     
    output [31:0] RD
);
    
    reg [31:0] mem[32:0];
    
assign RD = mem[A];

initial begin
$readmemb("D:/Code/jizu_final/mem_initia.txt",mem);
end

endmodule