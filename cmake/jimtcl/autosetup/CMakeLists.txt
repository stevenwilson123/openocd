add_executable(jimsh0 ${CMAKE_SOURCE_DIR}/jimtcl/autosetup/jimsh0.c)

if(MSVC)
	target_compile_definitions(jimsh0 PRIVATE _CRT_SECURE_NO_WARNINGS)
	target_compile_definitions(jimsh0 PRIVATE __MINGW32__)
endif()