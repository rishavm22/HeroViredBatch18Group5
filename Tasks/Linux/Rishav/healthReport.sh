#!/bin/bash

LOGGED_USER=$(whoami)
CURRENT_DIRECTORY=$(pwd)
DISK_USED=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
MEM_USED=$(free | awk '/Mem:/ {printf "%d", $3/$2 * 100}')

read -p "Maximum acceptable disk usage percentage: " MAX_DISK_USAGE
read -p "Maximum acceptable memory usage percentage: " MAX_MEM_USAGE

if [[ $DISK_USED -ge $MAX_DISK_USAGE || $MEM_USED -ge MAX_MEM_USAGE ]]; then
        echo "SERVER STATUS: ATTENTION REQUIRED"
else
        echo "SERVER STATUS: HEALTHY"
fi

echo "Logged In User: $LOGGED_USER"