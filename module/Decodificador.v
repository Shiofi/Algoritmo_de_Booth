`timescale 1ns / 1ps
  
module decodificador_digito1(
input clk,
input[7:0] eight_bit_value_switch1,
output reg [3:0] unidades_digito1= 0,
output reg [3:0] decenas_digito1= 0,
output reg [3:0] centenas_digito1= 0
);

reg [3:0] i=0;
reg [19:0] shift_register1= 0;
reg [3:0] unidades_temporales1=0;
reg [3:0] decenas_temporales1=0;
reg [3:0] centenas_temporales1=0;
reg [7:0] store_eight_bit_value1=0;
reg [7:0] Digito_decimal1=0;

always@ (posedge clk)
begin
    // para inicializar el algoritmo para switch1
    if(i==0 & (store_eight_bit_value1!= eight_bit_value_switch1))
        begin
            shift_register1= 20'd0;//se inicia el shift_register a 0
            store_eight_bit_value1= eight_bit_value_switch1;//se asigna el valor del numero en una variable temporal
            shift_register1[7:0]= eight_bit_value_switch1;// se almacenan los últimos 8 bits
            centenas_temporales1= shift_register1[19:16];//se toman los primeros 4 bits que hacen ref a 100s(3 digitos)
            decenas_temporales1= shift_register1[15:12];//se toman los siguientes 4 bits que hacen ref a 10s(2 digitos)
            unidades_temporales1= shift_register1[11:8];//se toman los 4 bits sobrantes que hacen ref a 1s(1 digitos)
            i=i+1;
        end        
    if (i<9 & i>0)
        begin
            //segun el algoritmo si alguna unidad es >=5 al inicio de la iteracion en su valor actual almacenado, se suma +3
            if (centenas_temporales1>=5)
                centenas_temporales1= centenas_temporales1+3;
            if (decenas_temporales1>=5)
                decenas_temporales1= decenas_temporales1+3;
            if (unidades_temporales1>=5)
                unidades_temporales1= unidades_temporales1+3;
            shift_register1 [19:8]={centenas_temporales1,decenas_temporales1,unidades_temporales1};
            //se mueve 1 bit a la izquierda
            shift_register1= shift_register1<<1;
            centenas_temporales1= shift_register1[19:16];//se va actualizando los valores almacenados de centenas
            decenas_temporales1= shift_register1[15:12];//se va actualizando los valores almacenados de decenas
            unidades_temporales1= shift_register1[11:8];//se va actualizando los valores almacenados de unidades
            i=i+1;//se repite hasta que i=9 segun el algoritmo
        end
     if (i==9)//se termina el algoritmo
        begin
            i=0;
            centenas_digito1= centenas_temporales1;// se asignan finalmente el digito correspondiente a centenas
            decenas_digito1= decenas_temporales1;//se asignan finalmente el digito correspondiente a decenas
            unidades_digito1= unidades_temporales1;//se asignan finalmente el digito correspondiente a unidades
        
            Digito_decimal1[7:0]= {centenas_digito1,decenas_digito1,unidades_digito1};
        end
Digito_decimal1[7:0]= {centenas_digito1,decenas_digito1,unidades_digito1};
end

endmodule

