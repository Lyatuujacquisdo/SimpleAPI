#!/bin/bash

LOG_FILE="/var/log/update.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
API_DIR="/var/www/SimpleAPI"

echo "$TIMESTAMP - Starting update..." >> $LOG_FILE

sudo apt update && sudo apt upgrade -y >> $LOG_FILE 2>&1

cd $API_DIR
if git pull origin main >> $LOG_FILE 2>&1; then
  echo "$TIMESTAMP - Git pull successful." >> $LOG_FILE
  sudo systemctl restart apache2
  echo "$TIMESTAMP - Apache restarted." >> $LOG_FILE
else
  echo "$TIMESTAMP - Git pull failed. Update aborted." >> $LOG_FILE
  exit 1
fi
