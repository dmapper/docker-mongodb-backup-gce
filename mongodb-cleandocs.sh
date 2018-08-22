#!/bin/bash

source ./send-notification.sh

# Settings
DB_HOST="$MONGO_HOST"
DB_NAME="$MONGO_DATABASE"
DB_USER="$MONGO_USER"

mongo "$DB_HOST"/"$DB_NAME" -u "$DB_USER" mongo-commands.js || send_notification IDG Docs Cleaning Failed.

exit