OPTION(CLANG_TIDY "Enable clang-tidy" OFF)

if(CLANG_TIDY)
  message(STATUS "Clang-tidy is enabled")
  set(CMAKE_CXX_CLANG_TIDY clang-tidy -p ${PROJECT_BINARY_DIR})
endif()
