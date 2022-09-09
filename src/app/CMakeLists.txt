target_sources(
  dwm1001-app
  PRIVATE
  main.c
  ss_init_main.c
  UART/UART.c
)

target_include_directories(
  dwm1001-app
  PRIVATE
  config
  UART
)
