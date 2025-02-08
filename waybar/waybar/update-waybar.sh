#!/bin/bash
wal -i "$1"
ln -sf ~/.cache/wal/colors.css ~/.config/waybar/colors.css
pkill waybar && waybar &
