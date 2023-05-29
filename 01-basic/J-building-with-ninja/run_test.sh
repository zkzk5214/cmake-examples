#!/bin/bash
# Travis-ci cmake version doesn't support ninja, so first check if it's supported
ninja_supported=`cmake --help | grep Ninja`

if [ -z $ninja_supported ]; then
    echo "Ninja not supported"
    exit
fi

# To call a CMake generator you can use the -G command line switch.
# After doing the above CMake will generate the required Ninja build files, 
#   which can be run from using the ninja command.
mkdir -p build.ninja && cd build.ninja && \
    cmake .. -G Ninja && ninja
