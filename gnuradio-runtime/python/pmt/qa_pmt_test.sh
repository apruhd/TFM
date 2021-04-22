#!/usr/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir="/home/alvaropr/workarea/gnuradio/gnuradio-runtime/python/pmt"
export GR_CONF_CONTROLPORT_ON=False
export PATH="/home/alvaropr/workarea/gnuradio/gr-TFMv3/gnuradio-runtime/python/pmt":"$PATH"
export LD_LIBRARY_PATH="":$LD_LIBRARY_PATH
export PYTHONPATH=/home/alvaropr/workarea/gnuradio/gr-TFMv3/gnuradio-runtime/python:$PYTHONPATH
/usr/bin/python3 -B /home/alvaropr/workarea/gnuradio/gnuradio-runtime/python/pmt/qa_pmt.py 
