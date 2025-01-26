#!/bin/bash

# Set default build type to "Debug" if not provided
TYPE=${1:-Debug}

# Determine the operating system
OS=$(uname -s)
if [[ "$OS" == "Linux" ]]; then
    PLATFORM="Linux64"
    EXECUTABLE_EXT=""
elif [[ "$OS" == "Darwin" ]]; then
    PLATFORM="MacOS"
    EXECUTABLE_EXT=""
elif [[ "$OS" == "MINGW"* || "$OS" == "MSYS"* || "$OS" == "CYGWIN"* ]]; then
    PLATFORM="Windows"
    EXECUTABLE_EXT=".exe"
else
    echo "Unsupported operating system: $OS"
    exit 1
fi

# Install dependencies with Conan
conan install . --build=missing -s build_type=$TYPE

# Configure CMake with the specified build type
cmake -S . -B build -DCMAKE_BUILD_TYPE=$TYPE

# Build the project
cmake --build build --config $TYPE --target ExpenseTracker -j 6

# Run the executable
EXECUTABLE_PATH="build/$PLATFORM/$TYPE/ExpenseTracker$EXECUTABLE_EXT"
if [ -f "$EXECUTABLE_PATH" ]; then
    echo "Running $EXECUTABLE_PATH"
    if [[ "$OS" == "MINGW"* || "$OS" == "MSYS"* || "$OS" == "CYGWIN"* ]]; then
        # Windows requires the executable to be run with the correct path format
        EXECUTABLE_PATH=$(cygpath -w "$EXECUTABLE_PATH")
    fi
    "$EXECUTABLE_PATH"
else
    echo "Error: Executable not found at $EXECUTABLE_PATH"
    exit 1
fi