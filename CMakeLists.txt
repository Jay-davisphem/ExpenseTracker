cmake_minimum_required(VERSION 3.10..3.30)
project(ExpenseTracker VERSION 1.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS OFF)

# Add include directory
include_directories(${PROJECT_SOURCE_DIR}/include)

# Add source directory
add_subdirectory(src)

# Add tests directory
add_subdirectory(tests)
