.DEFAULT_GOAL := serve

.PHONY: all first-setup serve
.PHONY: clean
.PHONY: test

VENV_DIR := $(HOME)/.python/homelab-docs

# Detect operating system using the `Get-Host` cmdlet
OS := $(shell $([System.Environment]::OSVersion).Platform)

first-install:
	@echo "Activating virtual environment..."
	if ($(OS) -contains "Win32NT") {
		# Activate virtual environment for Windows
		python -m venv $(VENV_DIR)
	} else {
		# Activate virtual environment for non-Windows systems
		python3 -m venv $(VENV_DIR)
	}
	@read -p "Press Enter to continue..."
	$(MAKE) install-dev
	@echo "Please run this command to activate homelab-docs:"
	if ($(OS) -contains "Win32NT") {
		@echo ". $(VENV_DIR)/Scripts/activate"
	} else {
		@echo "source $(VENV_DIR)/bin/activate"
	}
	@echo "You can now run \"make\" to get mkdocs running."

install-dev:
	# Activate virtual environment directly
	@echo "Inside virtual environment..."

	# Install project requirements using pip
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install -r requirements.txt

activate-venv:
	# Activate virtual environment directly
	if ($(OS) -contains "Win32NT") {
		. $(VENV_DIR)/Scripts/activate
	} else {
		. $(VENV_DIR)/bin/activate
	}

serve:
	@echo "Building mkdocs documentation..."
	mkdocs build
	@echo "Serving mkdocs documentation..."
	mkdocs serve

clean:
	# Add clean functionality if needed

test:
	# Add test functionality if needed
