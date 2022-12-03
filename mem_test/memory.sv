
module memory
        (
            input   wire            clk,
            input   wire            reset,

            input   wire            en,
            input   wire            we,
            input   wire    [3:0]   addr,
            input   wire    [7:0]   wdata,
            output  reg     [7:0]   rdata
        );

    logic   [7:0]   mem     [0:15];

    initial begin
        for ( int i = 0; i < 16; ++i ) begin
            mem[i] = '1;
        end
    end

    always_ff @(posedge clk) begin
        if ( reset ) begin
            rdata <= '0;
        end
        else if ( en ) begin
            if ( we ) begin
                mem[addr] <= wdata; // write
            end
            else begin
                rdata <= mem[addr]; // read
            end
        end
    end

endmodule
