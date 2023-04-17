# CMake 变量之缓存变量
cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

# 与普通变量不同，缓存变量的值可以缓存到 CMakeCache.txt 文件中，当再次运行 cmake 时，可以从中获取上一次的值，而不是重新去评估。
# 所以缓存变量的作用域是全局的。
# 需要将本脚本的内容，复制到此项目根目录下的 CMakeLists.txt 中，进行实际的 build 才能演示效果

# 定义缓存变量的格式如下
# set(varName value... CACHE type "docstring" [FORCE])

# CACHE 表示该变量为缓存变量

# 其中的 type 为必选参数，其值只能是 BOOL、FILEPATH、STRING、INTERNAL 中的一种
# 各种类型的区别只是为了优化 CMake-GUI 工具的使用体验，本质上都还是字符串

set(IS_BUILD_TEST OFF CACHE BOOL "Is build test")  # 参数分别为：变量名、默认值、指定为缓存变量、变量类型、文档字符
#option(IS_BUILD_TEST "Is build test" OFF)  # 与上一行的效果相同。对于变量类型是BOOL的，可以使用option()替代set()

message(STATUS "IS_BUILD_TEST=${IS_BUILD_TEST}")

# FORCE 关键字代表每次运行都强制更新缓存变量的值。如果没有该关键字，当再次运行 cmake 的时候，
# cmake 将使用 CMakeCache.txt 文件中缓存的值，而不是重新进行评估。
set(GIT_PATH_TEST "/usr/bin/git" CACHE FILEPATH "Git Path" FORCE)
