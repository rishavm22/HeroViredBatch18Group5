#!/bin/bash
CURRENT_USER=$(whoami)
CURRENT_DIR=$(pwd)
DISK_USAGE=$(df -h | awk 'NR>1 {gsub("%","",$5); sum += $5} END {print sum}')
MEMORY_INFO=$(free | awk '/Mem:/ {printf "%d", $3/$2 * 100}')
PROCESS_COUNT=$(ps -e | wc -l)

#Display collected information
echo "===== Linux Server Health Report ====="
echo "Current User      : $CURRENT_USER"
echo "Current Directory : $CURRENT_DIR"
echo "Disk Usage        : $DISK_USAGE"
echo "Memory Usage      : $MEMORY_INFO"
echo "Running Processes : $PROCESS_COUNT"

read -p "Maximum acceptable disk usage percentage: " MAX_DISK_USAGE
read -p "Maximum acceptable memory usage percentage: " MAX_MEM_USAGE

if [[ $DISK_USAGE -ge MAX_DISK_USAGE || $MEMORY_INFO -ge MAX_MEM_USAGE ]]; then
        echo "SERVER STATUS: ATTENTION REQUIRED"
else
        echo "SERVER STATUS: HEALTHY"
fi