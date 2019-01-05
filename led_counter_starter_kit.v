module led_counter_starter_kit(
output reg [7:0] led_out,
input sw_n,
input reset_n,
input clk,
output [7:0] cur_st,
output [7:0] nex_st
);

reg [7:0] current_state;
reg [7:0] next_state;

parameter S0 = 8'hFF;
parameter S1 = 8'hFE;
parameter S2 = 8'hFC;
parameter S3 = 8'hF8;
parameter S4 = 8'hF0;
parameter S5 = 8'hE0;
parameter S6 = 8'hC0;
parameter S7 = 8'h80;
parameter S8 = 8'h00;
		  
always @(negedge sw_n, negedge reset_n)	begin
	if (~reset_n)
		current_state <= S0;
	else
		current_state <= next_state;
end // always @(posedge clk)

always @(sw_n, current_state) begin
	case (current_state)
		S0: begin 
			next_state = S1;
			led_out = S0;
			end

		S1: begin 
			next_state = S2;
			led_out = S1;
			end

		S2: begin 
			next_state = S3;
			led_out = S2;
			end

		S3: begin 
			next_state = S4;
			led_out = S3;
			end

		S4: begin 
			next_state = S5;
			led_out = S4;
			end

		S5: begin 
			next_state = S6;
			led_out = S5;
			end

		S6: begin 
			next_state = S7;
			led_out = S6;
			end

		S7: begin 
			next_state = S8;
			led_out = S7;
			end

		S8: begin 
			next_state = S0;
			led_out = S8;
			end

		default: next_state = S0;

		endcase // current_state
	end

assign cur_st	= current_state	;
assign nex_st	= next_state	;



/*always @(posedge clk)	begin
	if (~reset_n)
		led_out <= S0;
	else begin
		case (current_state)
			S0: led_out <= S1;
			S1: led_out <= S2;
			S2: led_out <= S3;
			S3: led_out <= S4;
			S4: led_out <= S5;
			S5: led_out <= S6;
			S6: led_out <= S7;
			S7: led_out <= S0;
		endcase // case(current_state)
	end 

end // always @(posedge  clk)*/


endmodule // led_counter_starter_kit

