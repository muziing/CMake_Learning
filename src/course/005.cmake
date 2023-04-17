# CMake 变量之环境变量
cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

# 环境变量在设置与获取时需要加上 ENV

message(STATUS "PATH=$ENV{PATH}")  # 获取系统环境变量

set(ENV{GCC_PATH} "/usr/bin/gcc")  # 自定义环境变量，不会影响到操作系统中的环境变量
message(STATUS "$ENV{GCC_PATH}")  # 获取 CMake 中的环境变量
