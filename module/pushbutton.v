module pushbutton (push_button,CLK,rst,count,valid);

input push_button, CLK, rst;
output reg [3:0]count, valid;

always@(posedge CLK, rst)
begin
    if(rst)
        valid = 0;
    if (count == 6)
        valid = 1;
    else if(push_button)
        count = count + 1;
    else
        count = 0;
end
    
endmodule