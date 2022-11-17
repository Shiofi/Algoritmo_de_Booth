`timescale 1ns / 1ps 
 
 
module anodos( 
input [1:0]refreshcounter,
output reg[7:0] anode_ON   
    );

always@(refreshcounter) 
    begin 
        case (refreshcounter) 
            4'b0000: 
                anode_ON = 8'b11111110;//anodo en la posicion cero 
            4'b0001: 
                anode_ON = 8'b11111101;//anodo en la posicion uno 
            4'b0010: 
                anode_ON = 8'b11111011;//anodo en la posicion dos
            4'b0011: 
                anode_ON = 8'b11110111;//anodo en la posicion tres
            //4'b0100: 
              //  anode_ON = 8'b11101111;//anodo en la posicion cuatro 
            //4'b0101: 
             //   anode_ON = 8'b11011111;//anodo en la posicion cinco 
            //4'b0110: 
            //    anode_ON = 8'b10111111;//anodo en la posicion seis
            //4'b0111: 
            //    anode_ON = 8'b01111111;//anodo en la posicion siete 
             
        endcase 
     end
endmodule