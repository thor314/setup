#!/bin/bash


# update git config, keys, github permissions
./keys.sh

# install rust
./rust.sh

# clone
#./clone.sh

# settings
# allows hacky script to write brightness
 chmod a+rw /sys/class/backlight/intel_backlight/brightness
