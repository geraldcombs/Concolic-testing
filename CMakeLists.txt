# Note: For local compilation only. Valgrind itself uses autotools.
project(Concolic-tester C)

cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)

set (concolic_tester_FILES
    main.c
    shadow_memory.c
    taint_analysis.c
    )

add_executable(concolic-tester ${concolic_tester_FILES})

find_package (Valgrind REQUIRED)
include_directories(${VALGRIND_INCLUDE_DIR})
target_link_libraries(concolic-tester ${VALGRIND_LIBRARIES})
