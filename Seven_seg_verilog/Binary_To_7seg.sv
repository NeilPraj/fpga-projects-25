module Binary_To_7seg (
    input i_clk, 
    input [3:0] i_binary_num, 
    output o_Seg_A,
    output o_Seg_B,
    output o_Seg_C,
    output o_Seg_D,
    output o_Seg_E,
    output o_Seg_F,
    output o_Seg_G
);
    
reg[6:0] r_Hex_Encoding = 7'h00;

always_ff @(posedge i_clk)
    begin
        case (i_binary_num)
			  4'b0000 : r_Hex_Encoding <= ~7'h7E;
			  4'b0001 : r_Hex_Encoding <= ~7'h30;
			  4'b0010 : r_Hex_Encoding <= ~7'h6D;
			  4'b0011 : r_Hex_Encoding <= ~7'h79;
			  4'b0100 : r_Hex_Encoding <= ~7'h33;          
			  4'b0101 : r_Hex_Encoding <= ~7'h5B;
			  4'b0110 : r_Hex_Encoding <= ~7'h5F;
			  4'b0111 : r_Hex_Encoding <= ~7'h70;
			  4'b1000 : r_Hex_Encoding <= ~7'h7F;
			  4'b1001 : r_Hex_Encoding <= ~7'h7B;
			  4'b1010 : r_Hex_Encoding <= ~7'h77;
			  4'b1011 : r_Hex_Encoding <= ~7'h1F;
			  4'b1100 : r_Hex_Encoding <= ~7'h4E;
			  4'b1101 : r_Hex_Encoding <= ~7'h3D;
			  4'b1110 : r_Hex_Encoding <= ~7'h4F;
			  4'b1111 : r_Hex_Encoding <= ~7'h47;
			  default : r_Hex_Encoding <= ~7'h7E;
        endcase
    end
// r_Hex_Encoding[7] is unused
assign o_Seg_A = r_Hex_Encoding[6];
assign o_Seg_B = r_Hex_Encoding[5];
assign o_Seg_C = r_Hex_Encoding[4];
assign o_Seg_D = r_Hex_Encoding[3];
assign o_Seg_E = r_Hex_Encoding[2];
assign o_Seg_F = r_Hex_Encoding[1];
assign o_Seg_G = r_Hex_Encoding[0];

endmodule