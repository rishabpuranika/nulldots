#!/bin/bash

BATTERY_PATH="/sys/class/power_supply/BAT1"

if [[ ! -d "$BATTERY_PATH" ]]; then
    echo "No battery found"
    exit 1
fi

CAPACITY=$(cat "$BATTERY_PATH/capacity")
STATUS=$(cat "$BATTERY_PATH/status")

if [[ "$STATUS" == "Charging" ]]; then
    echo " $CAPACITY%"
elif [[ "$STATUS" == "Discharging" ]]; then
    echo " $CAPACITY%"
else
    echo "󰂄$CAPACITY%"
fi
