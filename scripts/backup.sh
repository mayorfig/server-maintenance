#1/bin/bash

#Paths
SOURCE="../data"
BACKUPS="../backups"
REMOTE="../remote_backups"

#Create folders if they don't exist
mkdir -p $BACKUPS
mkdir -p $REMOTE

#======================================
#Timestamp
#======================================
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

#======================================
#Backup filename
#======================================
BACKUP_FILE="backups_$TIMESTAMP.tar.gz"

#======================================
#Compress Directory
#======================================
tar -czf "$BACKUPS/$BACKUP_FILE" "$SOURCE"

echo "Backup created: $BACKUP_FILE"

#=====================================
#Simulate remote backup
#=====================================
cp "$BACKUPS/$BACKUP_FILE" "$REMOTE"

echo "Remote backup created: $BACKUP_FILE"