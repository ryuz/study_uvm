
class mem_seq_item extends uvm_sequence_item;
    rand    bit             en;
    rand    bit             we;
    rand    bit     [3:0]   addr;
    rand    bit     [7:0]   wdata;
            bit     [7:0]   rdata;
  
    `uvm_object_utils_begin(mem_seq_item)
        `uvm_field_int(en, UVM_ALL_ON)
        `uvm_field_int(we, UVM_ALL_ON)
        `uvm_field_int(addr, UVM_ALL_ON)
        `uvm_field_int(wdata, UVM_ALL_ON)
    `uvm_object_utils_end
    
    function new(string name = "mem_seq_item");
        super.new(name);
    endfunction
    
endclass
