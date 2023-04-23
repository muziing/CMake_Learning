# CMake 变量之作用域
cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

project(007)

add_subdirectory(sub)

message(STATUS "top A=${A}")  # 此处可以获取变量A的值
message(STATUS "top B=${B}")

function(test_007)
    set(C "CCC")
    message(STATUS "test_007 C=${C}")
    message(STATUS "test_007 A=${A}")  # 函数中可以获取全局域中的变量
endfunction()

test_007()  # 调用函数

# 无法获取变量C的值，已经离开函数内的作用域
message(STATUS "top C=${C}")

message(STATUS "--------------------------------------")
#set(x 1)
#
#block()
#    set(x 2)   # Shadows outer "x"
#    set(y 3)   # Local, not visible outside the block
#
#    message(STATUS "inner x=${x}")
#    message(STATUS "inner y=${y}")
#endblock()
#
## Here, x still equals 1, y is not defined
#message(STATUS "outer x=${x}")
#message(STATUS "outer y=${y}")

# ---------------block相关知识-----------------------
message(STATUS "--------------------------------------")
#set(x 1)
#set(y 3)
#
#block()
#    set(x 2 PARENT_SCOPE)  # 对当前作用域的父作用域（即全局域）生效
#    unset(y PARENT_SCOPE)
#    message(STATUS "inner x=${x}")  # 此行还在作用域内，x=1
#    message(STATUS "inner y=${y}")  # 同理，y=3
#endblock()
#
## x has the value 2 here and y is no longer defined
#message(STATUS "outer x=${x}")  # x=2
#message(STATUS "outer y=${y}")  # y的值已被取消设置

message(STATUS "--------------------------------------")
#set(x 1)
#set(z 5)
#
#block(PROPAGATE x z)
#    # 加上 PROPAGATE 参数，内部对变量值的修改将传播影响至外部
#    set(x 2) # Gets propagated back out to the outer "x"
#    set(y 3) # 局部变量，对 block 外不可见
#    unset(z) # 也同时 unset 了外部的 z
#    message(STATUS "inner x=${x}")
#    message(STATUS "inner y=${y}")
#    message(STATUS "inner z=${z}")
#endblock()
#
## Here, x equals 2, y and z are undefined
#message(STATUS "outer x=${x}")
#message(STATUS "outer y=${y}")
#message(STATUS "outer z=${z}")

message(STATUS "--------------------------------------")
set(x 1)
set(z 5)

block(SCOPE_FOR VARIABLES PROPAGATE x z)
    set(x 2) # Gets propagated back out to the outer "x"
    set(y 3) # Local variable, not visible outside the block
    unset(z) # Unsets the outer "z" too
    message(STATUS "inner x=${x}")
    message(STATUS "inner y=${y}")
    message(STATUS "inner z=${z}")
endblock()

# 在此处，x=2, y 与 z 未定义
message(STATUS "outer x=${x}")
message(STATUS "outer y=${y}")
message(STATUS "outer z=${z}")
