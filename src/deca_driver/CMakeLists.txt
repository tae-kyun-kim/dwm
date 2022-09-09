target_sources(
  dwm1001-app
  PRIVATE
  deca_device.c
  deca_params_init.c
  deca_range_tables.c
  port/port_platform.c
)

target_include_directories(
  dwm1001-app
  PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
  port
)
