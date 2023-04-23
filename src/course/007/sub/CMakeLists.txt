cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

set(A "aaa" PARENT_SCOPE)  # 在父作用域内定义变量
set(B "bbb")

# 此处无法获取A的值，因为A在父作用域而非当前作用域中
message(STATUS "sub A=${A}")
message(STATUS "sub B=${B}")
