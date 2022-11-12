module nuestraFSM (clk, rst,
            Q_LSQ_1, Q_LSQ_0, //entradas
            load_add, load_A, load_B, shift_HQ_LQ_Q_1, add_sub);//salidas

    input clk, rst, Q_LSQ_1, Q_LSQ_0; //entradas
    output reg load_add, load_A, load_B, shift_HQ_LQ_Q_1, add_sub; //salidas
    parameter IDLE = 2'b00,
              S0   = 2'b01,
              S1   = 2'b10,
              S2   = 2'b11;
    reg [1:0]current, next;

    always@(posedge clk) //Current state logic
    begin
        if(rst)
            current <= IDLE;
        else
            current <= next;
    end

    always@(*) //Next state logic
        begin
            next = IDLE; //Default state
            case ( current ) //Aqui va la tabla de transicion de estados
                IDLE: next = S0;
                S0:   begin 
                        if(Q_LSQ_1 & ~Q_LSQ_0) next = S1;
                        else if(~Q_LSQ_1 & Q_LSQ_0) next = S2;
                        else next = S0;
                      end
                S1:   next = S0;
                S2:   next = S0;
            endcase
        end
    always@(*) begin
    if (current == IDLE) begin
        assign load_add = 1; assign load_A = 1; assign load_B = 1;
        assign shift_HQ_LQ_Q_1 = 0; assign add_sub = 1;
    end
    else if (current == S0) begin
        assign load_add = 0; assign load_A = 1; assign load_B = 0;
        assign shift_HQ_LQ_Q_1 = 1; assign add_sub = 0;
    end
    else if (current == S1)begin
        assign load_add = 1; assign load_A = 1; assign load_B = 0;
        assign shift_HQ_LQ_Q_1 = 0; assign add_sub = 0;
    end
    else begin
        assign load_add = 1; assign load_A = 1; assign load_B = 0;
        assign shift_HQ_LQ_Q_1 = 0; assign add_sub = 1;
    end
    end
endmodule