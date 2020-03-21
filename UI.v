module UI
(
	input Clk,
	input iKey,
	input [3:0] iSW,
	output reg [7:0] oAngle
);

`define AdjAngle 1
`define MAX_Angle 180
`define MIN_Angle 0

reg [21:0]	count;
reg 			click1;

always@(posedge Clk)
begin
	begin
		if(click1 == 1'b1 )
		begin
			if(count[21] & (oAngle != `MAX_Angle))
			begin
				count <= 0;
				oAngle <= oAngle + `AdjAngle;
			end
			else
				count <= count + iSW;
		end
		else
		begin
			if(count[21] & (oAngle != `MIN_Angle))
			begin
				count <= 0;
				oAngle <= oAngle - `AdjAngle;
			end
			else
				count <= count + iSW;
		end
	end
end
 
always@(posedge iKey)
begin
	click1 = click1 + 1'b1;
end

endmodule 