cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

project(cmake
        VERSION         0.1.0
        DESCRIPTION     "CMake Demo"
        HOMEPAGE_URL    "https://github.com/muziing/CMake_Learning"
        LANGUAGES       CXX
)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(BuildInfo)

add_subdirectory(external)   # 第三方项目
add_subdirectory(src)        # 自身项目源码
add_subdirectory(docs)       # 文档
add_subdirectory(test)       # 单元测试
add_subdirectory(packaging)  # 打包（用于发布）
