`timescale 1ns / 1ps 
  
module multiplexor_digito1(
input[1:0] refreshcounter,
input[3:0] unidades_digito1, 
input [3:0] decenas_digito1, 
input [3:0] centenas_digito1,
//input[3:0] unidades_digito2, 
//input [3:0] decenas_digito2, 
//input [3:0] centenas_digito2, 
output reg[3:0] Digito_decimal1 
//output reg[3:0] Digito_decimal2 
); 
always@(refreshcounter) 
 begin 
     case(refreshcounter) 
     4'd0: 
         Digito_decimal1= unidades_digito1;//digito1 
     4'd1: 
         Digito_decimal1= decenas_digito1;//digito2
     4'd2: 
         Digito_decimal1= centenas_digito1;//digito3
     4'd3:
         Digito_decimal1= 0;
     //4'd4: 
      //   Digito_decimal2= unidades_digito2;//digito1 
     //4'd5: 
       //  Digito_decimal2= decenas_digito2;//digito2
     //4'd6: 
     //    Digito_decimal2= centenas_digito2;//digito3
     //4'd7:
     //    Digito_decimal2= 0;  
     
    endcase 
 end 
endmodule