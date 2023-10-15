message(FATAL_ERROR "Provide src's, inc dirs, syscalls.c, sysmem.c, linker script, startup-file and paste your main function in main of the project, then comment that message.")

set(TARGET_PROJECT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/project)

set(LINKER_SCRIPT ${TARGET_PROJECT_PATH}/ PARENT_SCOPE)
set(STARTUP_FILE_SRC ${TARGET_PROJECT_PATH}/  )
set(STARTUP_FILE_SRC ${TARGET_PROJECT_PATH}/  PARENT_SCOPE)

list(APPEND TARGET_INCLUDE_DIRS
    ${STARTUP_FILE_SRC}
    #syscalls.c & sysmem.c  

)

list(APPEND TARGET_SRC

    
)

set(TARGET_INCLUDE_DIRS ${TARGET_INCLUDE_DIRS} PARENT_SCOPE)
set(TARGET_SRC ${TARGET_SRC} PARENT_SCOPE)