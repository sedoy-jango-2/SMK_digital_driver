module PWM_Geneator(
	input        Clk,
	input [31:0] total_dur,
	input [31:0] high_dur,
	output reg   PWM
);

reg [31:0] tick;

always @ (posedge Clk)
begin
	if (tick >= total_dur)
	begin
		tick <= 0;
	end
	else
		tick <= tick + 1;
end

always @ (negedge Clk)
begin
	PWM <= (tick < high_dur)?1'b1:1'b0;//duck die width(5us)250  
end


endmodule
