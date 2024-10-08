#!/bin/bash
CONF=~/.config/sucklessrandr.conf
if [ ! -f $CONF ]; then
  echo "No configuration found in $CONF please add some."
  touch $CONF

  echo "# Each line of the config file contains a "profile". It starts" >> $CONF
  echo "# with all the connected xrandr outputs concatenated. Like in case" >> $CONF
  echo "# of two outputs DP-1 and DP-2:  DP-1DP-2" >> $CONF
  echo "#" >> $CONF
  echo "# Following with | and the xrandr command used for this profile like so:" >> $CONF
  echo "#" >> $CONF
  echo "# DP-0.8DP-0.1.1|xrandr --output DP-0.8 --auto --output DP-0.1.1 --auto --right-of DP-0.8 --rotate right" >> $CONF
  echo "# DP-0.8|xrandr --output DP-0.8 --auto --output DP-0.1.1 --off" >> $CONF
  echo "#" >> $CONF
  echo "# You can also create a fallback profile by adding an xrandr command as a last line of the file:" >> $CONF
  echo "# xrandr --output eDP-1 --auto" >> $CONF
  exit 1
fi

while :
do
  outputs=`xrandr | grep " connected"|cut -d" " -f1 |  awk '{print}' ORS=''|tail -1`
  xrandr_command=`awk "/^$outputs\|/ {print}" $CONF|cut -d\| -f2`

  if [[ -z "$xrandr_command" ]]; then
    xrandr_command=`cat $CONF|tail -1`
  fi

  $xrandr_command
  sleep 2
done
