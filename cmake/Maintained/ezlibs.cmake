set(EZLIBS_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/ezlibs/include)

set(USE_EZ_LIBS_TESTING ${USE_BUILDING_OF_TESTS} CACHE BOOL "" FORCE)

set(TESTING_APP ON CACHE BOOL "" FORCE)
set(TESTING_COMPRESSION OFF CACHE BOOL "" FORCE)
set(TESTING_FILE ON CACHE BOOL "" FORCE)
set(TESTING_MATH ON CACHE BOOL "" FORCE)
set(TESTING_MISC ON CACHE BOOL "" FORCE)
set(TESTING_TIME ON CACHE BOOL "" FORCE)
set(TESTING_OPENGL OFF CACHE BOOL "" FORCE)

set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(LLVM_USE_CRT_DEBUG MTd CACHE STRING "" FORCE)
set(LLVM_USE_CRT_MINSIZEREL MT CACHE STRING "" FORCE)
set(LLVM_USE_CRT_RELEASE MT CACHE STRING "" FORCE)
set(LLVM_USE_CRT_RELWITHDEBINFO MT CACHE STRING "" FORCE)
set(USE_MSVC_RUNTIME_LIBRARY_DLL OFF CACHE BOOL "")

file(GLOB_RECURSE EZ_LIBS_SOURCES ${EZLIBS_INCLUDE_DIR}/ezlibs/*.hpp)
source_group(TREE ${EZLIBS_INCLUDE_DIR}/ezlibs PREFIX ezlibs FILES ${EZ_LIBS_SOURCES})

set(EZ_LIBS_SOURCES ${EZ_LIBS_SOURCES})

include_directories(${EZLIBS_INCLUDE_DIR})

add_subdirectory(${CMAKE_SOURCE_DIR}/3rdparty/ezlibs)
