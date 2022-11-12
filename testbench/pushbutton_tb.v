`timescale 1ns/1ns
`include "pushbutton.v"

module testbench;

reg push_button = 0, CLK = 0, rst = 0;
wire [3:0]count, valid;

pushbutton UUT(push_button, CLK,rst,count,valid); //

    always begin
    //Mantiene el reloj operando
    CLK = ~CLK;
    #10;
end

initial begin
    $dumpfile("pushbutton.vcd");
    $dumpvars(0, testbench);
    
    rst = 1; #45;
    rst = 0;
    push_button = 0; #45;
    push_button = 1; #200;
    push_button = 0; #45;
    #45;
    $finish;
end
endmodule