#!/bin/bash

LOG_FILE="../logs/app.log"

echo "-----Log Analysis-----" 

#================================
#Total Errors
#================================

TOTAL_ERROR=$(grep -c ERROR "$LOG_FILE") 
echo "Total Errors:"
echo "$TOTAL_ERROR"
echo ""

#===============================
#Unique IPs
#===============================
UNIQUE_IP=$(awk '{print $1}' "$LOG_FILE" | sort | uniq )
echo "Unique IPs:"
echo "$UNIQUE_IP"
echo ""

#==============================
#Top 3 IPs causing Error
#==============================
TOP3_IP=$(grep -c ERROR "$LOG_FILE" | awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -3)
echo "Top 3 IPs causing Error:"
echo "$TOP3_IP"
echo ""

