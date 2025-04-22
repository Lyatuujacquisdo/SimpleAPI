#!/bin/bash

BACKUP_DIR="/home/ubuntu/backups"
LOG_FILE="/var/log/backup.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
DATE=$(date +%F)

mkdir -p $BACKUP_DIR

# Backup project
tar -czf $BACKUP_DIR/api_backup_$DATE.tar.gz /var/www/SimpleAPI 2>> $LOG_FILE

# Backup database
mysqldump -u root -p'StrongPassword123' student_api > $BACKUP_DIR/db_backup_$DATE.sql 2>> $LOG_FILE

# Delete old backups
find $BACKUP_DIR/* -mtime +7 -exec rm {} \;

echo "$TIMESTAMP - Backup completed." >> $LOG_FILE
