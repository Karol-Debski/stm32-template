# without system, bare-metal application
set(CMAKE_SYSTEM_NAME Generic)

### setup toolchain
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_AR arm-none-eabi-ar)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)
set(CMAKE_NM arm-none-eabi-nm) 
set(CMAKE_STRIP arm-none-eabi-strip)
set(CMAKE_RANLIB arm-none-eabi-ranlib)
###


# When trying to link cross compiled test program, error occurs, so setting test compilation to static library
# 
# Cmake podczas konfiguracji kompiluje sobie przykładowy program w C i C++ i próbuje go sobie uruchomić żeby sprawdzić, czy podany toolchain wgl działa.
# Program który się kompiluje i wykonuje:
# int main(int argc, char *argv[]) { return argc - 1; }
# Jednak program się nie uruchomi ponieważ jest on napisany dla platformy PC.
# By nie uruchamiać programu, informujemy cmake'a, że chcemy skompilować przykładowy program jako biblioteke statyczną
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# wlaczenie logow dla makefilow i dla ninja
set(CMAKE_VERBOSE_MAKEFILE ON)

# Zamiast dolaczac standardowe biblioteki C, co dolaczyc zadecyduje programista 
set(CMAKE_C_STANDARD_LIBRARIES "")


### Macro to funkcja, tyle że o globalnym zakresie. Sluzy do generacji pliku wynikowego w roznych formatach
macro(add_arm_executable target_name)

# stworzenie zmiennych cmake'a do 
set(elf_file ${target_name}.elf)
set(map_file ${target_name}.map)
set(hex_file ${target_name}.hex)
set(bin_file ${target_name}.bin)
set(lss_file ${target_name}.lss)
set(dmp_file ${target_name}.dmp)

add_executable(${elf_file} ${ARGN})

### funkcje do generowania plikow wynikowych w różnych formatach, wywołujemy tutaj narzędzie objcopy
add_custom_command(
  OUTPUT ${hex_file}
  COMMAND
    ${CMAKE_OBJCOPY} -O ihex ${elf_file} ${hex_file}
  DEPENDS ${elf_file}
)
# #generate bin file
add_custom_command(
  OUTPUT ${bin_file}
  COMMAND
    ${CMAKE_OBJCOPY} -O binary ${elf_file} ${bin_file}
  DEPENDS ${elf_file}
)
# #generate extended listing
add_custom_command(
  OUTPUT ${lss_file}
  COMMAND
    ${CMAKE_OBJDUMP} -h -S ${elf_file} > ${lss_file}
  DEPENDS ${elf_file}
)
# #generate memory dump
add_custom_command(
  OUTPUT ${dmp_file}
  COMMAND
    ${CMAKE_OBJDUMP} -x --syms ${elf_file} > ${dmp_file}
  DEPENDS ${elf_file}
)
# postprocessing from elf file - generate hex bin etc.
# nowa komenda makefile
add_custom_target(
  ${CMAKE_PROJECT_NAME}
  ALL
  DEPENDS ${hex_file} ${bin_file} ${lss_file} ${dmp_file}
)
# ustawienie nazwy pliku wynikowego jako target_name.elf, tylko po co na .elf? 
set_target_properties(
  ${CMAKE_PROJECT_NAME}
  PROPERTIES
    OUTPUT_NAME ${elf_file}
)

endmacro(add_arm_executable)
###

macro(arm_link_libraries target_name)

# {ARGN} holds the list of arguments past the last expected argument
target_link_libraries(${target_name}.elf ${ARGN})

endmacro(arm_link_libraries)