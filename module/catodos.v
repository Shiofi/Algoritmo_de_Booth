`timescale 1ns / 1ps 
 
 
module catodos(
input [3:0] digit1,
//input [3:0] digit2, 
output reg[6:0] catodo_ON=0 
); 

always @(digit1) 
    begin 
     case(digit1) 
     4'd0: catodo_ON = 7'b0000001; // "0"   
     4'd1: catodo_ON = 7'b1001111; // "1"  
     4'd2: catodo_ON = 7'b0010010; // "2"  
     4'd3: catodo_ON = 7'b0000110; // "3"  
     4'd4: catodo_ON = 7'b1001100; // "4"  
     4'd5: catodo_ON = 7'b0100100; // "5"  
     4'd6: catodo_ON = 7'b0100000; // "6"  
     4'd7: catodo_ON = 7'b0001111; // "7"  
     4'd8: catodo_ON = 7'b0000000; // "8"   
     4'd9: catodo_ON = 7'b0000100; // "9"  
     default: catodo_ON = 7'b0000001; // "0" 
     endcase
    end 
//always @(digit2) 
//    begin 
//     case(digit2) 
//     4'd0: catodo_ON = 7'b0000001; // "0"   
//     4'd1: catodo_ON = 7'b1001111; // "1"  
//     4'd2: catodo_ON = 7'b0010010; // "2"  
//     4'd3: catodo_ON = 7'b0000110; // "3"  
//     4'd4: catodo_ON = 7'b1001100; // "4"  
//     4'd5: catodo_ON = 7'b0100100; // "5"  
 //    4'd6: catodo_ON = 7'b0100000; // "6"  
//     4'd7: catodo_ON = 7'b0001111; // "7"  
//     4'd8: catodo_ON = 7'b0000000; // "8"   
//     4'd9: catodo_ON = 7'b0000100; // "9"  
//     default: catodo_ON = 7'b0000001; // "0" 
//     endcase
//    end     
endmodule