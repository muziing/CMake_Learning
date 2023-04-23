# CMake 字符串
cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

# 字符串查找
# 在 inputString 中查找 subString，将查找到的索引保存到 outVar 中，索引从 0 开始
# string(FIND inputString subString outVar [REVERSE])
string(FIND "abcdefabcdef" "def" fwdIndex)
string(FIND "abcdefabcdef" "def" revIndex REVERSE)  # 保存最后一个查找到的索引
message("fwdIndex = ${fwdIndex}\n"  # 3
        "revIndex = ${revIndex}")  # 9

# ---------------------------------------------------------------

# 替换字符串
# string(REPLACE matchString replaceWith outVar input...)
string(REPLACE "abc" "ccc" output "abc-abc-abc")
message("output=${output}")

# 亦支持正则表达式方式查找替换
# string(REGEX MATCH    regex outVar input...)
# string(REGEX MATCHALL regex outVar input...)
# string(REGEX REPLACE  regex replaceWith outVar input...)
string(REGEX MATCH    "[ace]"           matchOne abcdefabcdef)
string(REGEX MATCHALL "[ace]"           matchAll abcdefabcdef)
string(REGEX REPLACE  "([de])" "X\\1Y"  replVar1 abc def abcdef)
string(REGEX REPLACE  "([de])" [[X\1Y]] replVar2 abcdefabcdef)
message("matchOne = ${matchOne}\n"
        "matchAll = ${matchAll}\n"
        "replVar1 = ${replVar1}\n"
        "replVar2 = ${replVar2}")

# ---------------------------------------------------------------

# 截取字符串
# string(SUBSTRING input index length outVar)
# 将 input 字符串从 index 处截取 length 长度放到 outVar 中
string(SUBSTRING "abcdef" 2 -1 mySubstring)
message("mySubstring=${mySubstring}")

# ---------------------------------------------------------------
# 常用操作
#string(LENGTH  input outVar)  # LENGTH 获取 input 字符串的长度，保存到 outVar 中
#string(TOLOWER input outVar)  # TOLOWER 将 input 字符串转换成小写保存到 outVar 中
#string(TOUPPER input outVar)  # TOUPPER 将 input 字符串转换成大写保存到 outVar 中
#string(STRIP   input outVar)  # STRIP 将 input 字符串的头尾空格去掉
