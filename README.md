# My Automation Scripts
This repository contains useful **automation scripts** that help streamline and automate **repetitive system administration tasks**.

## 🔧 Key Features

- Automates log cleanup to manage disk usage
- Monitors disk space and triggers alerts
- Restarts crashed services automatically
- Scripts are written in **Bash** and designed for **Linux environments**

---

## Script 1: Log Cleanup & Archiving

**Description:**  
Compresses `.log` files older than 7 days from `/var/log/myapp/` and moves them to an archive directory.

```bash
#!/bin/bash

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"

mkdir -p "$ARCHIVE_DIR"
find "$LOG_DIR" -name "*.log" -mtime +7 -exec gzip {} \; -exec mv {}.gz "$ARCHIVE_DIR" \;
#!/bin/bash


## Script 2: Disk Usage Alert (Runs via Cron every 15 min)
THRESHOLD=80
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $6 }' | while read output; do
  usage=$(echo $output | awk '{ print $1}' | sed 's/%//')
  mount=$(echo $output | awk '{ print $2 }')
  if [ $usage -ge $THRESHOLD ]; then
    echo "Disk space critical: $mount at ${usage}%"
    # Optional: send to Slack or email
  fi
done
