module  Latch_PC(
    input               clk,

    input       [31:0]  PC,
    input               Rst,

    output  reg [31:0]  PCF
);

always @(posedge clk)begin
    if(!Rst) begin
            
           PCF <= PC;
        end
    else
        PCF <= 32'b0;
end

endmodule