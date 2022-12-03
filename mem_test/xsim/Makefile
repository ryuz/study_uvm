TOP_MODULE = mem_testbench
SRCS       = ../mem_testbench.sv

.PHONY: all
all: build run

.PHONY: build
build:
	xvlog -sv $(SRCS) -L uvm --include ../model
	xelab $(TOP_MODULE) -L uvm -timescale 1ns/1ps

.PHONY: run
run:
	xsim $(TOP_MODULE) -R --testplusarg "UVM_TESTNAME=mem_test"

.PHONY: clean
clean:
	rm -fr xsim.dir
	rm -fr *.pb
	rm -rf *.log *.jou

.PHONY: distclean
distclean: clean
	rm -fr *.vcd
	rm -fr *.wdb
