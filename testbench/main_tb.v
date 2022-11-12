`timescale 1ns/1ns
`include "main.v"

module testbench;

parameter N = 8;
reg clk=0, rst;
reg [N - 1:0]A,B;
reg [4:0] mult_control;
wire [1:0] Q_LSB;
wire [(2 * N) - 1:0] Y;

mult_with_no_sm #(.N(8)) UUT(clk,rst,A,B,mult_control,Q_LSB,Y);

always begin
    //Mantiene el reloj operando
    clk = ~clk;
    #10;
end

initial begin
    rst = 1; #45;
    rst = 0;
    $dumpfile("mult_with_no_sm.vcd");
    $dumpvars(0, testbench);
    #45;
    $finish;
end

    
endmodule