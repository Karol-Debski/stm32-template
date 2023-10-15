0. Prequsitions
   
Install CMake:
```
sudo apt update
sudo apt install cmake
```
Install OpenOCD:
```
sudo apt-get -y install openocd
```

1. Setup

Generate project by STM32CubeMX with Makefiles. Paste all files to target/project.

Provide MCU target for compiler, e.g. STM32F407xx.

Provide src, inc dirs, syscalls.c, sysmem.c in the target/CMakeLists.txt . Paste your app_main function in main of the project.


1. Build executable

Create build dir and switch to them:
```
mkdir build
cd build
```
Build the project:
```
cmake -G Ninja ..
cmake --build .
```

2. Flash executable to the target

Run OpenOCD:
```
openocd -f <.cfg-file-of-the-mcu>
e.g. board/stm32f4discovery.cfg
```

Run GNU Debugger:
```
arm-none-eabit-gdb
```
Then execute:
```
target remote localhost:3333
```

On the openocd terminal, reset mcu:
```
monitor reset init
```
Flash executable on the target:
```
monitor flash write_image erase <path-to-executable>
```