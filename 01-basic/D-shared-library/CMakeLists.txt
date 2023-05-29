cmake_minimum_required(VERSION 3.5)

project(hello_library)

############################################################
# Create a library
############################################################

# Generate the shared library from the library sources
# (libhello_library.so)
add_library(hello_library SHARED 
    src/Hello.cpp
)

# As the name suggests an alias target is an alternative name for a target 
#   that can be used instead of the real target name in read-only contexts.
# 给动态库 hello_library 起一个别的名字 hello::library
# 别名目标是在只读上下文中可以代替真实目标名称的替代名称
add_library(hello::library ALIAS hello_library)
# 为这个库目标，添加头文件路径，PUBLIC 表示包含了这个库的目标也会包含这个路径
target_include_directories(hello_library
    PUBLIC 
        ${PROJECT_SOURCE_DIR}/include
)

############################################################
# Create an executable
############################################################

# Add an executable with the above sources
add_executable(hello_binary
    src/main.cpp
)

# link the new hello_library target with the hello_binary target
# Reference the target using the alias name when linking it 
#   against other targets.
target_link_libraries( hello_binary
    PRIVATE 
        hello::library
)
# This tells CMake to link the hello_library against the hello_binary executable 
#   using the alias target name.