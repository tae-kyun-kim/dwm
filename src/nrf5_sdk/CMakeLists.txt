target_sources(
  dwm1001-app
  PRIVATE
  components/drivers_nrf/spi_master/nrf_drv_spi.c
  components/drivers_nrf/common/nrf_drv_common.c
  components/drivers_nrf/clock/nrf_drv_clock.c
  components/drivers_nrf/uart/nrf_drv_uart.c
  components/libraries/balloc/nrf_balloc.c
  components/libraries/strerror/nrf_strerror.c
  components/libraries/uart/app_uart.c
  components/libraries/util/app_util_platform.c
  components/libraries/util/app_error.c
  components/libraries/util/app_error_weak.c
  external/freertos/source/croutine.c
  external/freertos/source/event_groups.c
  external/freertos/source/list.c
  external/freertos/source/queue.c
  external/freertos/source/tasks.c
  external/freertos/source/timers.c
  external/freertos/source/portable/MemMang/heap_1.c
  external/freertos/portable/GCC/nrf52/port.c
  external/freertos/portable/CMSIS/nrf52/port_cmsis.c
  external/freertos/portable/CMSIS/nrf52/port_cmsis_systick.c
  components/toolchain/gcc/gcc_startup_nrf52.S
  components/toolchain/system_nrf52.c
  external/fprintf/nrf_fprintf.c
  external/fprintf/nrf_fprintf_format.c
)

target_include_directories(
  dwm1001-app
  PUBLIC
  components/boards
  components/device
  components/drivers_nrf/common
  components/drivers_nrf/clock
  components/drivers_nrf/delay
  components/drivers_nrf/hal
  components/drivers_nrf/spi_master
  components/drivers_nrf/uart
  components/libraries/bsp
  components/libraries/button
  components/libraries/balloc
  components/libraries/experimental_log
  components/libraries/experimental_log/src
  components/libraries/experimental_section_vars
  components/libraries/experimental_memobj
  components/libraries/strerror
  components/libraries/util
  components/libraries/uart
  components/softdevice/s132/headers
  components/toolchain
  components/toolchain/cmsis/include
  config
  external/freertos/source/include
  external/freertos/config
  external/freertos/portable/GCC/nrf52
  external/freertos/portable/CMSIS/nrf52
  external/fprintf
)
