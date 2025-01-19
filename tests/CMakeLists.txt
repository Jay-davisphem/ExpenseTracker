enable_testing()

# Add test executable
add_executable(ExpenseTracker_tests test_main.cpp)
target_include_directories(ExpenseTracker_tests PRIVATE ${PROJECT_SOURCE_DIR}/include)
add_test(NAME RunTests COMMAND ExpenseTracker_tests)
