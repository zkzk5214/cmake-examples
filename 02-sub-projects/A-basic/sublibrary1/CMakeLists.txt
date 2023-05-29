# Set the project name
project (sublibrary1)

# Add a library with the above sources
# 如果子项目创建了一个库，则其他项目可以通过在 target_link_libraries（）
#   命令中调用该项目的名称来引用该库。 
# target_link_libraries(subbinary
#     PUBLIC
#         sublibrary1
# )
# 或者创建一个别名目标，该目标允许您在上下文（某个目标的绰号）中引用该目标。
add_library(${PROJECT_NAME} src/sublib1.cpp)
add_library(sub::lib1 ALIAS ${PROJECT_NAME})

# To reference the alias, just it as follows:
# target_link_libraries(subbinary
# sub::lib1
# )

target_include_directories( ${PROJECT_NAME}
    PUBLIC ${PROJECT_SOURCE_DIR}/include
)
