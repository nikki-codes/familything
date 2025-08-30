#!/bin/bash

# Java Family Project Build and Run Script
# For GitHub Codespaces and VS Code Web

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Java is installed
check_java() {
    if ! command -v javac &> /dev/null; then
        print_error "Java compiler (javac) not found!"
        print_status "Installing OpenJDK..."
        sudo apt-get update
        sudo apt-get install -y openjdk-17-jdk
        print_success "Java installed successfully"
    else
        print_success "Java compiler found: $(javac -version 2>&1)"
    fi
}

# Clean previous builds
clean() {
    print_status "Cleaning previous builds..."
    rm -rf build/
    rm -f *.class
    find . -name "*.class" -delete
    print_success "Clean completed"
}

# Compile the project
compile() {
    print_status "Compiling Java project..."
    
    # Create build directory
    mkdir -p build
    
    # Compile SocialConstructs package first (dependency)
    print_status "Compiling SocialConstructs package..."
    javac -d build SocialConstructs/*.java
    
    # Compile family package
    print_status "Compiling family package..."
    javac -cp build -d build family/*.java
    
    # Compile main class
    print_status "Compiling Main class..."
    javac -cp build -d build Main.java
    
    print_success "Compilation completed successfully!"
}

# Run the project
run() {
    print_status "Running the application..."
    java -cp build Main
}

# Build and run in one command
build_and_run() {
    clean
    compile
    run
}

# Show help
show_help() {
    echo "Java Family Project Build Script"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  clean          - Remove all compiled files"
    echo "  compile        - Compile the project"
    echo "  run            - Run the compiled application"
    echo "  build          - Clean, compile, and run (default)"
    echo "  help           - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0              # Clean, compile, and run"
    echo "  $0 compile      # Only compile"
    echo "  $0 run          # Only run (must be compiled first)"
}

# Main script logic
main() {
    print_status "Starting Java Family Project build process..."
    
    # Check Java installation
    check_java
    
    # Parse command line arguments
    case "${1:-build}" in
        "clean")
            clean
            ;;
        "compile")
            compile
            ;;
        "run")
            run
            ;;
        "build")
            build_and_run
            ;;
        "help"|"-h"|"--help")
            show_help
            ;;
        *)
            print_error "Unknown command: $1"
            show_help
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"
