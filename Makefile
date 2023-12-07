.DEFAULT_GOAL := serve
.PHONY: all first-setup serve
.PHONY: clean
.PHONY: help

VENV_DIR := $(HOME)/.python/homelab-docs
REQS := requirements.txt
BIN := $(VENV_DIR)/Scripts
PYTHON := python

first-install:
	@echo "Creating virtual environment..."
	ifeq ($(OS),Windows_NT)
		# Create virtual environment for Windows
		$(PYTHON) -m venv $(VENV_DIR)
	else
		# Create virtual environment for non-Windows systems
		python3 -m venv $(VENV_DIR)
	fi
	@read -p "Press Enter to continue..."
	$(MAKE) install-dev
	@echo "Please run this command to activate homelab-docs:"
	ifeq ($(OS),Windows_NT)
		@echo ".$(VENV_DIR)/Scripts/activate"
	else {
		@echo "source $(VENV_DIR)/bin/activate"
	}
	@echo "You can now run \"make\" to get mkdocs running."


install-dev: activate-venv
	# Activate virtual environment directly
	@echo "Inside virtual environment..."

	# Install project requirements using pip
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install -r $(REQS)

activate-venv:
	if test "$(OS)" = "Win32NT"; then
		call $(VENV_DIR)/Scripts/activate
	else {
		source $(VENV_DIR)/bin/activate
	}

serve:
	@echo "Building mkdocs documentation..."
	mkdocs build
	@echo "Serving mkdocs documentation..."
	mkdocs serve

clean:
	rm -rf $(VENV_DIR)

.PHONY: help
help:
	@echo "Available Commands:"
	@echo "clean - removes the venv directory entirely"
	@echo "first-install - Runs first time installation"
	@echo "help - runs this command"
	@echo "install-dev - installs mkdocs in venv"
	@echo "serve - runs mkdocs build and mkdocs serve"
