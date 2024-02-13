add_library(flash_nand STATIC arm_io.c
							  at91sam9.c
                              core.c
							  davinci.c
							  driver.c
							  ecc.c
							  ecc_kw.c
							  fileio.c
							  lpc32xx.c
							  lpc3180.c
							  mxc.c
							  mx3.c
							  nonce.c
							  nuc910.c
							  orion.c
							  s3c24xx.c
							  s3c2410.c
							  s3c2412.c
							  s3c2440.c
							  s3c2443.c
							  s3c6400.c
							  tcl.c)

target_include_directories(flash_nand PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
                                      PRIVATE ../..)

target_link_libraries(flash_nand PRIVATE helper)

