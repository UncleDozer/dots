#!/bin/sh
#
# home/scripts/steamfix.sh
#
# Removes default steam libraries after update

find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete
