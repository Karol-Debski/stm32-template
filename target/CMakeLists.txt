#message(FATAL_ERROR "Provide src's, inc dirs, syscalls.c, sysmem.c, linker script, startup-file and paste your main function in main of the project, then comment that message.")

set(TARGET_PROJECT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/project)

set(LINKER_SCRIPT ${TARGET_PROJECT_PATH}/STM32F407VGTx_FLASH.ld PARENT_SCOPE)
set(STARTUP_FILE_SRC ${TARGET_PROJECT_PATH}/startup_stm32f407xx.s)
set(STARTUP_FILE_SRC ${STARTUP_FILE_SRC} PARENT_SCOPE)


list(APPEND TARGET_INCLUDE_DIRS
    ${TARGET_PROJECT_PATH}/Core/Inc 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Inc 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy 
    ${TARGET_PROJECT_PATH}/Drivers/CMSIS/Device/ST/STM32F4xx/Include 
    ${TARGET_PROJECT_PATH}/Drivers/CMSIS/Include

)

list(APPEND TARGET_SRC
    ${STARTUP_FILE_SRC} 
    ${TARGET_PROJECT_PATH}/Core/Src/main.c 
    ${TARGET_PROJECT_PATH}/Core/Src/stm32f4xx_it.c 
    ${TARGET_PROJECT_PATH}/Core/Src/stm32f4xx_hal_msp.c
    ${TARGET_PROJECT_PATH}/Core/Src/syscalls.c 
    ${TARGET_PROJECT_PATH}/Core/Src/sysmem.c  
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c 
    ${TARGET_PROJECT_PATH}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c 
    ${TARGET_PROJECT_PATH}/Core/Src/system_stm32f4xx.c
    
)

set(TARGET_INCLUDE_DIRS ${TARGET_INCLUDE_DIRS} PARENT_SCOPE)
set(TARGET_SRC ${TARGET_SRC} PARENT_SCOPE)