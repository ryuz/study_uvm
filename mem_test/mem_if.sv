

interface mem_if
            (
                input   logic clk,
                input   logic reset
            );
    
    logic       en;
    logic       we;
    logic [3:0] addr;
    logic [7:0] wdata;
    logic [7:0] rdata;
   
endinterface

