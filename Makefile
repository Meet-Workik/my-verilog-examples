# my-verilog-examples Makefile

# Find all directories containing run-simulation.sh
SIM_DIRS := $(shell find . -name "run-simulation.sh" -exec dirname {} \;)

.PHONY: all clean help $(SIM_DIRS)

# Default target runs all simulations
all: $(SIM_DIRS)

# Target to run each simulation
$(SIM_DIRS):
	@echo "**********************************************************************"
	@echo "* RUNNING SIMULATION IN $@"
	@echo "**********************************************************************"
	@cd $@ && ./run-simulation.sh

# Target to clean up generated files (*.vvp and *.vcd)
clean:
	@echo "Cleaning up generated files (*.vvp, *.vcd)..."
	@find . -name "*.vvp" -delete
	@find . -name "*.vcd" -delete
	@echo "Done."

# Help target
help:
	@echo "Usage:"
	@echo "  make        - Run all simulations"
	@echo "  make clean  - Remove all generated *.vvp and *.vcd files"
	@echo "  make help   - Display this help message"
