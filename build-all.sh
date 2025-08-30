#!/bin/bash

# Master Build Script for FamilyThing Project
# Supports both Java and Python versions

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
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

print_java() {
    echo -e "${PURPLE}[JAVA]${NC} $1"
}

print_python() {
    echo -e "${CYAN}[PYTHON]${NC} $1"
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
    
    print_success "All builds cleaned"
}

# Show help
show_help() {
    echo "FamilyThing Master Build Script"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  java           - Build and run Java version"
    echo "  python         - Build and run Python version"
    echo "  both           - Build and run both versions"
    echo "  run-java       - Run Java version (must be built first)"
    echo "  run-python     - Run Python version"
    echo "  clean          - Clean all builds"
    echo "  help           - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 java        # Build and run Java version"
    echo "  $0 python      # Build and run Python version"
    echo "  $0 both        # Build and run both versions"
    echo "  $0 clean       # Clean all builds"
}

# Main script logic
main() {
    print_status "Starting FamilyThing Master Build Script..."
    echo ""
    
    # Check available languages
    check_java
    check_python
    echo ""
    
    # Parse command line arguments
    case "${1:-help}" in
        "java")
            build_java
            ;;
        "python")
            build_python
            ;;
        "both")
            print_status "Building and running both versions..."
            echo ""
            build_java
            echo ""
            build_python
            ;;
        "run-java")
            run_java
            ;;
        "run-python")
            run_python
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
