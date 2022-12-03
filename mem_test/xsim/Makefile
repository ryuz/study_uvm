.PHONY: all

FILELIST =
FILELIST += ../mem_test.sv ../memory.sv ../mem_if.sv

all:
	xvlog -sv $(FILELIST) -L uvm --include ../model/
	xelab mem_test -timescale 1ns/100ps -L uvm
	xsim mem_test -R --testplusarg "UVM_TESTNAME=mem_model_test"

clean:
	rm -rf *.log *.jou *.dir *.pb
