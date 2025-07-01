`timescale 1ns / 1ps

module Top_tb;

    // Signal Declarations
    logic clk;
    logic rst_n;
    logic seg_A;
    logic seg_B;
    logic seg_C;
    logic seg_D;
    logic seg_E;
    logic seg_F;
    logic seg_G;

    // Instantiate Device Under Test (DUT)
    Top #(
        .DIVISOR(5000)  // faster enable for simulation
    ) uut (
        .i_clk(clk),
        .rst_n(rst_n),
        .o_Seg_A(seg_A),
        .o_Seg_B(seg_B),
        .o_Seg_C(seg_C),
        .o_Seg_D(seg_D),
        .o_Seg_E(seg_E),
        .o_Seg_F(seg_F),
        .o_Seg_G(seg_G)

    );

    // Generate 50 MHz clock (20ns period)
    always #10 clk = ~clk;

    // Test Procedure
    initial begin
        $display("Time\tclk\trst_n\ten_1hz\tcounter\tSegments");
        $monitor("%0t\t%b\t%b\t%0d\t%b", 
                $time, clk, rst_n, uut.counter, 
                {seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G});


        clk = 0;
        rst_n = 0;

        // Apply reset
        #100;
        rst_n = 1;

        // Wait long enough to observe activity
        #1_000_000;

        $stop;
    end

endmodule
