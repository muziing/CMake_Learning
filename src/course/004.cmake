# CMake 变量之普通变量
cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

# CMake 中的变量均为字符串（或字符串组成的列表）
# "不包含空格的字符串在CMake中可以不使用引号包裹" 但建议都使用引号包裹
# 使用 空格或;分号分隔字符串，被分隔后的字符串构成列表

set(varName "123")  # 变量名为varName，变量值为 "123"
#unset(varName)  # 取消变量定义

message(STATUS "varName=${varName}")  # 获取变量值的方法：${变量名}
message(STATUS "var=${var}")  # 可以直接使用未定义过的变量，不会报错，其值为空字符串

set(CPR_BASE_SOURCE "a.cpp;b.cpp")  # 将字符串列表设置给变量

# 将多行字符串设置给变量的方法：用[[开始、]]结束
set(CPR_BUILD_CMD [[
#!/bin/bash

cmake -S . -B build
cmake --build build
]])

# 设置多行字符串时，如果字符串内容本身就包括了[[]]，那么在外围用于包裹的
# [[、]]之间插入相同的字符来解决。例如这里插入 =
set(shellScript [=[
#!/bin/bash
[[ -n "${USER}" ]] && echo "Have USER"
]=])
