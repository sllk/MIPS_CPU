module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0] F,
    output reg [31:0] Y,
    output reg zero
    );

      always@(*)begin
        case(F)
            3'B000: Y = A&B;
            3'B001: Y = A|B;
            3'B010: Y = A+B;
            3'B100: Y = A&~B;
            3'B101: Y = A|~B;
            3'B110: Y = A-B;

            3'B011: Y = A/B;

            3'B111: begin
                        if (A<B)
                            Y=1;
                        else
                            Y=0;
                    end
            default:Y=32'bxxx;
        endcase

        if(A == B)
            zero = 0;
        else
            zero = 1;
    end
endmodule