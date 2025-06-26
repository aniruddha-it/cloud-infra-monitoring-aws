#!/bin/bash

# Set variables
DATE=$(date +%F)
FILE_NAME="logs-backup-$DATE.tar.gz"
LOG_PATH="/var/log"
S3_BUCKET="s3://s3-log-backup"

# Create backup
tar -czf /tmp/$FILE_NAME $LOG_PATH

# Upload to S3
aws s3 cp /tmp/$FILE_NAME $S3_BUCKET

# Delete local backup
rm /tmp/$FILE_NAME


