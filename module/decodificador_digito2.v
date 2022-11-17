`timescale 1ns / 1ps
  
module decodificador_digito2(
input clk,
input[7:0] eight_bit_value_switch2,
output reg [3:0] unidades_digito2= 0,
output reg [3:0] decenas_digito2= 0,
output reg [3:0] centenas_digito2= 0
);

reg [3:0] j=0;
reg [19:0] shift_register2= 0;
reg [3:0] unidades_temporales2=0;
reg [3:0] decenas_temporales2=0;
reg [3:0] centenas_temporales2=0;
reg [7:0] store_eight_bit_value2=0;
reg [7:0] Digito_decimal2=0;

always@ (posedge clk)
begin
    // para inicializar el algoritmo para switch1
    if(j==0 & (store_eight_bit_value2!= eight_bit_value_switch2))
        begin
            shift_register2= 20'd0;//se inicia el shift_register a 0
            store_eight_bit_value2= eight_bit_value_switch2;//se asigna el valor del numero en una variable temporal
            shift_register2[7:0]= eight_bit_value_switch2;// se almacenan los últimos 8 bits
            centenas_temporales2= shift_register2[19:16];//se toman los primeros 4 bits que hacen ref a 100s(3 digitos)
            decenas_temporales2= shift_register2[15:12];//se toman los siguientes 4 bits que hacen ref a 10s(2 digitos)
            unidades_temporales2= shift_register2[11:8];//se toman los 4 bits sobrantes que hacen ref a 1s(1 digitos)
            j=j+1;
        end        
    if (j<9 & j>0)
        begin
            //segun el algoritmo si alguna unidad es >=5 al inicio de la iteracion en su valor actual almacenado, se suma +3
            if (centenas_temporales2>=5)
                centenas_temporales2= centenas_temporales2+3;
            if (decenas_temporales2>=5)
                decenas_temporales2= decenas_temporales2+3;
            if (unidades_temporales2>=5)
                unidades_temporales2= unidades_temporales2+3;
            shift_register2 [19:8]={centenas_temporales2,decenas_temporales2,unidades_temporales2};
            //se mueve 1 bit a la izquierda
            shift_register2= shift_register2<<1;
            centenas_temporales2= shift_register2[19:16];//se va actualizando los valores almacenados de centenas
            decenas_temporales2= shift_register2[15:12];//se va actualizando los valores almacenados de decenas
            unidades_temporales2= shift_register2[11:8];//se va actualizando los valores almacenados de unidades
            j=j+1;//se repite hasta que i=9 segun el algoritmo
        end
     if (j==9)//se termina el algoritmo
        begin
            j=0;
            centenas_digito2= centenas_temporales2;// se asignan finalmente el digito correspondiente a centenas
            decenas_digito2= decenas_temporales2;//se asignan finalmente el digito correspondiente a decenas
            unidades_digito2= unidades_temporales2;//se asignan finalmente el digito correspondiente a unidades
        
            Digito_decimal2[7:0]= {centenas_digito2,decenas_digito2,unidades_digito2};
        end
Digito_decimal2[7:0]= {centenas_digito2,decenas_digito2,unidades_digito2};
end

endmodule
