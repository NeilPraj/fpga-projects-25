//1hz enable generator 

module EnableGen #(parameter DIVISOR = 50_000_000)(
    input   logic clk, // 50MHz clock
    input   logic rst_n, // active low reset
    output  logic en // 1Hz enable signal
);


    logic [$clog2(DIVISOR)-1:0] counter;


    always_ff @(posedge clk or negedge rst_n)
        begin
            if(!rst_n)
                begin
                    counter <= '0;
                    en <= 1'b0;
                end
            else
                begin
                    if(counter == DIVISOR -1 )
                        begin
                            counter <= '0;
                            en <= 1'b1; // set the enable signal high for 1 clock cycle
                        end
                    else
                        begin
                            counter <= counter + 1;
                            en <= 1'b0; // keep the enable signal low
                        end
                end
        end
endmodule       
