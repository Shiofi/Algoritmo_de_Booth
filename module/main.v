module mult_with_no_sm (
	clk,
	rst,
	A,
	B,
	mult_control,
	Q_LSB,
	Y
);
	parameter N = 8;
	input wire clk;
	input wire rst;
	input wire [N - 1:0] A;
	input wire [N - 1:0] B;
	input wire [4:0] mult_control;
	output reg [1:0] Q_LSB; //Lo corregi [0:1]
	output reg [(2 * N) - 1:0] Y;
	reg [N - 1:0] M;
	reg [N - 1:0] adder_sub_out;
	reg [2 * N:0] shift;
	reg [N - 1:0] HQ;
	reg [N - 1:0] LQ;
	reg Q_1;

	//reg_M
	always @(posedge clk or rst)
		if (rst)
			M <= 'b0;
		else
			M <= (mult_control[4] ? A : M); //load_A

	//adder/sub
	always @(*)
		if (mult_control[0]) //load add_sub
			adder_sub_out = M + HQ;
		else
			adder_sub_out = M - HQ;

	//shift registers
	always @(*) begin
		Y = {HQ, LQ};
		HQ = shift[2 * N:N + 1];
		LQ = shift[N:1];
		Q_1 = shift[0];
		Q_LSB = {LQ[0], Q_1};
	end
	always @(posedge clk or rst)
		if (rst)
			shift <= 'b0;
		else if (mult_control[1]) //load shift_HQ_LQ_Q_1
			shift <= $signed(shift) >>> 1;
		else begin
			if (mult_control[3]) // load B
				shift[N:1] <= B;
			if (mult_control[2]) // load add
				shift[2 * N:N + 1] <= adder_sub_out;
		end
endmodule
