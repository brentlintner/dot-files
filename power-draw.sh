#!/usr/bin/env zsh
bat=/sys/class/power_supply/BAT0
echo "`cat $bat/current_now ` * `cat $bat/voltage_now` / 1000000000000" | bc
