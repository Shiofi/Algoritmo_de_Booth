`timescale 1ns/1ns
`include "ff_cascada.v"

module testbench;

reg A = 0, CLK = 0, rst = 0;
wire R1,R2,R3,R4;

ff_cascada UUT(A,CLK,rst,R1,R2,R3,R4);

always begin
    //Mantiene el reloj operando
    CLK = ~CLK;
    #10;
end

initial begin
    rst = 1; #45;
    rst = 0;
    $dumpfile("ff_cascada.vcd");
    $dumpvars(0, testbench);
    A = 0; #45;
    A = 1; #45;
    A = 0; #45;
    #45;
    $finish;
end

endmodule