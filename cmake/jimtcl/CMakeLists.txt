

add_subdirectory(autosetup)

set(jimtcl_source_dir ${CMAKE_SOURCE_DIR}/jimtcl)

set(jimtcl_generated_sources binary.c glob.c nshelper.c oo.c stdlib.c tclcompat.c tree.c)

foreach(jim_src ${jimtcl_generated_sources} initjimsh.c)
	get_filename_component (src_base ${jim_src} NAME_WE)

	add_custom_command(OUTPUT ${jim_src} COMMAND ${CMAKE_CURRENT_BINARY_DIR}/autosetup/jimsh0.exe ARGS ${jimtcl_source_dir}/make-c-ext.tcl ${jimtcl_source_dir}/${src_base}.tcl > ${jim_src} MAIN_DEPENDENCY ${jimtcl_source_dir}/${src_base}.tcl DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/autosetup/jimsh0.exe)
endforeach(jim_src)

INCLUDE (CheckIncludeFiles)

set(JIM_VERSION_REGEX "define[ \t]+JIM_VERSION[ \t]+([0-9]+)$")
file(STRINGS ${jimtcl_source_dir}/auto.def JIM_VERSION_DEF REGEX "${JIM_VERSION_REGEX}")
string(REGEX REPLACE "${JIM_VERSION_REGEX}" "\\1" JIM_VERSION "${JIM_VERSION_DEF}")

if(NOT JIM_VERSION)
	message(FATAL_ERROR "Could not determine the jimtcl version from auto.def")
endif()

if (WIN32)
	if(MINGW)
		set(TCL_PLATFORM_OS "mingw")
	endif()

	if(MSVC)
		set(TCL_PLATFORM_OS "windows")
	endif()

	set(TCL_PLATFORM_PATH_SEPARATOR ";")
	set(TCL_PLATFORM_PLATFORM "windows")

endif (WIN32)

if (UNIX)
    set(TCL_PLATFORM_OS "linux")
    set(TCL_PLATFORM_PATH_SEPARATOR ":")
    set(TCL_PLATFORM_PLATFORM "unix")
endif (UNIX)


CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/jim-config.h.in ${CMAKE_CURRENT_BINARY_DIR}/jim-config.h)
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/jimautoconf.h.in ${CMAKE_CURRENT_BINARY_DIR}/jimautoconf.h)

add_custom_command(OUTPUT _load-static-exts.c COMMAND ${CMAKE_CURRENT_BINARY_DIR}/autosetup/jimsh0.exe ARGS ${jimtcl_source_dir}/make-load-static-exts.tcl aio array clock eventloop exec file history load namespace pack package readdir regexp tclprefix binary glob nshelper oo stdlib tclcompat tree > _load-static-exts.c MAIN_DEPENDENCY ${jimtcl_source_dir}/make-load-static-exts.tcl DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/autosetup/jimsh0.exe)

include_directories(${jimtcl_source_dir} ${CMAKE_CURRENT_BINARY_DIR})
add_library(jimtcl STATIC ${jimtcl_generated_sources}
						  ${jimtcl_source_dir}/jim-subcmd.c
						  ${jimtcl_source_dir}/jim-interactive.c
						  ${jimtcl_source_dir}/jim-format.c
						  ${jimtcl_source_dir}/jim.c
						  ${jimtcl_source_dir}/utf8.c
						  ${jimtcl_source_dir}/jimregexp.c
						  ${jimtcl_source_dir}/linenoise.c
						  ${jimtcl_source_dir}/jim-win32compat.c
						  ${jimtcl_source_dir}/jim-aio.c
						  ${jimtcl_source_dir}/jim-array.c
						  ${jimtcl_source_dir}/jim-clock.c
						  ${jimtcl_source_dir}/jim-eventloop.c
						  ${jimtcl_source_dir}/jim-exec.c
						  ${jimtcl_source_dir}/jim-file.c
						  ${jimtcl_source_dir}/jim-history.c
						  ${jimtcl_source_dir}/jim-load.c
						  ${jimtcl_source_dir}/jim-namespace.c
						  ${jimtcl_source_dir}/jim-pack.c
						  ${jimtcl_source_dir}/jim-package.c
						  ${jimtcl_source_dir}/jim-readdir.c
						  ${jimtcl_source_dir}/jim-regexp.c
						  ${jimtcl_source_dir}/jim-tclprefix.c
						  ${jimtcl_source_dir}/jim-nosignal.c
						  _load-static-exts.c)

if(MSVC)
	target_compile_definitions(jimtcl PRIVATE _CRT_SECURE_NO_WARNINGS)
endif()



#jimiocompat.c causes problems when compiled on Windows without __MINGW32__ defined.
#so here we  build it as its own seperate library with __MINGW32__ defined ONLY for that one file...
add_library(jimiocompat STATIC ${jimtcl_source_dir}/jimiocompat.c)

if(MSVC)
	target_compile_definitions(jimiocompat PRIVATE _CRT_SECURE_NO_WARNINGS)
	target_compile_definitions(jimiocompat PRIVATE __MINGW32__)
endif()



add_executable(jimsh ${jimtcl_source_dir}/jimsh.c initjimsh.c)

target_link_libraries(jimsh jimtcl jimiocompat)
