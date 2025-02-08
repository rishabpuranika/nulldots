#!/bin/bash

# Get current username
USER=$(whoami)

# Get hostname
HOSTNAME=$(hostname)

# Get system uptime
UPTIME=$(uptime -p | sed 's/up //')

# Optional: Get login session type (Wayland/X11)
SESSION_TYPE=$(echo "$XDG_SESSION_TYPE")

# Format the output
echo "$USER @ $HOSTNAME | $SESSION_TYPE | Uptime: $UPTIME"
