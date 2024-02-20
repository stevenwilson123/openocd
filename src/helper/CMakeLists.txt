add_library(helper STATIC binarybuffer.c
						  command.c
						  configuration.c
						  crc32.c
						  fileio.c
						  jep106.c
						  jim-nvp.c
						  log.c
						  nvp.c
						  options.c
						  replacements.c
						  time_support.c
						  time_support_common.c
						  util.c)

target_include_directories(helper PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
								  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/..)




target_link_libraries(helper PUBLIC jimtcl)




if(MSVC)
	target_compile_definitions(helper PUBLIC _CRT_SECURE_NO_WARNINGS)

	find_package(unofficial-getopt-win32 REQUIRED)
    target_link_libraries(helper PRIVATE unofficial::getopt-win32::getopt)

endif()




