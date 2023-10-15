message(FATAL_ERROR "Provide src's, inc dirs, linker script, startup-file and paste your main function in main of the project, then comment that message.")

set(TARGET_PROJECT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/project)

list(APPEND TARGET_INCLUDE_DIRS


)

list(APPEND TARGET_SRC

    
)

set(LINKER_SCRIPT ${TARGET_PROJECT_PATH}/ PARENT_SCOPE)
set(STARTUP_FILE_SRC ${TARGET_PROJECT_PATH}/  PARENT_SCOPE)

set(TARGET_INCLUDE_DIRS ${TARGET_INCLUDE_DIRS} PARENT_SCOPE)
set(TARGET_SRC ${TARGET_SRC} PARENT_SCOPE)