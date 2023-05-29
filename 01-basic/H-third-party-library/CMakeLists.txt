cmake_minimum_required(VERSION 3.5)

# Set the project name
project (third_party_include)


# find a boost install with the libraries filesystem and system
# 使用库文件系统和系统查找 boost install
# 在linux上，默认搜索路径将是/usr/share/cmake/Modules
find_package(Boost 1.46.1 REQUIRED COMPONENTS filesystem system)
# 这是第三方库，而不是自己生成的静态动态库
# REQUIRED - 告诉模块这是必需的，如果找不到会报错
# COMPONENTS - 要查找的库列表。从后面的参数代表的库里找boost

# check if boost was found
# 大多数被包含的包将设置变量XXX_FOUND，该变量可用于检查软件包在系统上是否可用。
if(Boost_FOUND)
    message ("boost found")
else()
    message (FATAL_ERROR "Cannot find Boost")
endif()

# Add an executable
add_executable(third_party_include main.cpp)

# link against the boost libraries
# 模块中的别名可以使引用找到的目标变得更加容易
# 对于Boost，所有目标均使用 Boost:: 标识符，然后使用子系统名称导出
# 与 Boost::filesystem 链接将自动添加 Boost::boost 和 Boost::system 依赖关系
target_link_libraries( third_party_include
    PRIVATE
        Boost::filesystem
)

# Non-alias targets
# Include the boost headers
# xxx_INCLUDE_DIRS - 指向库的包含目录的变量。

#  target_include_directories( third_party_include
#  PRIVATE ${Boost_INCLUDE_DIRS}
# )

# link against the boost libraries
# xxx_LIBRARY - 指向库路径的变量
# target_link_libraries( third_party_include
#  PRIVATE
#  ${Boost_SYSTEM_LIBRARY}
#  ${Boost_FILESYSTEM_LIBRARY}
# )
