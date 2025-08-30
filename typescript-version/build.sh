#!/bin/bash

# TypeScript Family Project Build Script
# For the TypeScript version of FamilyThing

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
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

print_typescript() {
    echo -e "${CYAN}[TYPESCRIPT]${NC} $1"
}

# Check if Node.js is installed
check_node() {
    if ! command -v node &> /dev/null; then
        print_error "Node.js not found!"
        print_status "Please install Node.js from https://nodejs.org/"
        exit 1
    else
        print_success "Node.js found: $(node --version)"
    fi
}

# Check if npm is installed
check_npm() {
    if ! command -v npm &> /dev/null; then
        print_error "npm not found!"
        print_status "Please install npm (comes with Node.js)"
        exit 1
    else
        print_success "npm found: $(npm --version)"
    fi
}

# Install dependencies
install_deps() {
    print_status "Installing TypeScript dependencies..."
    if [ ! -d "node_modules" ]; then
        npm install
        print_success "Dependencies installed successfully"
    else
        print_status "Dependencies already installed"
    fi
}

# Clean previous builds
clean() {
    print_status "Cleaning previous builds..."
    rm -rf dist/
    rm -rf node_modules/
    print_success "Clean completed"
}

# Compile the project
compile() {
    print_status "Compiling TypeScript project..."
    
    # Install dependencies if needed
    install_deps
    
    # Compile TypeScript
    print_typescript "Compiling TypeScript files..."
    npm run build
    
    print_success "Compilation completed successfully!"
}

# Run the project
run() {
    print_status "Running the application..."
    
    # Check if compiled version exists
    if [ -f "dist/main.js" ]; then
        node dist/main.js
    else
        print_warning "Compiled version not found, running with ts-node..."
        npm run dev
    fi
}

# Build and run in one command
build_and_run() {
    compile
    run
}

# Run tests
test() {
    print_status "Running tests..."
    npm test
}

# Lint the code
lint() {
    print_status "Linting TypeScript code..."
    npm run lint
}

# Format the code
format() {
    print_status "Formatting TypeScript code..."
    npm run format
}

# Show help
show_help() {
    echo "TypeScript Family Project Build Script"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  clean          - Remove all build artifacts and node_modules"
    echo "  compile        - Compile the TypeScript project"
    echo "  run            - Run the compiled application"
    echo "  build          - Compile and run (default)"
    echo "  test           - Run tests"
    echo "  lint           - Lint the TypeScript code"
    echo "  format         - Format the TypeScript code"
    echo "  install        - Install dependencies"
    echo "  help           - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0              # Compile and run"
    echo "  $0 compile      # Only compile"
    echo "  $0 run          # Only run"
    echo "  $0 test         # Run tests"
    echo "  $0 lint         # Lint code"
}

# Main script logic
main() {
    print_status "Starting TypeScript Family Project build process..."
    
    # Check Node.js and npm installation
    check_node
    check_npm
    
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
        "test")
            test
            ;;
        "lint")
            lint
            ;;
        "format")
            format
            ;;
        "install")
            install_deps
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
