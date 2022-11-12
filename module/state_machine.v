module seq_det (clk, rst, seq_in, det_out);

    input clk, rst, seq_in;
    output det_out;
    parameter IDLE = 4'b0001,
              S0   = 4'b0010,
              S1   = 4'b0100,
              S2   = 4'b1000;
    reg [3:0]current, next;

    always@(posedge clk) //Current state logic
    begin
        if(rst)
            current <= IDLE;
        else
            current <= next;
    end

    always@(current, seq_in) //Next state logic
        begin
            next = IDLE; //Default state
            case ( current )
                IDLE: begin if(seq_in) next = S0; end
                S0:   begin if(seq_in) next = S1; end
                S1:   begin if(~seq_in) next = S2;
                              else next = S1;     end
                S2:   begin if(seq_in) next = S0; end
            endcase
        end
    assign det_out = (current == S2) ? 1:0; //Output logic
endmodule