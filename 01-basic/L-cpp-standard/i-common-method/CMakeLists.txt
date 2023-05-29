# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 2.8)

# Set the project name
project (hello_cpp11)

# try conditional compilation
# CMake has support for attempting to compile a program with any flags 
#   you pass into the function CMAKE_CXX_COMPILER_FLAG. 
#   The result is then stored in a variable that you pass in.
# The line include(CheckCXXCompilerFlag) tells CMake to include this function 
#   to make it available for use.
include(CheckCXXCompilerFlag)
# This example will attempt to compile a program with the flag `-std=c11` 
#   and store the result in the variable `COMPILER_SUPPORTS_CXX11`.
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)

# check results and add flag
# Once you have determined if the compile supports a flag, 
#   you can then use the standard cmake methods to add this flag to a target. 
#   In this example we use the CMAKE_CXX_FLAGS to propegate the flag to all targets .
if(COMPILER_SUPPORTS_CXX11)#
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)#
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

# Add an executable
add_executable(hello_cpp11 main.cpp)
