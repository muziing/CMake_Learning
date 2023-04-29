# CMake 流程控制之 while 循环
cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

set(num 10)

while(num GREATER 0)
    message(STATUS "current num = ${num}")
    math(EXPR num "${num} - 1")
endwhile()
