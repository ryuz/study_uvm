class mem_scoreboard extends uvm_scoreboard;

    uvm_analysis_imp#(mem_seq_item, mem_scoreboard) item_collected_export;

    `uvm_component_utils(mem_scoreboard)
    
    logic           rd_en;
    logic   [3:0]   rd_addr;
    logic   [7:0]   mem [0:15];

    function new (string name, uvm_component parent);
        super.new(name, parent);

        rd_en = 1'b0;
        for ( int i = 0; i < 16; ++i ) begin
            mem[i] = '1;
        end
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        item_collected_export = new("item_collected_export", this);
    endfunction: build_phase
  
    virtual function void write(mem_seq_item pkt);
        if ( rd_en ) begin
            assert ( pkt.rdata == mem[rd_addr] ) begin
                `uvm_info(get_type_name(),
                    $sformatf("read add : %0h rdata : %0h", 
                    rd_addr, pkt.rdata), UVM_LOW)
            end
            else begin
                `uvm_error(get_type_name(),
                    $sformatf("read data mismatch. addr : %0h rdata : %0h Expected : %0h", 
                    rd_addr, pkt.rdata, mem[rd_addr]))
            end
        end

        if ( pkt.en && pkt.we ) begin
            `uvm_info(get_type_name(),
                $sformatf("write addr : %0h wdata : %0h", 
                pkt.addr, pkt.wdata), UVM_LOW)
            mem[pkt.addr] = pkt.wdata;
        end
        rd_en   = pkt.en && !pkt.we;
        rd_addr = pkt.addr;
    endfunction

    virtual task run_phase(uvm_phase phase);
    endtask

endclass
