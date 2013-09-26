# Find Valgrind.
#
# This module defines:
#  VALGRIND_INCLUDE_DIR, where to find valgrind/memcheck.h, etc.
#  VALGRIND_LIBRARIES, Valgrind's libraries.
#  VALGRIND_PROGRAM, the valgrind executable.
#  VALGRIND_FOUND, If false, do not try to use Valgrind.
#
# If you have valgrind installed in a non-standard place, you can define
# VALGRIND_PREFIX to tell cmake where it is.

# Copied from http://code.google.com/p/scarcity/source/browse/cmake_modules/FindValgrind.cmake

#include(FindPackageHandleStandardArgs)

message(STATUS "Valgrind Prefix: ${VALGRIND_PREFIX}")

find_package(PkgConfig)

pkg_check_modules(PC_VALGRIND QUIET valgrind)
set(VALGRIND_DEFINITIONS ${PC_VALGRIND_CFLAGS_OTHER})

find_path(VALGRIND_INCLUDE_DIR libvex.h
    HINTS ${PC_VALGRIND_INCLUDEDIR} ${PC_VALGRIND_INCLUDE_DIRS}
    PATH_SUFFIXES valgrind )

find_library(VALGRIND_LIBRARIES NAMES vex-amd64-linux vex-x86-linux
    HINTS ${PC_VALGRIND_LIBDIR} ${PC_VALGRIND_LIBRARY_DIRS}
    PATH_SUFFIXES valgrind )

find_program(VALGRIND_PROGRAM NAMES valgrind PATH /usr/bin /usr/local/bin ${VALGRIND_PREFIX}/bin)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(VALGRIND DEFAULT_MSG
    VALGRIND_LIBRARIES
    VALGRIND_INCLUDE_DIR
    VALGRIND_PROGRAM)

mark_as_advanced(VALGRIND_INCLUDE_DIR VALGRIND_LIBRARIES VALGRIND_PROGRAM)

