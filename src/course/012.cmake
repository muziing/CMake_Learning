# CMake 流程控制之 if() 命令
cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

#[[
ON、YES、TRUE、Y 被视为真
OFF、NO、FALSE、N、IGNORE、NOTFOUND、空字符串、以 -NOTFOUND 结尾的字符串被视为假。
]]

if (ON)
    message("1进入了if分支")
endif ()

# 如果是一个数字，将根据 C 语言的规则转换成 bool 值
#[[
如果上述三种情况都不适用，那该条件表达式将被当作一个变量的名字。
如果没有使用引号，那该变量的值会和为假的值对比，如果匹配上则为假，否则为真。如果其值是空字符串则为假。
如果使用引号，且该字符串不匹配任何为真的值，则该条件表达式为假（CMake 3.1+）
]]
if (VAR)
    message("2进入了if分支")
elseif ("Y")
    message("2进入了else if分支")
else ()
    message("2进入了else分支")
endif ()

# if(ENV{some_var}) 这种形式的条件表达式永远为假，所以不要使用环境变量。
#message(STATUS "---------$ENV{PATH}-------------")
#if ($ENV{PATH})
#    message(STATUS "ENV{PATH}为真")
#else ()
#    message("ENV{PATH}为假")
#endif ()

#[[
# 逻辑运算符
if(NOT expression)
if(expression1 AND expression2)
if(expression1 OR expression2)
]]

#if (NOT OFF)
#if (1 AND -5)
if (OFF OR "Y")
    message("3进入了if语句")
else ()
    message("3进入了else分支")
endif ()

#[==[
比较表达式
if(value1 OPERATOR value2)
其中的OPERATOR根据数据类型的不同，有LESS GREATER EQUAL STRLESS STREQUAL VERSION_LESS PATH_EQUAL 等
版本号比较要求 major[.minor[.patch[.tweak]]]
]==]

#[[
# 正则表达式
if(value MATCHES regex)
]]

#set(who "Muzing")
set(who "Fred")

if("Hi from ${who}" MATCHES "Hi from (Fred|Barney).*")
    message("${CMAKE_MATCH_1} says hello")
elseif ()
    message("正则匹配失败")
endif()

#[[
# 文件系统相关表达式
if(EXISTS pathToFileOrDir)
if(IS_DIRECTORY pathToDir)
if(IS_SYMLINK fileName)
if(IS_ABSOLUTE path)
if(file1 IS_NEWER_THAN file2)
]]

set(firstFile "./004.cmake")
set(secondFile "./005.cmake")

if(NOT EXISTS ${firstFile})
    message(FATAL_ERROR "${firstFile} is missing")  # 如果文件不存在，则报错
elseif(NOT EXISTS ${secondFile} OR NOT ${secondFile} IS_NEWER_THAN ${firstFile})
    # 小技巧：判断文件新旧时都使用 NOT IS_NEWER_THAN 的方式，避免两个文件时间完全相同时的问题
    message("Some commands to recreate secondFile")
endif()

#[[
判断是否存在表达式
if(DEFINED name)
if(COMMAND name)
if(POLICY name)
if(TARGET name)
if(TEST name)               # Available since CMake 3.4
if(value IN_LIST listVar)   # Available since CMake 3.3

if(DEFINED SOMEVAR)           # Checks for a CMake variable (regular or cache)
if(DEFINED CACHE{SOMEVAR})    # Checks for a CMake cache variable
if(DEFINED ENV{SOMEVAR})      # Checks for an environment variable
]]

#set(MYVAR "something")

if (DEFINED MYVAR)
    message("4进入了if分支")
elseif (DEFINED ENV{PATH})
    message("4进入了else if分支")
else ()
    message("4进入了else分支")
endif ()
