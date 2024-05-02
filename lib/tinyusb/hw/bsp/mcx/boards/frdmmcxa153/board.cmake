set(MCU_VARIANT MCXA153)
set(MCU_CORE MCXA153)

set(FAMILY_MCUS MCXA15 CACHE INTERNAL "")
set(CMAKE_SYSTEM_PROCESSOR cortex-m33-nodsp-nofp CACHE INTERNAL "System Processor")

set(JLINK_DEVICE MCXA153_M33)
set(PYOCD_TARGET MCXA153)
set(NXPLINK_DEVICE MCXA153:MCXA153)

set(PORT 0)

function(update_board TARGET)
  target_compile_definitions(${TARGET} PUBLIC
    CPU_MCXA153VLH
    BOARD_TUD_RHPORT=0
    BOARD_TUD_MAX_SPEED=OPT_MODE_FULL_SPEED
    )
  target_sources(${TARGET} PUBLIC
    ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/clock_config.c
    ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/pin_mux.c
    )
endfunction()