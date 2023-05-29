cmake_minimum_required(VERSION 3.5)

# Set the project name
project (cf_example)

# set a project version
set (cf_example_VERSION_MAJOR 0)
set (cf_example_VERSION_MINOR 2)
set (cf_example_VERSION_PATCH 1)
set (cf_example_VERSION "${cf_example_VERSION_MAJOR}.${cf_example_VERSION_MINOR}.${cf_example_VERSION_PATCH}")

# To do variable substitution in a file you can use the `configure_file()` function
#   in CMake. This core arguments for this function are source file and destination file.

# Call configure files on ver.h.in to set the version.
# Uses the standard ${VARIABLE} syntax in the file
# The first example above, allows the variable to be defined like a CMake variables using
#   the `${}` syntax or an `@@` in the ver.h.in file. After generation a new file ver.h 
#   will be available in the `PROJECT_BINARY_DIR`.
configure_file(ver.h.in ${PROJECT_BINARY_DIR}/ver.h)

# configure the path.h.in file.
# This file can only use the @VARIABLE@ syntax in the file
# The second example, only allows variables to be defined using the `@@` syntax in the path.h.in file.
# After generation a new file path.h will be available in the `PROJECT_BINARY_DIR`.
configure_file(path.h.in ${PROJECT_BINARY_DIR}/path.h @ONLY)

# Add an executable
add_executable(cf_example
    main.cpp
)

# include the directory with the new files
target_include_directories( cf_example
    PUBLIC
        ${CMAKE_BINARY_DIR}
)
