module Sign_Extend(

    input   [15:0]  instrD,
    output  [31:0]  SignlmmD
);

assign SignlmmD = {{16{instrD[15]}} , {instrD[15:0]}};

endmodule