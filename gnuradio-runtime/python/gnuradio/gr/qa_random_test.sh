#!/usr/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir="/home/alvaropr/workarea/gnuradio/gnuradio-runtime/python/gnuradio/gr"
export GR_CONF_CONTROLPORT_ON=False
export PATH="/home/alvaropr/workarea/gnuradio/gr-TFMv3/gnuradio-runtime/python/gnuradio/gr":"$PATH"
export LD_LIBRARY_PATH="":$LD_LIBRARY_PATH
export PYTHONPATH=/home/alvaropr/workarea/gnuradio/gr-TFMv3/gruel/src/python:/home/alvaropr/workarea/gnuradio/gr-TFMv3/gnuradio-runtime/python:$PYTHONPATH
/usr/bin/python3 -B /home/alvaropr/workarea/gnuradio/gnuradio-runtime/python/gnuradio/gr/qa_random.py 
