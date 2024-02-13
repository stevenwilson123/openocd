include(CheckIncludeFiles)
include(CheckSymbolExists)
include("${CMAKE_CURRENT_LIST_DIR}/CheckStruct.cmake")

check_include_files (arpa/inet.h HAVE_ARPA_INET_H)
check_include_files (dirent.h HAVE_DIRENT_H)
check_include_files (dlfcn.h HAVE_DLFCN_H)
check_include_files (elf.h HAVE_ELF_H)
check_include_files (fcntl.h HAVE_FCNTL_H)
check_symbol_exists(gettimeofday "sys/time.h" HAVE_GETTIMEOFDAY)
check_include_files (ifaddrs.h HAVE_IFADDRS_H)
check_include_files (inttypes.h HAVE_INTTYPES_H)
check_include_files (jtag_minidriver.h HAVE_JTAG_MINIDRIVER_H)
set (HAVE_LIBUSB1 1)
set(HAVE_LIBUSB_ERROR_NAME 1)
set(HAVE_LONG_LONG_INT 1)
check_include_files (malloc.h HAVE_MALLOC_H)
check_include_files (memory.h HAVE_MEMORY_H)
check_include_files (netdb.h HAVE_NETDB_H)
check_include_files (netinet/in.h HAVE_NETINET_IN_H)
check_include_files (netinet/tcp.h HAVE_NETINET_TCP_H)
check_include_files (net/if.h HAVE_NET_IF_H)
check_include_files (pthread.h HAVE_PTHREAD_H)
set(HAVE_STDBOOL_H 1)
check_include_files (stdint.h HAVE_STDINT_H)
check_include_files (stdlib.h HAVE_STDLIB_H)
check_include_files (strings.h HAVE_STRINGS_H)
check_include_files (string.h HAVE_STRING_H)
check_symbol_exists(strndup "string.h" HAVE_STRNDUP)
check_symbol_exists(strnlen "string.h" HAVE_STRNLEN)
check_include_files (sys/ioctl.h HAVE_SYS_IOCTL_H)
check_include_files (sys/io.h HAVE_SYS_IO_H)
check_include_files (sys/param.h HAVE_SYS_PARAM_H)
check_include_files (sys/poll.h HAVE_SYS_POLL_H)
check_include_files (sys/select.h HAVE_SYS_SELECT_H)
check_include_files (sys/socket.h HAVE_SYS_SOCKET_H)
check_include_files (sys/stat.h HAVE_SYS_STAT_H)
check_include_files (sys/time.h HAVE_SYS_TIME_H)
check_include_files (sys/types.h HAVE_SYS_TYPES_H)
check_include_files (unistd.h HAVE_UNISTD_H)
set(HAVE_UNSIGNED_LONG_LONG_INT 1)
check_symbol_exists(usleep "unistd.h" HAVE_USLEEP)
check_symbol_exists(vasprintf "stdlib.h" HAVE_VASPRINTF)

if(WIN32)
    check_struct("struct timeval" "winsock2.h" _TIMEVAL_DEFINED)
endif()

if (WIN32)
    set(IS_WIN32 1)
    #set(IS_MINGW 1)

    add_compile_definitions(NOMINMAX)
    add_compile_definitions(WIN32_LEAN_AND_MEAN)
endif (WIN32)

if(UNIX AND APPLE)
	set(IS_DARWIN 1)
endif(UNIX AND APPLE)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/config.h.in ${CMAKE_CURRENT_BINARY_DIR}/config.h)
add_compile_definitions(HAVE_CONFIG_H)
include_directories(${CMAKE_CURRENT_BINARY_DIR})