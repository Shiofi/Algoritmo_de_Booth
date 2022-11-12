module ff_cascada(A,CLK,rst,R1,R2,R3,R4);

    input A, CLK,rst;

    output reg R1,R2,R3,R4;

    always@ (posedge CLK,rst)
    begin
        if(rst)begin
            R1 = 0;
            R2 = 0;
            R3 = 0;
            R4 = 0;
        end

        // 5 flip flop D en cascada para A
        R1 <= A;
        R2 <= R1;
        R3 <= R2;
        R4 <= R3;
    end

endmodule

