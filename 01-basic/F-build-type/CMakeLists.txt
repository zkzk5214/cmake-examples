# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set a default build type if none was specified
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  # 在命令行中输出message里的信息
  message("Setting build type to 'RelWithDebInfo' as none was specified.")
  # 不管 CACHE 里有没有设置过 CMAKE_BUILD_TYPE 这个变量，都强制赋值这个值为 RelWithDebInfo
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
    "MinSizeRel" "RelWithDebInfo")
endif()

# Set the project name
project (build_type)

# Add an executable
add_executable(cmake_examples_build_type main.cpp)

# Release —— 不可以打断点调试，程序开发完成后发行使用的版本，占的体积小。 
#   它对代码做了优化，因此速度会非常快. -O3 -DNDEBUG
# Debug ——调试的版本，体积大. -g
# MinSizeRel—— 最小体积版本. -Os -DNDEBUG
# RelWithDebInfo—— 既优化又能调试. -O2 -g -DNDEBUG