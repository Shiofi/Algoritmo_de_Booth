`timescale 1ns/1ns
`include "nuestraFSM.v"

module testbench;

reg clk = 0, rst = 0, Q_LSQ_1 = 0, Q_LSQ_0 = 0;
wire load_add, load_A, load_B, shift_HQ_LQ_Q_1, add_sub;

nuestraFSM UUT(clk, rst, Q_LSQ_1, Q_LSQ_0,load_add, load_A, load_B, shift_HQ_LQ_Q_1, add_sub);

always begin
    //Mantiene el reloj operando
    clk = ~clk;
    #10;
end

initial begin
    $dumpfile("nuestraFSM.vcd");
    $dumpvars(0, testbench);
    rst = 1; #5;
    rst = 0; #5;

    Q_LSQ_1 = 0; #15;
    Q_LSQ_0 = 0; #15;

    Q_LSQ_1 = 0; #15;
    Q_LSQ_0 = 1; #20;

    Q_LSQ_1 = 1; #15;
    Q_LSQ_0 = 0; #20;
    #75;
    $finish;
end

endmodule