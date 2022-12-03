class mem_model_test extends uvm_test;
    `uvm_component_utils(mem_model_test)

    mem_model_env env;
    mem_sequence  seq;
//    mem_wr_seq    wr_seq;
//    mem_rd_seq    rd_seq;

    function new(string name = "mem_model_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env = mem_model_env::type_id::create("env", this);
        seq = mem_sequence::type_id::create("seq");
//        wr_seq = mem_wr_seq::type_id::create("wr_seq");
//        rd_seq = mem_rd_seq::type_id::create("rd_seq");
    endfunction

    task run_phase(uvm_phase phase);
        $display("!!!!!!!!!!mem_model_test run_phase!!!!!!!!!!!!");
        phase.raise_objection(this);
//        repeat (3) begin
          seq.start(env.mem_agnt.sequencer);
//          wr_seq.start(env.mem_agnt.sequencer);
//        end
        phase.drop_objection(this);
    endtask

endclass
