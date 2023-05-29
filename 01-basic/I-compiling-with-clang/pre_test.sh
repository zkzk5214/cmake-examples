#!/bin/bash
# pre_test 脚本删除之前配置的 build 文件，run_test 运行 clang，生成这次的 build.clang 文件
# 这个脚本的作用是如果存在 build.clang 这个文件夹，就把它删除掉

# shell 脚本的语法，pwd 输出文件当前所在路径,赋值给 ROOT_DIR 这个变量
ROOT_DIR=`pwd`
dir="01-basic/I-compiling-with-clang"

if [ -d "$ROOT_DIR/$dir/build.clang" ]; then
    echo "deleting $dir/build.clang"
    rm -r $dir/build.clang
fi

# if then fi 是 shell 脚本里的判断语句，如果 [] 里的条件为真，则执行 then 后面的语句
# 基本格式：
#       if [判断语句]; then
#           执行语句
#       fi
# -d 与路径配合，路径存在则为真
# 单纯的 dir 等价于 ls -C -b; 也就是说，默认情况下，文件在列中列出，并垂直排序，
#   特殊字符由反斜杠转义序列表示。也就是说只要当前路径下存在 build.clang 就执行删除