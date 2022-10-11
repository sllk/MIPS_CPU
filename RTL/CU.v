module CU(
    input       [5:0]   op,
    input       [5:0]   funct,

    output  reg         RegWrite,
    output  reg         RegDst,
    output  reg         AluSrc,
    output  reg         Branch,
    output  reg         MemWrite,
    output  reg         MemtoReg,
    output  reg [2:0]   ALUControl
);

    reg  [1:0]   ALUOp;

always @(*) begin
    
        case (op)
            6'b000000:{RegWrite,RegDst,AluSrc,Branch,MemWrite,MemtoReg,ALUOp} = 8'b11000010;        //reg
            6'b100011:{RegWrite,RegDst,AluSrc,Branch,MemWrite,MemtoReg,ALUOp} = 8'b10100000;        //lw
            6'b101011:{RegWrite,RegDst,AluSrc,Branch,MemWrite,MemtoReg,ALUOp} = 8'b00101000;        //sw
            6'b000100:{RegWrite,RegDst,AluSrc,Branch,MemWrite,MemtoReg,ALUOp} = 8'b00010001;        //beq
            6'b001000:{RegWrite,RegDst,AluSrc,Branch,MemWrite,MemtoReg,ALUOp} = 8'b10100000;        //addi

            6'b010000:{RegWrite,RegDst,AluSrc,Branch,MemWrite,MemtoReg,ALUOp} = 8'b11000110;        //ram
            default:   {RegWrite,RegDst,AluSrc,Branch,MemWrite,MemtoReg,ALUOp} = 8'bxxx0xxxx;
        endcase
        
        case (ALUOp)
            2'b00:begin
                    ALUControl = 3'b010;   //add 
                      
            end
            2'b01:begin
                    ALUControl = 3'b110;   //Subtracti
            end
            2'b10:begin
                    case (funct)
                        6'b100000:  ALUControl = 3'b010;    //Addi
                        6'b100010:  ALUControl = 3'b110;    //Subtract
                        6'b100100:  ALUControl = 3'b000;    //And
                        6'b100101:  ALUControl = 3'b001;    //Or
                        6'b101010:  ALUControl = 3'b111;    //SLT

                        6'b100001:  ALUControl = 3'b011;    //div

                        default:    ALUControl = 3'bxxx;
                    endcase
            end
        endcase
            
end
    
endmodule