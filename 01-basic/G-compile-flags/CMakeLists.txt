cmake_minimum_required(VERSION 3.5)

# 可执行文件的生成离不开编译和链接，那么如何编译，比如编译时使用C++的哪一个标准？
#   这些编译设置都在CMAKE_CXX_FLAGS变量中。
# 强制设置默认C++编译标志变量为缓存变量，该缓存变量被定义在文件中，相当于全局变量，
#   源文件中也可以使用这个变量
# Set a default C++ compile flag
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DEX2" CACHE STRING "Set C++ Compiler Flags" FORCE)

# Set the project name
project (compile_flags)

# Add an executable
add_executable(cmake_examples_compile_flags main.cpp)

# 为可执行文件添加私有编译定义
# 在CMake 中设置 C++ 标志的推荐方法是专门针对某个目标（target）设置标志，
#   可以通过target_compile_definitions（）函数设置某个目标的编译标志。
target_compile_definitions(cmake_examples_compile_flags 
    PRIVATE EX3
)
