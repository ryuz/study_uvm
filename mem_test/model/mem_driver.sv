class mem_driver extends uvm_driver #(mem_seq_item);
    protected virtual mem_if vif;

    `uvm_component_utils(mem_driver)

   
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if ( !uvm_config_db#(virtual mem_if)::get(this, "", "vif", vif) ) begin
            `uvm_fatal("NO_VIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
        end
    endfunction : build_phase

    virtual task run_phase(uvm_phase phase);
        mem_seq_item req;
        mem_seq_item rsp;
        forever begin
            if ( vif.reset ) begin
                vif.en <= 1'b0;
            end
            else begin
                seq_item_port.get(req);
                vif.en    <= req.en;
                vif.we    <= req.we;
                vif.addr  <= req.addr;
                vif.wdata <= req.wdata;
                rsp = new();
                rsp.set_id_info(req);
                seq_item_port.put(rsp);
            end
            @(posedge vif.clk);
        end
    endtask : run_phase

endclass
