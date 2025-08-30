# FamilyThing Project

Welcome to the FamilyThing project, a code multiverse revolving around family dynamics and interactions. Below you will find detailed release notes and version history, reflecting the evolution of the project over time.

## Version History

### Version 0.4 [Counters, HashMap]
- **Features Added:**
  - Introduced `BogeyMan` to monitor whether pets have nicknames.
  - Pets without nicknames will be "taken away" by the BogeyMan.
- **Main.java Updates:**
  - Implementation of HashMap to manage pet nicknames.
- **Class Hierarchy:**
  - Family: Social Constructs.

### Version 0.3 [Arrays]
- **Features Added:**
  - Added Pet functionality with support for nicknames and a default name.
- **Main.java Updates:**
  - Arrays utilized for managing multiple pets.
- **Class Hierarchy:**
  - Maintained from previous versions.

### Version 0.2 [Static Class]
- **Features Added:**
  - Dynamic array growth as children are added.
  - Introduced a space-time construct.
- **Class Hierarchy:**
  - Same as previous versions.

### Version 0.1 [Class Hierarchy]
- **Release Notes:**
  - Initial release focusing on establishing a robust class hierarchy.
  - Supported functions include listing siblings, parents, and genomes.

## Development Notes

- **Family Package Requirements:**
  - **Person Class:** Private variables for gender (male or female).
  - **Father Class and Mother Class:** Private variables include numChildren and children (as arrays).
  - **Genome Attributes:** Father (X, Y), Mother (X1, X2).

- **Main.java Structure:**
  - Create two objects: Pavan and Prathima, and link them together.
  - Add children (Nikhita to Pavan, Tejas to Prathima) and establish sibling linkage.
  - Use Random function for selecting X Genome from mother to children.

- **Expected Outputs:**
  - Descriptions of children, parents, siblings, and genomes based on interactions between the objects.

## Pseudo Code Overview

- **Classes:**
  - `Father`, `Mother`, `Person`, `Child`, `Son`, `Daughter`, `Parent`.
  - Methods include `marry`, `addChild`, `describeParents`, `describeSiblings`, `describeGenome`.

---

## 🚀 Multi-Language Project Structure

This project now supports both **Java** and **Python** implementations, allowing you to explore the same family dynamics concepts in different programming paradigms.

### 📁 Project Structure

```
familything/
├── java-version/              # Java implementation
│   ├── Main.java
│   ├── build.sh               # Java build script
│   ├── family/                # Family classes
│   │   ├── Person.java
│   │   ├── Parent.java
│   │   ├── Father.java
│   │   ├── Mother.java
│   │   ├── Child.java
│   │   ├── Son.java
│   │   ├── Daughter.java
│   │   └── Pet.java
│   └── SocialConstructs/      # Social construct classes
│       ├── Spacetime.java
│       └── BogeyMan.java
├── python-version/            # Python implementation
│   ├── main.py
│   ├── run.py                 # Python run script
│   ├── requirements.txt
│   ├── family/                # Family classes
│   │   ├── __init__.py
│   │   ├── person.py
│   │   ├── parent.py
│   │   ├── father.py
│   │   ├── mother.py
│   │   ├── child.py
│   │   ├── son.py
│   │   ├── daughter.py
│   │   └── pet.py
│   └── social_constructs/     # Social construct classes
│       ├── __init__.py
│       ├── spacetime.py
│       └── bogey_man.py
├── shared/                    # Shared resources
├── build-all.sh              # Master build script
├── build.sh                  # Legacy Java build script
├── Makefile                  # Legacy Makefile
├── setup-mac.sh              # Mac setup script
└── .vscode/                  # VS Code configuration
    ├── tasks.json
    └── launch.json
```

### 🎯 Quick Start

#### Option 1: Master Build Script (Recommended)

The master build script can handle both Java and Python versions:

```bash
# Build and run both versions
./build-all.sh both

# Build and run Java version only
./build-all.sh java

# Build and run Python version only
./build-all.sh python

# Run Java version (must be built first)
./build-all.sh run-java

# Run Python version
./build-all.sh run-python

# Clean all builds
./build-all.sh clean

# Show help
./build-all.sh help
```

#### Option 2: Individual Language Scripts

**Java Version:**
```bash
cd java-version
./build.sh build    # Clean, compile, and run
./build.sh compile  # Only compile
./build.sh run      # Only run
./build.sh clean    # Clean build artifacts
```

**Python Version:**
```bash
cd python-version
python3 main.py     # Run directly
python3 run.py      # Run with setup script
```

#### Option 3: VS Code Integration

1. **Open Command Palette** (`Ctrl+Shift+P` or `Cmd+Shift+P`)
2. **Select "Tasks: Run Task"**
3. **Choose from available tasks:**
   - `Build and Run` - Compile and run Java project
   - `Compile Java Project` - Only compile Java
   - `Run Java Project` - Only run Java
   - `Clean Build` - Clean Java build artifacts

### 🔧 Requirements

#### Java Version
- Java 17 or higher
- Works in GitHub Codespaces (automatically configured)
- Works in VS Code Web
- Works in any Linux/macOS environment with Java installed

#### Python Version
- Python 3.6 or higher
- No external dependencies required
- Works in any environment with Python 3

### 🌟 Features

#### Master Build Script
- **Multi-language Support**: Build and run both Java and Python versions
- **Smart Detection**: Automatically detects available languages
- **Colored Output**: Different colors for Java and Python operations
- **Error Handling**: Comprehensive error checking and reporting
- **Flexible Commands**: Individual or combined language support

#### Java Version
- **Automatic Java Installation**: Build script installs Java if needed
- **Colored Output**: Build script provides colored status messages
- **Error Handling**: Comprehensive error checking and reporting
- **VS Code Integration**: Full integration with VS Code tasks and debugging
- **GitHub Codespaces Ready**: Pre-configured for seamless development

#### Python Version
- **Pure Python**: No external dependencies required
- **Modern Python**: Uses type hints and modern Python features
- **Clean Architecture**: Well-structured packages and modules
- **Cross-platform**: Works on any system with Python 3

### 🔍 Language Comparison

Both implementations provide the same functionality but with language-specific features:

| Feature | Java Version | Python Version |
|---------|-------------|----------------|
| **Type Safety** | Strong static typing | Type hints with mypy |
| **Inheritance** | Class-based inheritance | Class-based inheritance |
| **Collections** | Arrays, HashMap | Lists, Dictionaries |
| **Enums** | Java enums | Python enums |
| **Package Structure** | Java packages | Python packages |
| **Build System** | Custom build script | Direct Python execution |

### 🚀 Building and Running in GitHub Codespaces

This project has been adapted for modern development environments including GitHub Codespaces and VS Code Web, while maintaining all original functionality.

#### Project Structure

```
familything/
├── Main.java                 # Main application entry point
├── family/                   # Family-related classes
│   ├── Person.java
│   ├── Parent.java
│   ├── Father.java
│   ├── Mother.java
│   ├── Child.java
│   ├── Son.java
│   ├── Daughter.java
│   └── Pet.java
├── SocialConstructs/         # Social construct classes
│   ├── Spacetime.java
│   └── BogeyMan.java
├── build.sh                  # Build script for compilation and running
├── Makefile                  # Alternative build system
└── .vscode/                  # VS Code configuration
    ├── tasks.json           # Build tasks
    └── launch.json          # Debug configurations
```

#### Quick Start in GitHub Codespaces

##### Option 1: Using the Build Script (Recommended)

1. **Open in Codespaces**: Click the "Code" button on your GitHub repository and select "Open with Codespaces"

2. **Run the application**:
   ```bash
   ./build.sh
   ```
   This will automatically:
   - Check for Java installation
   - Clean previous builds
   - Compile all Java files
   - Run the application

3. **Other build script commands**:
   ```bash
   ./build.sh compile    # Only compile
   ./build.sh run        # Only run (must be compiled first)
   ./build.sh clean      # Clean build artifacts
   ./build.sh help       # Show help
   ```

##### Option 2: Using Make

1. **Compile and run**:
   ```bash
   make
   ```

2. **Other make commands**:
   ```bash
   make compile      # Only compile
   make run          # Only run
   make clean        # Clean build artifacts
   make help         # Show help
   ```

##### Option 3: Using VS Code Tasks

1. **Open Command Palette** (`Ctrl+Shift+P` or `Cmd+Shift+P`)
2. **Select "Tasks: Run Task"**
3. **Choose one of the available tasks**:
   - `Build and Run` - Compile and run the project
   - `Compile Java Project` - Only compile
   - `Run Java Project` - Only run
   - `Clean Build` - Clean build artifacts

##### Option 4: Using VS Code Debug

1. **Set breakpoints** in your Java code
2. **Press F5** or go to Run and Debug panel
3. **Select "Debug Main"** configuration
4. **Start debugging** - the project will compile and run in debug mode

#### Manual Compilation

If you prefer to compile manually:

```bash
# Create build directory
mkdir -p build

# Compile packages in dependency order
javac -d build SocialConstructs/*.java
javac -cp build -d build family/*.java
javac -cp build -d build Main.java

# Run the application
java -cp build Main
```

#### Requirements

- Java 17 or higher
- Works in GitHub Codespaces (automatically configured)
- Works in VS Code Web
- Works in any Linux environment with Java installed

#### Features

- **Automatic Java Installation**: The build script automatically installs Java if not present
- **Colored Output**: Build script provides colored status messages
- **Error Handling**: Comprehensive error checking and reporting
- **VS Code Integration**: Full integration with VS Code tasks and debugging
- **GitHub Codespaces Ready**: Pre-configured for seamless development in Codespaces

#### Troubleshooting

##### Java Not Found
If you get a "Java not found" error, the build script will automatically install OpenJDK 17. If manual installation is needed:

```bash
sudo apt-get update
sudo apt-get install -y openjdk-17-jdk
```

##### Permission Denied
If you get a permission error when running the build script:

```bash
chmod +x build.sh
```

##### Build Errors
If you encounter compilation errors:

1. Check that all Java files are present
2. Ensure proper package declarations
3. Run `./build.sh clean` to clean previous builds
4. Try compiling again

#### Development

This project was originally developed in BlueJ and has been adapted for modern development environments. The build scripts handle the compilation order and classpath management that BlueJ would normally handle automatically.

---

This documentation is designed to provide a comprehensive overview of the FamilyThing project, guiding both current users and developers through the functionalities and internal structure of the application.
