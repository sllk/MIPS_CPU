`timescale 1ns/100ps

module ALU_tb();

    reg [31:0] A;
    reg [31:0] B;
    reg [2:0] F;
    wire [31:0] Y;
    wire zero;

    initial begin
        B = 32'h88888888;
        A = 32'h11111111;
 

             F = 3'b000;
        #3 F = 3'b001;
        #3 F = 3'b010;
        #3 F = 3'b011;
        #3 F = 3'b100;
        #3 F = 3'b101;
        #3 F = 3'b110;
        #3 F = 3'b111;
        #3;
    end

    ALU ALU_inst(
        .A(A),
        .B(B),
        .F(F),
        .Y(Y),
        .zero(zero)
    );

endmodule