# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project (hello_cmake)
# project(hello_cmake) 函数执行时会生成一个变量: PROJECT_NAME，
#   ${PROJECT_NAME} 表示 PROJECT_NAME 变量的值: hello_cmake,
#   把 ${PROJECT_NAME} 用在 add_executable() 里可以生成可执行文件名字: hello_cmake

# Add an executable
# add_executable(hello_cmake main.cpp)
add_executable(${PROJECT_NAME} main.cpp)
# add_executable（）：参数1：可执行文件名，参数2：要编译的源文件列表。