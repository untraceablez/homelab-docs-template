.DEFAULT_GOAL := serve
.PHONY: all first-setup serve
.PHONY: clean
.PHONY: test

VENV_DIR := $(HOME)/.python/homelab-docs

first-setup:
    @echo "Activating virtual environment..."
    python3 -m venv $(VENV_DIR)
    @read -p "Press Enter to continue"
    $(MAKE) install-dev
    @echo "Please run this command to activate homelab-docs:"
    @echo "source $(VENV_DIR)/bin/activate"
    @echo "You can now run \"make\" to get mkdocs running."

install-dev: activate-venv
    @echo "Inside virtual environment..."
    $(VENV_DIR)/bin/pip install --upgrade pip && \
        echo "Installing project requirements..." && \
        $(VENV_DIR)/bin/pip install -r requirements.txt

activate-venv:
    @echo "Activating virtual environment..."
    . $(VENV_DIR)/bin/activate;



serve:
    @echo "Building mkdocs documentation..."
    mkdocs build
    @echo "Serving mkdocs documentation..."
    mkdocs serve

clean:
    # Add clean functionality if needed

test:
    # Add test functionality if needed
