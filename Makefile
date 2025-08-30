# Makefile for Java Family Project
# For GitHub Codespaces and VS Code Web

# Variables
JAVAC = javac
JAVA = java
BUILD_DIR = build
SRC_DIRS = . family SocialConstructs
MAIN_CLASS = Main

# Find all Java source files
SOURCES = $(shell find $(SRC_DIRS) -name "*.java")
CLASSES = $(SOURCES:.java=.class)

# Default target
.PHONY: all
all: compile run

# Compile all Java files
.PHONY: compile
compile: $(BUILD_DIR)
	@echo "Compiling Java project..."
	$(JAVAC) -d $(BUILD_DIR) $(SOURCES)
	@echo "Compilation completed successfully!"

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Run the application
.PHONY: run
run: compile
	@echo "Running the application..."
	$(JAVA) -cp $(BUILD_DIR) $(MAIN_CLASS)

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR)
	find . -name "*.class" -delete
	@echo "Clean completed"

# Install Java if not present (for Ubuntu/Debian systems)
.PHONY: install-java
install-java:
	@echo "Checking Java installation..."
	@if ! command -v javac > /dev/null; then \
		echo "Installing OpenJDK..."; \
		sudo apt-get update; \
		sudo apt-get install -y openjdk-17-jdk; \
		echo "Java installed successfully"; \
	else \
		echo "Java is already installed: $$(javac -version 2>&1)"; \
	fi

# Setup project (install Java and compile)
.PHONY: setup
setup: install-java compile

# Show help
.PHONY: help
help:
	@echo "Java Family Project Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  all          - Compile and run the project (default)"
	@echo "  compile      - Compile all Java source files"
	@echo "  run          - Run the compiled application"
	@echo "  clean        - Remove all build artifacts"
	@echo "  install-java - Install Java if not present"
	@echo "  setup        - Install Java and compile the project"
	@echo "  help         - Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make         # Compile and run"
	@echo "  make compile # Only compile"
	@echo "  make run     # Only run (must be compiled first)"
	@echo "  make clean   # Clean build artifacts"
