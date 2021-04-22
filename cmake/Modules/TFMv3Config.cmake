if(NOT PKG_CONFIG_FOUND)
    INCLUDE(FindPkgConfig)
endif()
PKG_CHECK_MODULES(PC_TFMV3 TFMv3)

FIND_PATH(
    TFMV3_INCLUDE_DIRS
    NAMES TFMv3/api.h
    HINTS $ENV{TFMV3_DIR}/include
        ${PC_TFMV3_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    TFMV3_LIBRARIES
    NAMES gnuradio-TFMv3
    HINTS $ENV{TFMV3_DIR}/lib
        ${PC_TFMV3_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/TFMv3Target.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(TFMV3 DEFAULT_MSG TFMV3_LIBRARIES TFMV3_INCLUDE_DIRS)
MARK_AS_ADVANCED(TFMV3_LIBRARIES TFMV3_INCLUDE_DIRS)
