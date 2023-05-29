cmake_minimum_required(VERSION 3.5)

project(cmake_examples_install)

# Sets the default install location to under your build directory.
if( CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT )
  message(STATUS "Setting default CMAKE_INSTALL_PREFIX path to ${PROJECT_SOURCE_DIR}/install")
  set(CMAKE_INSTALL_PREFIX "${PROJECT_SOURCE_DIR}/install" CACHE STRING "The path to use for make install" FORCE)
endif()

############################################################
# Create a library
############################################################

#Generate the shared library from the library sources
add_library(cmake_examples_inst SHARED
    src/Hello.cpp
)

target_include_directories(cmake_examples_inst
    PUBLIC 
        ${PROJECT_SOURCE_DIR}/include
)

############################################################
# Create an executable
############################################################

# Add an executable with the above sources
add_executable(cmake_examples_inst_bin
    src/main.cpp
)

# link the new hello_library target with the hello_binary target
target_link_libraries( cmake_examples_inst_bin
    PRIVATE 
        cmake_examples_inst
)

############################################################
# Install
############################################################

# Binaries
# Install the binary generated from the target cmake_examples_inst_bin 
#   target to the destination ${CMAKE_INSTALL_PREFIX}/bin
install (TARGETS cmake_examples_inst_bin
    DESTINATION bin)

# Library
# Install the shared library generated from the target cmake_examples_inst 
#   target to the destination ${CMAKE_INSTALL_PREFIX}/lib
# Note: may not work on windows
install (TARGETS cmake_examples_inst
    LIBRARY DESTINATION lib)

# Header files
# Install the header files for developing against the cmake_examples_inst library 
#   into the ${CMAKE_INSTALL_PREFIX}/include directory.
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ 
    DESTINATION include)

# Config
# Install a configuration file to the destination ${CMAKE_INSTALL_PREFIX}/etc
install (FILES cmake-examples.conf
    DESTINATION etc)
