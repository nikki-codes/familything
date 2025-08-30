#!/bin/bash

# Setup script for Mac to configure Java path
# This script sets up the Java environment for the FamilyThing project

echo "Setting up Java environment for FamilyThing project..."

# Check if Java is installed via Homebrew
if [ -d "/opt/homebrew/opt/openjdk" ]; then
    echo "Found OpenJDK installation in Homebrew"
    
    # Add Java to PATH for current session
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    
    # Check Java version
    echo "Java version:"
    java -version
    
    echo "Java compiler version:"
    javac -version
    
    echo ""
    echo "✅ Java environment is ready!"
    echo ""
    echo "To use the build scripts, run:"
    echo "  export PATH=\"/opt/homebrew/opt/openjdk/bin:\$PATH\" && ./build.sh"
    echo ""
    echo "Or add this to your ~/.zshrc file to make it permanent:"
    echo "  export PATH=\"/opt/homebrew/opt/openjdk/bin:\$PATH\""
    echo ""
    
    # Test the build script
    echo "Testing build script..."
    ./build.sh help
    
else
    echo "❌ OpenJDK not found in Homebrew"
    echo ""
    echo "To install Java, run:"
    echo "  brew install openjdk"
    echo ""
    echo "Then run this setup script again."
fi
