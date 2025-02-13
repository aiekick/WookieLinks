set(GLAD_SOURCE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/glad)

set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(LLVM_USE_CRT_DEBUG MTd CACHE STRING "" FORCE)
set(LLVM_USE_CRT_MINSIZEREL MT CACHE STRING "" FORCE)
set(LLVM_USE_CRT_RELEASE MT CACHE STRING "" FORCE)
set(LLVM_USE_CRT_RELWITHDEBINFO MT CACHE STRING "" FORCE)

if(NOT CMAKE_DEBUG_POSTFIX)
  set(CMAKE_DEBUG_POSTFIX _debug)
endif()
if(NOT CMAKE_RELEASE_POSTFIX)
  set(CMAKE_RELEASE_POSTFIX)
endif()
if(NOT CMAKE_MINSIZEREL_POSTFIX)
  set(CMAKE_MINSIZEREL_POSTFIX _minsizerel)
endif()
if(NOT CMAKE_RELWITHDEBINFO_POSTFIX)
  set(CMAKE_RELWITHDEBINFO_POSTFIX _reldeb)
endif()

set(USE_MSVC_RUNTIME_LIBRARY_DLL OFF CACHE BOOL "" FORCE)
add_library(glad STATIC
	${GLAD_SOURCE_DIR}/src/glad.c
	${GLAD_SOURCE_DIR}/include/glad/glad.h
)

set_target_properties(glad PROPERTIES FOLDER 3rdparty/Static)

set_target_properties(glad PROPERTIES LINKER_LANGUAGE C)

set_target_properties(glad PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${FINAL_BIN_DIR}")
set_target_properties(glad PROPERTIES RUNTIME_OUTPUT_DIRECTORY_DEBUG "${FINAL_BIN_DIR}")
set_target_properties(glad PROPERTIES RUNTIME_OUTPUT_DIRECTORY_RELEASE "${FINAL_BIN_DIR}")
set_target_properties(glad PROPERTIES RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL "${FINAL_BIN_DIR}")
set_target_properties(glad PROPERTIES RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO "${FINAL_BIN_DIR}")

set(GLAD_INCLUDE_DIR ${GLAD_SOURCE_DIR}/include)
set(GLAD_LIBRARIES glad)

if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
	target_compile_options(glad PRIVATE -Wno-everything) # disable all warnings, since im not maintaining this lib
endif()

install(TARGETS glad RUNTIME DESTINATION / COMPONENT APP_LIBS_GLAD)

include_directories(${GLAD_INCLUDE_DIR})

if(NOT WIN32)
	set(GLAD_LIBRARIES ${GLAD_LIBRARIES} dl)
endif()
