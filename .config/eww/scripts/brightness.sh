#!/bin/bash

# Function to set brightness
set_brightness() {
    local max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    local requested_brightness=$((($1 * max_brightness) / 100))

    if [ "$requested_brightness" -gt 0 ] && [ "$requested_brightness" -le "$max_brightness" ]; then
        tee /sys/class/backlight/intel_backlight/brightness <<< "$requested_brightness" > /dev/null
    fi
}

# Function to get current brightness
get_brightness() {
    local max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    local current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
    local percentage=$((($current_brightness * 100) / $max_brightness))
    echo "$percentage"
    exit
}

get_icon() {
    local current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
    local max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    local percentage=$((($current_brightness * 100) / $max_brightness))

    if [ $percentage -le 10 ]; then
        echo "" # Unicode character for low brightness
    elif [ $percentage -le 20 ]; then
        echo ""
    elif [ $percentage -le 30 ]; then
        echo ""
    elif [ $percentage -le 40 ]; then
        echo ""
    elif [ $percentage -le 50 ]; then
        echo ""
    elif [ $percentage -le 60 ]; then
        echo ""
    elif [ $percentage -le 70 ]; then
        echo ""
    elif [ $percentage -le 80 ]; then
        echo ""
    else
        echo "" # Unicode character for high brightness
    fi
}

# Check if arguments are provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <set/get> <value>"
    exit 1
fi

# Check for set or get and perform the appropriate action
if [ "$1" == "set" ]; then
    if [ -z "$2" ]; then
        echo "Please provide a value to set the brightness"
        exit 1
    fi
    set_brightness "$2"
elif [ "$1" == "get" ]; then
    get_brightness
elif [ "$1" == "get_icon" ]; then
    get_icon # Get icon based on current brightness
else
    echo "Invalid argument. Usage: $0 <set/get> <value>"
    exit 1
fi
