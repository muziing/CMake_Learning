# CMake 流程控制之 for 循环
cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

foreach (num 1 2 3 4 5 6)
    message("num=${num}")
endforeach ()

# --------------------------------------------------
set(list1 A B)
set(list2)
set(foo WillNotBeShown)
foreach(loopVar IN LISTS list1 list2 ITEMS foo bar)
    # 对于 ITEMS 中的 foo，若不写作${foo}，则会被当作字符串"foo"
    message("Iteration for: ${loopVar}")
endforeach()

# --------------------------------------------------
set(list0 A B)
set(list1 one two)
foreach(var0 var1 IN ZIP_LISTS list0 list1)
    message("Vars: ${var0} ${var1}")
endforeach()

#[[
如果只给出一个 loopVar，则该命令将在每次迭代时设置 loopVar_N 形式的变量，其中 N 对应于 listVarN 变量。编号从 0 开始。
如果每个 listVar 都有一个 loopVar，那么该命令会一对一映射它们，而不是创建 loopVar_N 变量。
]]
foreach(var IN ZIP_LISTS list0 list1)
    message("Vars: ${var_0} ${var_1}")
endforeach()

#[[
以这种方式“压缩”的列表不必长度相同。当迭代超过较短列表的末尾时，关联的迭代变量将未定义。取未定义变量的值会导致空字符串。
]]
set(long  a b c)
set(short justOne)
foreach(varLong varShort IN ZIP_LISTS long short)
    message("Vars: ${varLong} ${varShort}")
endforeach()

# --------------------------------------------------
# 也可以使用类似 C 语言的 for 循环形式：
# foreach(loopVar RANGE start stop [step])
foreach (loopVar RANGE 0 9 2)
    message("loopVar=${loopVar}")
endforeach ()