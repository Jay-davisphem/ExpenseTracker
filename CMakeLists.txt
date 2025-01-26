cmake_minimum_required(VERSION 3.10..3.30)

# assign all the cpp file in lib folder to SRCS go recursively totally into all subdir
file(GLOB_RECURSE SRCS "src/*.cpp")

project(ExpenseTracker)

if (MSVC)
    add_compile_options(/std::c++latest)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
    set(BUILD_SHARED_LIBS TRUE)
endif()

# Include Conan-generated files
include(${CMAKE_BINARY_DIR}/Debug/generators/conan_toolchain.cmake)


# Add the directory containing FemiMacros.cmake to the module path
list(APPEND CMAKE_MODULE_PATH "/home/davisphem/Codes/internal_codes/SharedCMake")

# Include your custom macros
include(FemiMacros)

# Set up output directories
FEMI_SETUP_OUTPUT_DIRECTORIES()

# Add a shared library
FEMI_ADD_LIBRARIES(${SRCS})

# Find the fmt package

find_package(fmt REQUIRED)
# Add an executable and link it to the library
FEMI_ADD_EXECUTABLE(${PROJECT_NAME} src/main.cpp expense)


# Link the fmt library to your target
target_link_libraries(${PROJECT_NAME} fmt::fmt)