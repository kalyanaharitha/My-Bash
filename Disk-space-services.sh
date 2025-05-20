# System Automation Scripts

This repository contains automation scripts designed to improve system reliability and reduce manual intervention. These scripts help monitor system health and automatically respond to critical conditions.

## Automation: Disk Usage Alert (Runs via Cron every 15 minutes)

These scripts include a **disk usage alert** mechanism that runs every 15 minutes via `cron` to monitor and notify when disk usage exceeds a defined threshold.

bash
CopyEdit
#!/bin/bash
THRESHOLD=80
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $6 }' | while read output; do
  usage=$(echo $output | awk '{ print $1}' | sed 's/%//')
  mount=$(echo $output | awk '{ print $2 }')
  if [ $usage -ge $THRESHOLD ]; then
    echo "Disk space critical: $mount at ${usage}%"
    # Optional: send to Slack or email
  fi
