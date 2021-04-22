#!/usr/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir="/home/alvaropr/workarea/gnuradio/gr-fft/python/fft"
export GR_CONF_CONTROLPORT_ON=False
export PATH="/home/alvaropr/workarea/gnuradio/gr-TFMv3/gr-fft/python/fft":"$PATH"
export LD_LIBRARY_PATH="":$LD_LIBRARY_PATH
export PYTHONPATH=/home/alvaropr/workarea/gnuradio/gr-TFMv3/gnuradio-runtime/python:$PYTHONPATH
/usr/bin/python3 -B /home/alvaropr/workarea/gnuradio/gr-fft/python/fft/qa_window.py 
