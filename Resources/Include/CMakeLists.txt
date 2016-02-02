cmake_minimum_required(VERSION 3.0)
project(sharedLibs)

# Export no symbols by default (if the compiler supports it).
# This makes e.g. GCC's "visibility behavior" consistent with MSVC's. 
# On Windows/MSVC this is a noop.
set(CMAKE_C_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -L/Applications/MATLAB/MATLAB_Runtime/v90/extern/include/ -I/Applications/MATLAB/MATLAB_Runtime/v90/extern/include/ -Wall")

# Always include the source and build directories in the include path.
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# create the executable
add_executable(main main.c)

# create the shared library
add_library(libwreactor SHARED libwreactor.c)

# generate export header automatically
include (GenerateExportHeader)
GENERATE_EXPORT_HEADER(libwreactor
             BASE_NAME libwreactor
             EXPORT_MACRO_NAME LIBWREACTOR_EXPORT
             EXPORT_FILE_NAME libwreactor_EXPORTS.h
             STATIC_DEFINE SHARED_EXPORTS_BUILT_AS_STATIC)

# link our executable "main" with the shared library "shared"
target_link_libraries(main libwreactor)
