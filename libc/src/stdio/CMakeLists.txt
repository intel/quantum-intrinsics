# Helper function that creates an alias if a target specific implementation
# exists, otherwise it uses a generic one.
function(add_stdio_entrypoint_object name)
  if(TARGET libc.src.stdio.${LIBC_TARGET_OS}.${name})
    add_entrypoint_object(
      ${name}
      ALIAS
      DEPENDS
        .${LIBC_TARGET_OS}.${name}
    )
  elseif(TARGET libc.src.stdio.generic.${name})
    add_entrypoint_object(
      ${name}
      ALIAS
      DEPENDS
        .generic.${name}
    )
  endif()
endfunction(add_stdio_entrypoint_object)

if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${LIBC_TARGET_OS})
  add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/${LIBC_TARGET_OS})
endif()

if(NOT LIBC_TARGET_ARCHITECTURE_IS_GPU)
  add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/generic)
endif()

add_entrypoint_object(
  fflush
  SRCS
    fflush.cpp
  HDRS
    fflush.h
  DEPENDS
    libc.src.errno.errno
    libc.include.stdio
    libc.src.__support.File.file
    libc.src.__support.File.platform_file
)

add_entrypoint_object(
  flockfile
  SRCS
    flockfile.cpp
  HDRS
    flockfile.h
  DEPENDS
    libc.include.stdio
    libc.src.__support.File.file
    libc.src.__support.File.platform_file
)

add_entrypoint_object(
  funlockfile
  SRCS
    funlockfile.cpp
  HDRS
    funlockfile.h
  DEPENDS
    libc.include.stdio
    libc.src.__support.File.file
    libc.src.__support.File.platform_file
)

add_entrypoint_object(
  fseek
  SRCS
    fseek.cpp
  HDRS
    fseek.h
  DEPENDS
    libc.src.errno.errno
    libc.include.stdio
    libc.src.__support.File.file
    libc.src.__support.File.platform_file
)

add_entrypoint_object(
  ungetc
  SRCS
    ungetc.cpp
  HDRS
    ungetc.h
  DEPENDS
    libc.include.stdio
    libc.src.__support.File.file
    libc.src.__support.File.platform_file
)

add_entrypoint_object(
  fopencookie
  SRCS
    fopencookie.cpp
  HDRS
    fopencookie.h
  DEPENDS
    libc.include.stdio
    libc.src.__support.CPP.new
    libc.src.__support.File.file
)

add_entrypoint_object(
  setbuf
  SRCS
    setbuf.cpp
  HDRS
    setbuf.h
  DEPENDS
    libc.src.errno.errno
    libc.include.stdio
    libc.src.__support.File.file
    libc.src.__support.File.platform_file
)

add_entrypoint_object(
  setvbuf
  SRCS
    setvbuf.cpp
  HDRS
    setvbuf.h
  DEPENDS
    libc.src.errno.errno
    libc.include.stdio
    libc.src.__support.File.file
    libc.src.__support.File.platform_file
)

list(APPEND scanf_deps
      libc.src.__support.arg_list
      libc.src.stdio.scanf_core.vfscanf_internal
)

if(LLVM_LIBC_FULL_BUILD)
  list(APPEND scanf_deps
      libc.src.__support.File.file
      libc.src.__support.File.platform_file
      libc.src.__support.File.platform_stdin
  )
else()
  list(APPEND scanf_copts "-DLIBC_COPT_STDIO_USE_SYSTEM_FILE")
endif()

add_entrypoint_object(
  sscanf
  SRCS
    sscanf.cpp
  HDRS
    sscanf.h
  DEPENDS
    libc.src.__support.arg_list
    libc.src.stdio.scanf_core.reader
    libc.src.stdio.scanf_core.scanf_main
)

add_entrypoint_object(
  fscanf
  SRCS
    fscanf.cpp
  HDRS
    fscanf.h
  DEPENDS
    ${scanf_deps}
  COMPILE_OPTIONS
    ${scanf_copts}
)

add_entrypoint_object(
  scanf
  SRCS
    scanf.cpp
  HDRS
    scanf.h
  DEPENDS
    ${scanf_deps}
  COMPILE_OPTIONS
    ${scanf_copts}
)

add_entrypoint_object(
  sprintf
  SRCS
    sprintf.cpp
  HDRS
    sprintf.h
  DEPENDS
    libc.src.stdio.printf_core.printf_main
    libc.src.stdio.printf_core.writer
)

add_entrypoint_object(
  snprintf
  SRCS
    snprintf.cpp
  HDRS
    snprintf.h
  DEPENDS
    libc.src.stdio.printf_core.printf_main
    libc.src.stdio.printf_core.writer
)

list(APPEND printf_deps
      libc.src.__support.arg_list
      libc.src.stdio.printf_core.vfprintf_internal
)

if(LIBC_CONF_PRINTF_DISABLE_FLOAT)
  list(APPEND printf_copts "-DLIBC_COPT_PRINTF_DISABLE_FLOAT")
endif()
if(LIBC_CONF_PRINTF_DISABLE_INDEX_MODE)
  list(APPEND printf_copts "-DLIBC_COPT_PRINTF_DISABLE_INDEX_MODE")
endif()
if(LIBC_CONF_PRINTF_DISABLE_WRITE_INT)
  list(APPEND printf_copts "-DLIBC_COPT_PRINTF_DISABLE_WRITE_INT")
endif()
if(LIBC_CONF_PRINTF_FLOAT_TO_STR_USE_MEGA_LONG_DOUBLE_TABLE)
  list(APPEND printf_copts "-DLIBC_COPT_FLOAT_TO_STR_USE_MEGA_LONG_DOUBLE_TABLE")
endif()

if(LLVM_LIBC_FULL_BUILD)
  list(APPEND printf_deps
      libc.src.__support.File.file
      libc.src.__support.File.platform_file
      libc.src.__support.File.platform_stdout
  )
else()
  list(APPEND printf_copts "-DLIBC_COPT_STDIO_USE_SYSTEM_FILE")
endif()

add_entrypoint_object(
  printf
  SRCS
    printf.cpp
  HDRS
    printf.h
  DEPENDS
    ${printf_deps}
  COMPILE_OPTIONS
    ${printf_copts}
)

add_entrypoint_object(
  fprintf
  SRCS
    fprintf.cpp
  HDRS
    fprintf.h
  DEPENDS
    libc.src.__support.arg_list
    libc.src.stdio.printf_core.vfprintf_internal
  COMPILE_OPTIONS
    ${printf_copts}
)

add_entrypoint_object(
  vsprintf
  SRCS
    vsprintf.cpp
  HDRS
    vsprintf.h
  DEPENDS
    libc.src.stdio.printf_core.printf_main
    libc.src.stdio.printf_core.writer
)

add_entrypoint_object(
  vsnprintf
  SRCS
    vsnprintf.cpp
  HDRS
    vsnprintf.h
  DEPENDS
    libc.src.stdio.printf_core.printf_main
    libc.src.stdio.printf_core.writer
)

add_entrypoint_object(
  vprintf
  SRCS
    vprintf.cpp
  HDRS
    vprintf.h
  DEPENDS
    ${printf_deps}
  COMPILE_OPTIONS
    ${printf_copts}
)

add_entrypoint_object(
  vfprintf
  SRCS
    vfprintf.cpp
  HDRS
    vfprintf.h
  DEPENDS
    libc.src.__support.arg_list
    libc.src.stdio.printf_core.vfprintf_internal
  COMPILE_OPTIONS
    ${printf_copts}
)

add_subdirectory(printf_core)
add_subdirectory(scanf_core)

add_entrypoint_object(
  ftell
  SRCS
    ftell.cpp
  HDRS
    ftell.h
  DEPENDS
    libc.src.errno.errno
    libc.include.stdio
    libc.src.__support.File.file
    libc.src.__support.File.platform_file
)

add_entrypoint_object(
  remove
  ALIAS
  DEPENDS
    .${LIBC_TARGET_OS}.remove
)

# These entrypoints have multiple potential implementations.
add_stdio_entrypoint_object(feof)
add_stdio_entrypoint_object(feof_unlocked)
add_stdio_entrypoint_object(ferror)
add_stdio_entrypoint_object(ferror_unlocked)
add_stdio_entrypoint_object(clearerr)
add_stdio_entrypoint_object(clearerr_unlocked)
add_stdio_entrypoint_object(fopen)
add_stdio_entrypoint_object(fclose)
add_stdio_entrypoint_object(fread_unlocked)
add_stdio_entrypoint_object(fread)
add_stdio_entrypoint_object(puts)
add_stdio_entrypoint_object(fputs)
add_stdio_entrypoint_object(fwrite_unlocked)
add_stdio_entrypoint_object(fwrite)
add_stdio_entrypoint_object(fputc)
add_stdio_entrypoint_object(putc)
add_stdio_entrypoint_object(putchar)
add_stdio_entrypoint_object(fgetc)
add_stdio_entrypoint_object(fgetc_unlocked)
add_stdio_entrypoint_object(getc)
add_stdio_entrypoint_object(getc_unlocked)
add_stdio_entrypoint_object(getchar)
add_stdio_entrypoint_object(getchar_unlocked)
add_stdio_entrypoint_object(fgets)
add_stdio_entrypoint_object(stdin)
add_stdio_entrypoint_object(stdout)
add_stdio_entrypoint_object(stderr)
