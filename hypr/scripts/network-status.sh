#!/bin/bash

# Check network connectivity
check_network() {
    # First, check if we have an active network interface
    if ! ip route get 1.1.1.1 &> /dev/null; then
        echo "❌ Offline"
        return 1
    fi

    # Check internet connectivity
    if ! ping -c 1 -W 1 1.1.1.1 &> /dev/null; then
        echo "⚠️ No Internet"
        return 1
    fi

    # Get network type and speed
    CONNECTION_TYPE=$(ip route | grep default | awk '{print $5}')
    
    # Check Wi-Fi or Ethernet
    if [[ "$CONNECTION_TYPE" == "wlan0" || "$CONNECTION_TYPE" == "wlp"* ]]; then
        SSID=$(iwconfig 2>/dev/null | grep 'ESSID:' | cut -d':' -f2 | sed 's/"//g')
        echo "📶 $SSID"
    elif [[ "$CONNECTION_TYPE" == "eth0" || "$CONNECTION_TYPE" == "enp"* ]]; then
        echo "🌐 Ethernet"
    else
        echo "🔗 Connected"
    fi
}

check_network
