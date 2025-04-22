#!/bin/bash

LOG_FILE="/var/log/health_check.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEMORY=$(free -m | awk '/Mem:/ {print $3 "/" $2 "MB"}')
DISK=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

WEB_SERVER_STATUS=$(systemctl is-active apache2)
STUDENTS_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://16.16.213.103/api/students)
SUBJECTS_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://16.16.213.103/api/subjects)

echo "$TIMESTAMP - CPU: $CPU% | Memory: $MEMORY | Disk: $DISK% | Apache: $WEB_SERVER_STATUS | /students: $STUDENTS_STATUS | /subjects: $SUBJECTS_STATUS" >> $LOG_FILE

if [ "$DISK" -gt 90 ] || [ "$WEB_SERVER_STATUS" != "active" ] || [ "$STUDENTS_STATUS" -ne 200 ] || [ "$SUBJECTS_STATUS" -ne 200 ]; then
  echo "$TIMESTAMP - WARNING: Resource or API issue detected!" >> $LOG_FILE
fi
