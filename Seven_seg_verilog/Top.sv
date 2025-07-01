//top module

module Top #(
    parameter DIVISOR = 50_000_000 // 50MHz clock, 1Hz enable signal
)(
    input logic i_clk, 
    input logic rst_n, 
    output logic o_Seg_A,
    output logic o_Seg_B,
    output logic o_Seg_C,
    output logic o_Seg_D,
    output logic o_Seg_E,
    output logic o_Seg_F,
    output logic o_Seg_G
  
);


    logic en_1hz;
    logic [3:0] counter;


	Enable_1hz #(
		 .DIVISOR(DIVISOR)
	) u_Enable_1hz (
		 .clk(i_clk), 
		 .rst_n(rst_n),
		 .en_1hz(en_1hz)
	);



    always_ff @(posedge i_clk or negedge rst_n)
        begin
            if(!rst_n)
                counter <= 4'd0;
            else if(en_1hz)
                counter <= counter + 1;
        end
    
    Binary_To_7seg u_Binary_To_7seg (
        .i_clk(i_clk),
        .i_binary_num(counter),
        .o_Seg_A(o_Seg_A),
        .o_Seg_B(o_Seg_B),
        .o_Seg_C(o_Seg_C),
        .o_Seg_D(o_Seg_D),
        .o_Seg_E(o_Seg_E),
        .o_Seg_F(o_Seg_F),
        .o_Seg_G(o_Seg_G)
    );
endmodule