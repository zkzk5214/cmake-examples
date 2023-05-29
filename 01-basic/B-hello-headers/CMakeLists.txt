# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project (hello_headers)

# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    src/Hello.cpp
    src/main.cpp
)

# Add an executable with the above sources
add_executable(${PROJECT_NAME} ${SOURCES})
# 等价于 add_executable(hello_headers src/Hello.cpp src/main.cpp)

# Set the directories that should be included in the build command for this target
# when running g++ these will be included as -I/directory/path/
# PRIVATE(标识符指定包含的范围): the directory is added to this target’s include directories
target_include_directories(${PROJECT_NAME}
    PRIVATE 
        ${PROJECT_SOURCE_DIR}/include
)

# CMAKE_SOURCE_DIR - 根源代码目录，工程顶层目录
# CMAKE_CURRENT_SOURCE_DIR - 当前处理的 CMakeLists.txt 所在的路径
# PROJECT_SOURCE_DIR - 工程顶层目录
# CMAKE_BINARY_DIR - 运行cmake的目录。外部构建时就是build目录
# CMAKE_CURRENT_BINARY_DIR - The build directory you are currently in.
# PROJECT_Binary_DIR - 编译目录
# PRIVATE - 指定了库的范围