cmake_minimum_required(VERSION 3.18)

project(app)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "-Wall -Wextra -Werror -Wno-unused-parameter")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(CMAKE_LINK_DEPENDS_NO_SHARED ON)

include(cmake/clang-tidy.cmake)
include(cmake/tests.cmake)
include(cmake/coverage.cmake)

add_subdirectory(src)
