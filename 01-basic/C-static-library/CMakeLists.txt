cmake_minimum_required(VERSION 3.5)

project(hello_library)

############################################################
# Create a library
############################################################

# Module File (.cpp )
# Generate the static library from the library sources
# 库的源文件 Hello.cpp 生成 hello_library 的静态库(libhello_library.a)
add_library(${PROJECT_NAME} STATIC 
    src/Hello.cpp
)

# Header File (.h) 
# 为一个目标（库/library/可执行文件）添加头文件路径
# PUBLIC: it is included in this library and also any 
#   targets that link this library.
target_include_directories(${PROJECT_NAME}
    PUBLIC 
        ${PROJECT_SOURCE_DIR}/include
)


############################################################
# Create an executable
############################################################
# Main File (.cpp)
# Add an executable with the above sources
# 指定源文件生成可执行文件
add_executable(hello_binary 
    src/main.cpp
)

# link the new hello_library target with the hello_binary target
# It will also propagate any include directories with PUBLIC or INTERFACE scope 
#   from the linked library target.
# 链接可执行文件和静态库
target_link_libraries( hello_binary
    PRIVATE 
        ${PROJECT_NAME}
)
# /usr/bin/c++ CMakeFiles/hello_binary.dir/src/main.cpp.o -o hello_binary 
#       -rdynamic libhello_library.a

# PRIVATE - 目录被添加到目标（库）的包含路径中。
# INTERFACE - 目录没有被添加到目标（库）的包含路径中，
#   而是链接了这个库的其他目标（库或者可执行程序）包含路径中
# PUBLIC - 目录既被添加到目标（库）的包含路径中，
#   同时添加到了链接了这个库的其他目标（库或者可执行程序）的包含路径中