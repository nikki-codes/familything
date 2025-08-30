#!/bin/bash

# Master Build Script for FamilyThing Project
# Supports Java, Python, and TypeScript versions

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
ORANGE='\033[0;33m'
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

print_java() {
    echo -e "${PURPLE}[JAVA]${NC} $1"
}

print_python() {
    echo -e "${CYAN}[PYTHON]${NC} $1"
}

print_typescript() {
    echo -e "${ORANGE}[TYPESCRIPT]${NC} $1"
}

# Check if Java is available
check_java() {
    if command -v javac &> /dev/null; then
        JAVA_AVAILABLE=true
        print_java "Java compiler found: $(javac -version 2>&1)"
    else
        JAVA_AVAILABLE=false
        print_warning "Java compiler not found"
    fi
}

# Check if Python is available
check_python() {
    if command -v python3 &> /dev/null; then
        PYTHON_AVAILABLE=true
        print_python "Python found: $(python3 --version 2>&1)"
    else
        PYTHON_AVAILABLE=false
        print_warning "Python3 not found"
    fi
}

# Check if Node.js is available
check_node() {
    if command -v node &> /dev/null; then
        NODE_AVAILABLE=true
        print_typescript "Node.js found: $(node --version 2>&1)"
    else
        NODE_AVAILABLE=false
        print_warning "Node.js not found"
    fi
}

# Check if npm is available
check_npm() {
    if command -v npm &> /dev/null; then
        NPM_AVAILABLE=true
        print_typescript "npm found: $(npm --version 2>&1)"
    else
        NPM_AVAILABLE=false
        print_warning "npm not found"
    fi
}

# Build Java version
build_java() {
    if [ "$JAVA_AVAILABLE" = true ]; then
        print_java "Building Java version..."
        cd java-version
        if [ -f "build.sh" ]; then
            chmod +x build.sh
            ./build.sh build
        else
            print_error "Java build script not found"
            return 1
        fi
        cd ..
        print_success "Java version built successfully"
    else
        print_warning "Skipping Java build - Java not available"
    fi
}

# Build Python version
build_python() {
    if [ "$PYTHON_AVAILABLE" = true ]; then
        print_python "Building Python version..."
        cd python-version
        if [ -f "run.py" ]; then
            chmod +x run.py
            python3 run.py
        else
            print_error "Python run script not found"
            return 1
        fi
        cd ..
        print_success "Python version built and run successfully"
    else
        print_warning "Skipping Python build - Python not available"
    fi
}

# Build TypeScript version
build_typescript() {
    if [ "$NODE_AVAILABLE" = true ] && [ "$NPM_AVAILABLE" = true ]; then
        print_typescript "Building TypeScript version..."
        cd typescript-version
        if [ -f "build.sh" ]; then
            chmod +x build.sh
            ./build.sh build
        else
            print_error "TypeScript build script not found"
            return 1
        fi
        cd ..
        print_success "TypeScript version built and run successfully"
    else
        print_warning "Skipping TypeScript build - Node.js/npm not available"
    fi
}

# Run Java version
run_java() {
    if [ "$JAVA_AVAILABLE" = true ]; then
        print_java "Running Java version..."
        cd java-version
        if [ -f "build.sh" ]; then
            ./build.sh run
        else
            print_error "Java build script not found"
            return 1
        fi
        cd ..
    else
        print_warning "Cannot run Java version - Java not available"
    fi
}

# Run Python version
run_python() {
    if [ "$PYTHON_AVAILABLE" = true ]; then
        print_python "Running Python version..."
        cd python-version
        python3 main.py
        cd ..
    else
        print_warning "Cannot run Python version - Python not available"
    fi
}

# Run TypeScript version
run_typescript() {
    if [ "$NODE_AVAILABLE" = true ] && [ "$NPM_AVAILABLE" = true ]; then
        print_typescript "Running TypeScript version..."
        cd typescript-version
        if [ -f "dist/main.js" ]; then
            node dist/main.js
        else
            npm run dev
        fi
        cd ..
    else
        print_warning "Cannot run TypeScript version - Node.js/npm not available"
    fi
}

# Clean all builds
clean_all() {
    print_status "Cleaning all builds..."
    
    # Clean Java
    if [ -d "java-version" ]; then
        cd java-version
        if [ -f "build.sh" ]; then
            ./build.sh clean
        fi
        cd ..
    fi
    
    # Clean Python (remove any cache files)
    if [ -d "python-version" ]; then
        cd python-version
        find . -name "*.pyc" -delete
        find . -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true
        cd ..
    fi
    
    # Clean TypeScript
    if [ -d "typescript-version" ]; then
        cd typescript-version
        if [ -f "build.sh" ]; then
            ./build.sh clean
        fi
        cd ..
    fi
    
    print_success "All builds cleaned"
}

# Show help
show_help() {
    echo "FamilyThing Master Build Script"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  all            - Build and run all versions (Java + Python + TypeScript)"
    echo "  java           - Build and run Java version"
    echo "  python         - Build and run Python version"
    echo "  typescript     - Build and run TypeScript version"
    echo "  both           - Build and run Java and Python versions"
    echo "  run-java       - Run Java version (must be built first)"
    echo "  run-python     - Run Python version"
    echo "  run-typescript - Run TypeScript version (must be built first)"
    echo "  clean          - Clean all builds"
    echo "  help           - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 all         # Build and run all versions"
    echo "  $0 java        # Build and run Java version"
    echo "  $0 python      # Build and run Python version"
    echo "  $0 typescript  # Build and run TypeScript version"
    echo "  $0 both        # Build and run Java and Python versions"
    echo "  $0 clean       # Clean all builds"
}

# Main script logic
main() {
    print_status "Starting FamilyThing Master Build Script..."
    echo ""
    
    # Check available languages
    check_java
    check_python
    check_node
    check_npm
    echo ""
    
    # Parse command line arguments
    case "${1:-help}" in
        "java")
            build_java
            ;;
        "python")
            build_python
            ;;
        "typescript")
            build_typescript
            ;;
        "both")
            print_status "Building and running Java and Python versions..."
            echo ""
            build_java
            echo ""
            build_python
            ;;
        "all")
            print_status "Building and running all versions..."
            echo ""
            build_java
            echo ""
            build_python
            echo ""
            build_typescript
            ;;
        "run-java")
            run_java
            ;;
        "run-python")
            run_python
            ;;
        "run-typescript")
            run_typescript
            ;;
        "clean")
            clean_all
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
