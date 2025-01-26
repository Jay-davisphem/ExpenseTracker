file(GLOB_RECURSE SRC_FILES *.cpp)

# Add library
add_library(ExpenseTrackerLib ${SRC_FILES})

# Link include directory for the library
target_include_directories(ExpenseTrackerLib PUBLIC ${PROJECT_SOURCE_DIR}/include)

# Add executable
add_executable(ExpenseTracker main.cpp)

# Link the library to the executable
target_link_libraries(ExpenseTracker PRIVATE ExpenseTrackerLib)
