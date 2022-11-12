`timescale 1ns/1ns
`include "state_machine.v"

module testbench;

reg clk = 0, rst = 0, seq_in;
wire det_out;

seq_det UUT(clk, rst, seq_in, det_out);

always begin
    //Mantiene el reloj operando
    clk = ~clk;
    #10;
end

initial begin
    $dumpfile("state_machine.vcd");
    $dumpvars(0, testbench);
    rst = 1; #5;
    rst = 0; #5;
    seq_in = 1; #35;
    seq_in = 0; #15;
    #75;
    $finish;
end

endmodule