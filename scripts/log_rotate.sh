#!/bin/bash

#Paths
LOG_DIR="../logs"
ARCHIVE_DIR="../logs/archive"

# Create archive folder if not exists
mkdir -p $ARCHIVE_DIR

echo "Starting log rotation..."

# 1. Move logs older than 1 day to archive
find $LOG_DIR -type f -mtime +1 -exec mv {} $ARCHIVE_DIR \;

# 2. Compress all files in archive (that are not already compressed)
find $ARCHIVE_DIR -type f -not -name "*.gz" -exec gzip {} \;

# 3. Delete compressed logs older than 7 days
find $ARCHIVE_DIR -type f -name "*.gz" -mtime +7 -exec rm {} \;

echo "Log rotation finished."