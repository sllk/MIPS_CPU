module memory_ram (
    input clk,
    input we,
    input [31:0] A,
    input [31:0] WD,
    
    output [31:0] RD
);
    
    reg [31:0] mem[7:0];

initial
    $readmemb("D:/Code/jizu_final/ram_init.txt",mem);


always@(posedge clk)
    begin
    if (we)
        mem[A] <= WD;
    end

assign RD = mem[A];


endmodule