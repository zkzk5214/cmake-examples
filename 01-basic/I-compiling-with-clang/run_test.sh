#!/bin/bash
# Ubuntu supports multiple versions of clang to be installed at the same time.
# The tests need to determine the clang binary before calling cmake
# which 语句返回后面命令的路径
clang_bin=`which clang`
clang_xx_bin=`which clang++`

#  -z 指如果后面的路径为空则为真
if [ -z $clang_bin ]; then
    # 如果用 which 没有找到 clang 的二进制可执行文件，则用 dpkg 找到 clang，并返回版本号
    clang_ver=`dpkg --get-selections | grep clang | grep -v -m1 libclang | cut -f1 | cut -d '-' -f2`
    clang_bin="clang-$clang_ver"
    clang_xx_bin="clang++-$clang_ver"
fi
# dpkg –get-selections 罗列出所有包的名字并且给出了他们现在的状态,比如,已安装 (installed)
#   已经卸载 (deinstalled)
# grep clang 从结果中查找到带有 clang 名字的
# grep -v   反转，选择不匹配的所有行。
# grep -m1  单纯的 -m1 表示输出1条匹配的结果之后就会停止
# grep -v -m1 libclang 输出包含 clang 的命令中，所有不包含 libclang 的一条介绍
#   也就是去掉那些 clang 的库，寻找 clang 这个程序的版本。
# cut 命令从文件的每一行剪切字节、字符和字段并将这些字节、字符和字段写至标准输出。
# cut -f1  将这行按照空格分隔之后选择第1个字段，就是clang-3.6
# cut -d '-' -f2  按照-分隔，选择第2个字段就是3.6 从而得到版本号

# ```shell
# $ dpkg --get-selections | grep clang | grep -v -m1 libclang
# clang-3.6					install
# $ dpkg --get-selections | grep clang | grep -v -m1 libclang | cut -f1
# clang-3.6
# $ dpkg --get-selections | grep clang | grep -v -m1 libclang | cut -f6
# install
# $ dpkg --get-selections | grep clang | grep -v -m1 libclang | cut -f1 | cut -d '-' -f2
# 3.6
# $ dpkg --get-selections | grep clang | grep -v -m1 libclang | cut -f1 | cut -d '-' -f1
# clang
# ```

echo "Will use clang [$clang_bin] and clang++ [$clang_xx_bin]"


mkdir -p build.clang && cd build.clang && \
    cmake .. -DCMAKE_C_COMPILER=$clang_bin -DCMAKE_CXX_COMPILER=$clang_xx_bin && make

# CMAKE_C_COMPILER - 用于编译c代码的程序。
# CMAKE_CXX_COMPILER - 用于编译c++代码的程序。
# CMAKE_LINKER - 用于链接二进制文件的程序。