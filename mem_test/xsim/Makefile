SRCS = ../mem_test.sv ../memory.sv ../mem_if.sv

.PHONY: all
all: build run

.PHONY: build
build:
	xvlog -sv $(SRCS) -L uvm --include ../model/
	xelab mem_test -timescale 1ns/100ps -L uvm

.PHONY: run
run:
	xsim mem_test -R --testplusarg "UVM_TESTNAME=mem_model_test"

.PHONY: clean
clean:
	rm -fr xsim.dir
	rm -fr *.pb
	rm -rf *.log *.jou

.PHONY: distclean
distclean: clean
	rm -fr *.vcd
	rm -fr *.wdb
