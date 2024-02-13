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

target_include_directories(helper PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(helper PUBLIC jimtcl)

