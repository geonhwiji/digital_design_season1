SRC_DIR = ../src
WORK_LIB = work.lib

all: clean set compile elab sim

clean:
	rm -rf cds.lib hdl.var $(WORK_LIB) waves.shm *.log *.key

set:
	touch cds.lib hdl.var
	mkdir $(WORK_LIB)
	echo "define work_lib ./$(WORK_LIB)" >> ./cds.lib
	echo "define WORK work_lib" >> ./hdl.var

compile:
	xmvlog -MESS -linedebug $(SRC_DIR)/*.v

elab:
	xmelab -MESS -access rwc tb_adder

sim:
	xmsim -MESS tb_adder -gui

