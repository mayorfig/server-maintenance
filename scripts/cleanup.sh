#!/bin/bash 

#Paths
LOGS="../logs"
BACKUPS="../backups"

echo "---- Cleanup started: ($date) ----"

#========================================
#Clean old logs (7 days)
#========================================
echo "Deleting logs olders than 7 days..."
find $LOGS -type f \( name "*.log" -o name "*.gz" \) mtime +7 -exec rm {} \;

#========================================
#Clean Backups files (14 days)
#========================================
echo "Deleting backups olders than 14 days..."
find $BACKUPS -type f -name "*.tar.gz"  mtime +14 -exec rm {} \;

echo "---- Cleanup finished ----"