
`include "memory.sv"
`include "mem_if.sv"

module mem_testbench;

    `include "uvm_macros.svh"
    import uvm_pkg::*;
    `include "mem_model.svh"
    `include "mem_test.sv"
    
    bit     clk;
    always #5   clk = ~clk;
  
    bit     reset = 1;
    initial #20 reset =0;
    
    mem_if mif(.clk, .reset);
    
    memory DUT
        (
            .clk    (mif.clk),
            .reset  (mif.reset),
            .en     (mif.en),
            .we     (mif.we),
            .addr   (mif.addr),
            .wdata  (mif.wdata),
            .rdata  (mif.rdata)
        );
    
    initial begin 
        uvm_config_db#(virtual mem_if)::set(uvm_root::get(), "*", "vif", mif);
        $dumpfile("dump.vcd"); $dumpvars;
    end
    
    initial begin 
        run_test();
    end

endmodule
