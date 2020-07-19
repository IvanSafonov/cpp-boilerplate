OPTION(TESTS "Enable tests" ON)
set(TESTS_BUNARY_PREFIX "test_")
set(TESTS_RUN_TIMEOUT "10")
set(TESTS_PARALLEL "8")

if(TESTS)
  message(STATUS "Tests are enabled")
  set(CMAKE_CTEST_ARGUMENTS "-j;${TESTS_PARALLEL};--output-on-failure;--timeout;${TESTS_PARALLEL}")
  find_package(GTest REQUIRED CONFIG)
  include(GoogleTest)
  enable_testing()
endif()

function(add_unit_test TEST_NAME)
  if(NOT TESTS)
    return()
  endif()

  set(multiValueArgs LIBS)
  cmake_parse_arguments(TEST "" "" "${multiValueArgs}" ${ARGN})
  set(TEST_NAME "${TESTS_BUNARY_PREFIX}${TEST_NAME}")

  add_executable(${TEST_NAME} ${TEST_UNPARSED_ARGUMENTS})
  target_link_libraries(${TEST_NAME} GTest::gtest_main ${TEST_LIBS})
  gtest_discover_tests(${TEST_NAME})
endfunction()

function(add_mocks TARGET)
  if(NOT TESTS)
    return()
  endif()

  set(multiValueArgs LIBS)
  cmake_parse_arguments(MOCK "" "" "${multiValueArgs}" ${ARGN})

  add_library(${TARGET} SHARED ${MOCK_UNPARSED_ARGUMENTS})
  target_link_libraries(${TARGET} GTest::gmock ${MOCK_LIBS})
endfunction()
