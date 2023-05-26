cmake_minimum_required(VERSION 3.5)

project(hello_library)

############################################################
# Create a library
############################################################

# Generate the static library from the library sources
add_library(${PROJECT_NAME} STATIC 
    src/Hello.cpp
)

# .h
# PUBLIC: it is included in this library and also any 
#   targets that link this library.
target_include_directories(${PROJECT_NAME}
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
target_link_libraries( hello_binary
    PRIVATE 
        ${PROJECT_NAME}
)
