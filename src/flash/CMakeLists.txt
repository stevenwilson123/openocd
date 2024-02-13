add_subdirectory(nand)
add_subdirectory(nor)

add_library(flash STATIC common.c)

target_link_libraries(flash PUBLIC flash_nand
                            PUBLIC flash_nor)

target_include_directories(flash PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
                                 PRIVATE ..)

target_link_libraries(flash PRIVATE helper)