cmake_minimum_required(VERSION 3.20.0)

project(inrol-dwm1001-app C ASM)

include(cmake/arm-gcc-toolchain.cmake)
include(cmake/utils.cmake)

# set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/cmake/arm-gcc-toolchain.cmake")

set(CPU_FLAGS -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16)
set(DEF_FLAGS -DNRF52 -DNRF52832 -D__LINT__=0)
set(COMPILER_FLAGS -Os -g -ffunction-sections -fdata-sections -fno-exceptions)
# set(CMAKE_EXE_LINKER_FLAGS_INIT "--specs=nosys.specs")
set(LINKER_DIR "${CMAKE_CURRENT_SOURCE_DIR}/nrf5_sdk/components/toolchain/gcc")
set(LINKER_FILE "${LINKER_DIR}/nrf52_xxaa.ld")
#set(CMAKE_EXE_LINKER_FLAGS "-mfloat-abi=hard -Wl,-T ${LINKDER_SCRPIT}")

string(REPLACE ";" " " _LINKER_CPU_FLAGS "${CPU_FLAGS}")
string(APPEND CMAKE_EXE_LINKER_FLAGS " ${_LINKER_CPU_FLAGS} -L ${LINKER_DIR} -Wl,-T ${LINKER_FILE} -Wl,--gc-sections --specs=nosys.specs")



#add_link_options("-mfloat-abi=hard")
add_compile_options(${CPU_FLAGS} ${DEF_FLAGS} ${COMPILER_FLAGS} ${WARN_FLAGS})

# add_link_options("-mthumb")
message(STATUS ${CMAKE_EXE_LINKER_FLAGS})
#add_link_options("-mfpu=fpv4-sp-d16")
# set(CMAKE_EXE_LINKER_FLAGS "--specs=nosys.specs -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16")
#add_link_options("-T ${LINKER_SCRIPT}")
#set(LINKER_SCRIPT "/src/nrf5_sdk/components/toolchain/gcc/nrf52_common.ld")
#add_link_options("-T ${LINKER_SCRIPT}")

## message(STATUS "CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")

add_executable(dwm1001-app "")
#linker_script_target_dependency(dwm1001-app ${LINKER_SCRIPT})

add_subdirectory(nrf5_sdk)
add_subdirectory(deca_driver)
add_subdirectory(app)

firmware_size(dwm1001-app)
generate_object(dwm1001-app .hex ihex)
# add_subdirectory(boards)
