#!/usr/bin/env python3
"""
Python Family Project Run Script
For the Python version of FamilyThing
"""

import sys
import os
import subprocess
from pathlib import Path


def check_python():
    """Check if Python 3 is available"""
    if sys.version_info < (3, 6):
        print("❌ Python 3.6 or higher is required")
        sys.exit(1)
    print(f"✅ Python {sys.version_info.major}.{sys.version_info.minor} found")


def run_python():
    """Run the Python version of the application"""
    print("🚀 Running Python FamilyThing...")
    try:
        # Run the main module
        subprocess.run([sys.executable, "main.py"], check=True)
    except subprocess.CalledProcessError as e:
        print(f"❌ Error running Python application: {e}")
        sys.exit(1)


def install_requirements():
    """Install Python requirements if needed"""
    requirements_file = Path("requirements.txt")
    if requirements_file.exists():
        # Check if requirements file has any actual dependencies
        with open(requirements_file, 'r') as f:
            content = f.read().strip()
            if content and not content.startswith('#'):
                print("📦 Installing Python requirements...")
                try:
                    # Try to install with --user flag to avoid system package conflicts
                    subprocess.run([sys.executable, "-m", "pip", "install", "--user", "-r", "requirements.txt"], check=True)
                    print("✅ Requirements installed successfully")
                except subprocess.CalledProcessError as e:
                    print(f"⚠️  Could not install requirements: {e}")
                    print("📝 Continuing without external dependencies...")
            else:
                print("📝 No external dependencies required")
    else:
        print("📝 No requirements.txt found - continuing without external dependencies")


def main():
    """Main function"""
    print("🐍 Python FamilyThing Project")
    print("=" * 40)
    
    # Check Python version
    check_python()
    
    # Install requirements if needed
    install_requirements()
    
    # Run the application
    run_python()


if __name__ == "__main__":
    main()
