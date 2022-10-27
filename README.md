# HDL-PROJECT
<h1 align="center"> Algoritmo_de_Booth- Multiplicador con signo </h1>

# Descripción general

Proyecto estudiantil desarrollado por los estudiantes David Vargas,Fiorela Chavarría,Jeaustin Paniagua, y Samuel Montenegro, los cuales son estudiantes del Instituto Tecnológico de Costa Rica(TEC)

El diseño de sistemas digitales requiere habilidad de implementación de algoritmos por medio de circuitos lógicos. Muchos algoritmos en la práctica usan iteraciones o búcles que a la hora de traducirlos a implementaciones de lógica booleana, surge la necesidad de un control lógico que habilite el correcto flujo de datos en circuito. Asimismo, las interfaces de bloque a bloque se diseñan con protocolos de bus para ayudar a estandarizar la comunicación entre unidades. Estos protocolos de bus facilitan las pruebas unitarias sobre bloques porque toda unidad se puede controlar de una manera similar.

El algoritmo de Booth es un método rápido y sencillo para obtener el producto de dos números binarios con signo en notación complemento a dos, el motivo de este se basa en que realizar una suma con dos números binarios es relativamente fácil, pero la multiplicación lleva un proceso algo más complicado. Con el algoritmo de Booth, resulta mucho más sencillo de implementar la multiplicación. 

# Especificación del diseño
- Subsistema de lectura de datos.
- Subsistema de cálculo de multiplicación
- Subsistema de conversión de binario a representación BCD.
- Subsistema de despliegue en display de 7 segmentos.
- Cada subsistema deberá estar adecuadamente registrado a la entrada y salida. El flujo de datos debe ser indicado de manera explícita.
- Para cada subsistema, será obligatorio presentar simulaciones tanto a nivel de RTL (pre-síntesis) como con información de temporizado (post-síntesis y post-colocación y-ruteo)
- Diagrama de bloques para cada subsistema, con su funcionalidad descrita y su esquema de interconexión. Deberá presentarse adecuadamente la ruta de datos desde la salida hasta la entrada, con una descripción comportamental de cada sub-bloque dentro de los subsistemas (i.e., muxes, decos, registros, etc.)



# Metodología de trabajo en equipo
- Toda comunicación de los miembros del grupo es vía WhatsApp o Discord
- Cada miembro debe tener minímo una tarea asignada por concenso del grupo
- Cada miembro debe cumplir con la tarea asignada
- En caso de dudas o inconvenientes comunicarlo a los demás miembros y de ser necesario con el profesor
- Tener instalado Vivado
- De ser necesario, los mimebros pueden variar sobre que tarea realizar según fueron asignadas
- Mantener el repositorio de GitHub actualizado

# Descripción general de los subsistemas
## Subsistema 1: Subsistema de lectura
Para la funcionalidad y posterior implementación de este subsistema, este bloque adquiere los operando A y B de 8 bits cada uno para realizar la operación de multiplicación, donde A y B se interpretan con signo en complemento a 2.La entrada del código debe ser capturada y sincronizada con el sistema principal por medio de un circuito antirebote de  4 etapas (4 FF en cascada) por switch. Se sincroniza con el sistema esperando la señal de pulsacion de 500ms, donde al cumplirse este tiempo, el sistema da inicio a la operación aritmética de multiplicación. Cada bit adquirido por el sistema luego del paso complemento a dos, se debe desplegar en un LED próximo al switch para indicar como fue leído.
## Diagrama de bloques del Subsistema 1

![Diagrama sin título-Page-1 drawio](https://user-images.githubusercontent.com/111306099/198240037-2b19a6e5-e269-4fed-b81f-b192ed4613fc.png)

## Circuito antirrebotes 

![Diagrama sin título-Página-2 drawio](https://user-images.githubusercontent.com/111306099/198240703-50c60287-3e5f-481e-abbb-e2ce6b16383c.png)


## Subsistema 2: Subsistema de cálculo de multiplicación
Este sistema se encarga de recibir los operandos A y B del subsistema de lectura. La operación de multiplicación se iniciará cuando el subsistema de lectura le indique a este subsistema que los operandos son válidos por medio de una bandera valid. El cálculo de multiplicación con signo se realizará de manera iterativa por medio del Algoritmo de
Booth. Este bloque indicará al siguiente bloque consecutivo cuando el resultado de la multiplicación está estable para ser muestreado con una señal done
## Diagrama de bloques del Subsistema 2
AQUI VA EL DIAGRAMA

## Subsistema 3: Subsistema de conversión de binario a representación BCD
Este sistema registrará el resultado del bloque anterior (16 bits con signo) y lo convierte en un formato BCD. Deberá generar al menos 5 dígitos en BCD y uno de signo para el siguiente bloque. Se indicará al siguiente bloque por medio de una bandera de done cuando está lista la conversión para registrar.
## Diagrama de bloques del Subsistema 3
AQUI VA EL DIAGRAMA

## Subsistema 4: Subsistema de despliegue en display de 7 segmentos.
Este subsistema toma el resultado de la multiplicación en BCD y los despliega en los dispositivos 7 segmentos disponibles en la placa, de forma decimal e incluyendo el signo.
Deberá utilizar al menos 6 dígitos disponibles del 7 segmentos. El sistema deberá tener la tasa de refresco adecuada para una visualización cómoda por parte del
usuario.
## Diagrama de bloques del Subsistema 4
AQUI VA EL DIAGRAMA
