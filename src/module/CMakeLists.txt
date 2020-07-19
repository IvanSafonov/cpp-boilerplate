add_library(Module SHARED feature.cpp)
target_include_directories(Module PUBLIC ..)
add_coverage(Module)

add_subdirectory(mocks)
add_subdirectory(tests)
