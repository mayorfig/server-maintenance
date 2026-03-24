#!/bin/bash

LOG_FILE="../logs/system.log"

echo "-----($date)-----" >> $LOG_FILE

#=========================================
#CPU Usage
#=========================================
CPU_IDLE=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | cut -d% -f1 | cut -d. -f1)
CPU_USAGE=$((100 - $CPU_IDLE))

#=========================================
#Memory Usage
#=========================================
MEM_USAGE=$(top -l 1 | grep PhysMem | awk '{used=$2; free=$8; gsub("G","",used); gsub("M","",free); free=free/1024; total=used+free; printf("%.0f\n", used/total*100)}')

#=========================================
#Disk Usage
#=========================================
DISK_USAGE=$(df -h | tail -1 | awk '{print $5}' | cut -d% -f1 | cut -d. -f1)

#=========================================
#Alerts
#=========================================

if [ "$CPU_USAGE" -gt 80 ]; then
  echo "ALERT: High CPU usage: $CPU_USAGE%" | tee -a "$LOG_FILE"
fi

if [ "$MEM_USAGE" -gt 80 ]; then
  echo "ALERT: High memory usage: $MEM_USAGE%" | tee -a "$LOG_FILE"
fi

if [ "$DISK_USAGE" -gt 80 ]; then
  echo "ALERT: High disk usage: $DISK_USAGE%" | tee -a "$LOG_FILE"
fi

#=========================================
#LOG NORMAL STATS
#=========================================
echo "CPU Usage: $CPU_USAGE%" >> $LOG_FILE
echo "Memory Usage: $MEM_USAGE%" >> $LOG_FILE
echo "Disk Usage: $DISK_USAGE%" >> $LOG_FILE