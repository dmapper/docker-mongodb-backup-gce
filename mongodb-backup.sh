#!/bin/bash

source ./send-notification.sh

# Settings
PROJECT_ID="$PROJECT_ID"
RS_ID="$RS_ID"
DB_HOST="$MONGO_HOST"
DB4_HOST="$MONGO4_HOST"
DB_NAME="$MONGO_DATABASE"
DB_USER="$MONGO_USER"
DB_PASS="$MONGO_PASS"
BUCKET_NAME="$BUCKET"

# Path in which to create the backup (will get cleaned later)
BACKUP_PATH="/mnt/data/dump/"

CURRENT_DATE=$(date +"%Y%m%d-%H%M")

# Backup filename
BACKUP_FILENAME="$DB_NAME-$CURRENT_DATE.tar.gz"

# Create the backup
mongodump -h "$DB_HOST" -d "$DB_NAME" -u "$DB_USER" -p "$DB_PASS" -o "$BACKUP_PATH" || send_notification "DB Backup failed on $PROJECT_ID/$DB_NAME"
cd $BACKUP_PATH || exit

# Archive and compress
tar -cvzf "$BACKUP_PATH""$BACKUP_FILENAME" ./*

# Copy to Google Cloud Storage
echo "Copying $BACKUP_PATH$BACKUP_FILENAME to gs://$BUCKET_NAME/$DB_NAME/"
/root/gsutil/gsutil cp "$BACKUP_PATH""$BACKUP_FILENAME" gs://"$BUCKET_NAME"/"$DB_NAME"/ 2>&1
echo "Copying finished"
echo "Removing backup data"
rm -rf $BACKUP_PATH*

# Clean docs
echo "Cleaning docs"
mongo "$MONGO4_HOST/$MONGO_DATABASE?replicaSet=$RS_ID" -u "$DB_USER" /mongo-commands.js || send_notification "IDG Docs Cleaning Failed"
exit
