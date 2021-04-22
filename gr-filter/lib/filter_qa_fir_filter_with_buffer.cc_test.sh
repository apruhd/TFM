#!/usr/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir="/home/alvaropr/workarea/gnuradio/gr-filter/lib"
export GR_CONF_CONTROLPORT_ON=False
export PATH="/home/alvaropr/workarea/gnuradio/gr-TFMv3/gr-filter/lib":"$PATH"
export LD_LIBRARY_PATH="":$LD_LIBRARY_PATH
export PYTHONPATH=/home/alvaropr/workarea/gnuradio/gr-TFMv3/gnuradio-runtime/python:/home/alvaropr/workarea/gnuradio/gnuradio-runtime/python:$PYTHONPATH
filter_qa_fir_filter_with_buffer.cc 
