cmake_minimum_required (VERSION 3.5)

project (OpenOCD)

set(OPENOCD_VERSION 0.12.0)

include(cmake/config.cmake)


add_subdirectory(cmake/jimtcl)



add_subdirectory(src)