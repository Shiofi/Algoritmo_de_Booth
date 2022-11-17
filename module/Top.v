`timescale 1ns / 1ps 
 
module main( 
input wire clk,
input wire [7:0] switch,
output wire [7:0] anode_ON, 
output wire [6:0] catodo_ON, 
output wire dp 
    ); 
     
assign dp = 1; 
wire [3:0] unidades_digito1;
wire [3:0] decenas_digito1;
wire [3:0] centenas_digito1;
//wire [3:0] unidades_digito2;
//wire [3:0] decenas_digito2;
//wire [3:0] centenas_digito2;
wire refresh_clock; 
wire [1:0] refreshcounter; 
wire [7:0] Digito_decimal1;
//wire [7:0] Digito_decimal2;

clock_divider refreshclock_generator(
.clk(clk),
.divided_clk(refresh_clock)
);
 
refreshcounter refreshcounter_wrapper( 
.refresh_clock(refresh_clock), 
.refreshcounter(refreshcounter) 
); 
 
anodos anodos_wrapper( 
.refreshcounter(refreshcounter), 
.anode_ON(anode_ON) 
); 

multiplexor_digito1 multiplexor_digito1_wrapper( 
.unidades_digito1(unidades_digito1),
.decenas_digito1(decenas_digito1),
.centenas_digito1(centenas_digito1), 
.refreshcounter(refreshcounter), 
.Digito_decimal1(Digito_decimal1)
//.unidades_digito2(unidades_digito2),
//.decenas_digito2(decenas_digito2),
//.centenas_digito2(centenas_digito2), 
//.Digito_decimal2(Digito_decimal2)
); 

decodificador_digito1 decodificador_digito1_wrapper(
.clk(clk),
.eight_bit_value_switch1(switch[7:0]),
.unidades_digito1(unidades_digito1),
.decenas_digito1(decenas_digito1),
.centenas_digito1(centenas_digito1)
); 

//decodificador_digito2 decodificador_digito2_wrapper(
//.clk(clk),
//.eight_bit_value_switch2(switch[15:8]),
//.unidades_digito2(unidades_digito2),
//.decenas_digito2(decenas_digito2),
//.centenas_digito2(centenas_digito2)
//); 
 
catodos catodos_wrapper( 
.digit1(Digito_decimal1),
//.digit2(Digito_decimal2),
.catodo_ON(catodo_ON) 
); 
 
endmodule