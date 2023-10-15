# To build use Ninja to get best performance
cmake_minimum_required(VERSION 3.10)

# setup toolchain
set(TOOLCHAIN_DIR_PATH ${CMAKE_CURRENT_SOURCE_DIR}/toolchain)
set(CMAKE_TOOLCHAIN_FILE ${TOOLCHAIN_DIR_PATH}/toolchain-arm-gcc.cmake)

# allow to process mentioned lanugaes
enable_language(C CXX ASM)

# project name
project(stm32-template)

add_subdirectory(app)
add_subdirectory(target)
add_subdirectory(toolchain)

message(FATAL_ERROR "Provide MCU name for compiler (e.g. STM32F407xx), then comment that message.")
set(MCU_TARGET )

set(INCLUDE_DIRS 
    ${APP_INCLUDE_DIRS} 
    ${TARGET_INCLUDE_DIRS}
)

set(CPP_SRCS 

)

set(C_SRCS 
    ${APP_SRC} 
    ${TARGET_SRC}

)

set(ASM_SRCS 

)

set(GLOBAL_DEFINES 
    -DUSE_HAL_DRIVER 
    -D${MCU_TARGET}
)

set(LINKED_LIBS 

)

# add path's to search include files
include_directories(${INCLUDE_DIRS})

#include compiler flags
include(${TOOLCHAIN_DIR_PATH}/compiler_flags.cmake)

#include toolchain
include(${TOOLCHAIN_DIR_PATH}/toolchain-arm-gcc.cmake)

# genearate elf file
add_arm_executable(
    ${CMAKE_PROJECT_NAME} 
    ${C_SRCS}
    ${CPP_SRCS}  
    ${ASM_SRCS} 
)

arm_link_libraries(
    ${CMAKE_PROJECT_NAME} 
    ${LINKED_LIBS}
)