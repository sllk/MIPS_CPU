`timescale 1ns/100ps

module CPU_tb();

    reg clk;
    reg Rst;


initial begin
    
    clk = 1;
    Rst = 1;

    

    #500Rst = 0;
    #500Rst = 1;
    #500Rst = 0;
    #500Rst = 1;
    #500Rst = 0;
    #500Rst = 1;
    #500Rst = 0;
end

always begin
    #500clk = 0;

    #500clk = 1;
end

CPU CPU_inst(
    .clk(clk),
    .Rst(Rst)

);

endmodule