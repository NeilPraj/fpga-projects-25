module Top #(
    parameter DIVISOR = 50_000_00, // 50MHz clock,enable signal
    parameter DIVISOR_UPDATE = 5000 // 1ms update rate
)(
    input logic i_clk, 
    input logic rst_n, 
    // 7-segment display outputs for 4 digits (A-G per digit)
    output logic o_Seg1_A, output logic o_Seg1_B, output logic o_Seg1_C,
    output logic o_Seg1_D, output logic o_Seg1_E, output logic o_Seg1_F, output logic o_Seg1_G,
    output logic o_Seg2_A, output logic o_Seg2_B, output logic o_Seg2_C,
    output logic o_Seg2_D, output logic o_Seg2_E, output logic o_Seg2_F, output logic o_Seg2_G,
    output logic o_Seg3_A, output logic o_Seg3_B, output logic o_Seg3_C,
    output logic o_Seg3_D, output logic o_Seg3_E, output logic o_Seg3_F, output logic o_Seg3_G,
    output logic o_Seg4_A, output logic o_Seg4_B, output logic o_Seg4_C,
    output logic o_Seg4_D, output logic o_Seg4_E, output logic o_Seg4_F, output logic o_Seg4_G  
);
    

    logic en_1hz;
    logic en_update;
    logic [3:0] bcd_out;
    logic [1:0] digit_select;

    EnableGen #(DIVISOR) u_EnableGen (
        .clk(i_clk),
        .rst_n(rst_n),
        .en(en_1hz)
    );

    EnableGen #(DIVISOR_UPDATE) u_EnableGen_update (
        .clk(i_clk),
        .rst_n(rst_n),
        .en(en_update)
    );

    BCD_counter u_BCD_counter (
        .clk(i_clk),
        .rst_n(rst_n),
        .en(en_1hz),
        .bcd_out(bcd_out)
    );



    
    


endmodule