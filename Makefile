# Makefile for my-verilog-examples
# Discovers and runs all simulation scripts in the repository.

# Find all directories containing run-simulation.sh
SIM_DIRS := $(shell find . -name "run-simulation.sh" -exec dirname {} \;)

.PHONY: all run clean help

all: help

help:
	@echo "Usage:"
	@echo "  make run    - Run every example's simulation"
	@echo "  make clean  - Remove all generated .vvp and .vcd files"

run:
	@echo "Starting simulations for all examples..."
	@for dir in $(SIM_DIRS); do \
		echo "======================================================================"; \
		echo "SIMULATING: $$dir"; \
		echo "======================================================================"; \
		(cd $$dir && ./run-simulation.sh) || exit 1; \
		echo ""; \
	done
	@echo "======================================================================"
	@echo "All simulations completed successfully."

clean:
	@echo "Cleaning up generated files (*.vvp, *.vcd)..."
	@find . -name "*.vvp" -type f -delete
	@find . -name "*.vcd" -type f -delete
	@echo "Cleanup complete."