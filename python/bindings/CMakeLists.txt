# Copyright 2020 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

########################################################################
# Check if there is C++ code at all
########################################################################
if(NOT TFMv3_sources)
    MESSAGE(STATUS "No C++ sources... skipping python bindings")
    return()
endif(NOT TFMv3_sources)

########################################################################
# Check for pygccxml
########################################################################
GR_PYTHON_CHECK_MODULE_RAW(
    "pygccxml"
    "import pygccxml"
    PYGCCXML_FOUND
    )

include(GrPybind)

########################################################################
# Python Bindings
########################################################################
list(APPEND TFMv3_python_files
    header_format_counter_dif_python.cc
    python_bindings.cc)

GR_PYBIND_MAKE_OOT(TFMv3 
   ../..
   gr::TFMv3
   "${TFMv3_python_files}")

install(TARGETS TFMv3_python DESTINATION ${GR_PYTHON_DIR}/TFMv3 COMPONENT pythonapi)
