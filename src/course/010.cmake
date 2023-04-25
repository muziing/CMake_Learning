# CMake 列表
cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

set(listVar "1;2;3;4;5")  # 创建一个列表
#set(listVar 1 2 3 4 5)  # 与上一行等效

list(LENGTH listVar outVar)  # 获取 listVar 列表的长度，并保存至 outVar 中
message("outVar=${outVar}")
message("--------------------------------------")

list(GET listVar 0 outVar)  # 获取 listVar 索引为 0 的元素，保存至 outVar 中
list(GET listVar 0 3 outVar)  # 获取 listVar 索引为 0、3 的元素，保存至列表 outVar 中
list(GET listVar -1 outVar)  # 获取 listVar 末尾的元素，保存至列表 outVar 中
#list(GET listVar 8 outVar)  # 索引越界，会报错
message("outVar=${outVar}")
message("--------------------------------------")

list(INSERT listVar 0 "A" "B")  # 从索引 0 位置开始插入
list(APPEND listVar "C" "C" "D")  # 从末尾追加
list(PREPEND listVar "C;M;a;k;e")  # 从头部添加
message("listVar=${listVar}")
#set(listVar 1 2 3 4 5)  # 将 listVar 恢复
message("--------------------------------------")

list(FIND listVar "3" outVar)  # 查找字符3，若找到则将索引保存至 outVar 中，找到一个就停止
message("outVar=${outVar}")
message("--------------------------------------")

message("listVar=${listVar}")
list(REMOVE_ITEM listVar 1 3 5)  # 移除 1;3;5
message("listVar=${listVar}")
list(REMOVE_AT listVar 1)  # 移除索引为1的元素
message("listVar=${listVar}")
list(REMOVE_DUPLICATES listVar)  # 移除重复的元素
message("listVar=${listVar}")
message("--------------------------------------")

list(POP_FRONT listVar)
message("listVar=${listVar}")

list(POP_FRONT listVar outVar1 outVar2)  # 从前方移出两个值，并分别保存到 outVar1 outVar2 中
message("listVar=${listVar}, outVar1=${outVar1}, outVar2=${outVar2}")

list(POP_BACK listVar outVar1)  # 从后方移出一个值，保存到 outVar1 中
message("listVar=${listVar}, outVar1=${outVar1}")
message("--------------------------------------")

set(listVar a E 3 2 b C 1 D)  # 设置新的列表
message("listVar=${listVar}")

list(SORT listVar)
message("listVar=${listVar}")
# 排序规则参考：https://cmake.org/cmake/help/latest/command/list.html#ordering
list(SORT listVar COMPARE NATURAL)
list(SORT listVar CASE INSENSITIVE)  # 大小写不敏感
message("listVar=${listVar}")
#list(SORT listVar ORDER ASCENDING)  # 升序
list(SORT listVar ORDER DESCENDING)  # 降序
message("listVar=${listVar}")

list(REVERSE listVar)  # 反转
message("listVar=${listVar}")
