module BCD_counter (
    input  logic clk,
    input  logic rst_n,
    input  logic en,       // enable signal for counting
    output logic [3:0] bcd_out
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bcd_out <= 4'b0000; // reset to 0
        else if (en) begin
            if (bcd_out < 4'd9)
                bcd_out <= bcd_out + 1; // increment
            else
                bcd_out <= 4'd0; // wrap to 0 after 9
        end
    end

endmodule
