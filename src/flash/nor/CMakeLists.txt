add_library(flash_nor STATIC aducm360.c
							 aduc702x.c
							 ambiqmicro.c
							 ath79.c
							 atsame5.c
							 atsamv.c
							 at91samd.c
							 at91sam3.c
							 at91sam4.c
							 at91sam4l.c
							 at91sam7.c
							 avrf.c
							 bluenrg-x.c
							 cc26xx.c
							 cc3220sf.c
							 cfi.c
							 core.c
							 drivers.c
							 dsp5680xx_flash.c
							 efm32.c
							 em357.c
							 esirisc_flash.c
							 faux.c
							 fespi.c
							 fm3.c
							 fm4.c
							 jtagspi.c
							 kinetis.c
							 kinetis_ke.c
							 lpcspifi.c
							 lpc288x.c
							 lpc2000.c
							 lpc2900.c
							 max32xxx.c
							 mdr.c
							 mrvlqspi.c
							 msp432.c
							 niietcm4.c
							 non_cfi.c
							 npcx.c nrf5.c
							 numicro.c
							 ocl.c
							 pic32mx.c
							 psoc4.c
							 psoc5lp.c
							 psoc6.c
							 qn908x.c
							 renesas_rpchf.c
							 rp2040.c
							 rsl10.c
							 sfdp.c
							 sh_qspi.c
							 sim3x.c
							 spi.c
							 stellaris.c
							 stmqspi.c
							 stmsmi.c
							 stm32f1x.c
							 stm32f2x.c
							 stm32h7x.c
							 stm32lx.c
							 stm32l4x.c
							 str7x.c
							 str9x.c
							 str9xpec.c
							 swm050.c
							 tcl.c
							 tms470.c
							 virtual.c
							 w600.c
							 xcf.c
							 xmc1xxx.c
							 xmc4xxx.c)


target_include_directories(flash_nor PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
                                     PRIVATE ../..)

target_link_libraries(flash_nor PRIVATE helper)