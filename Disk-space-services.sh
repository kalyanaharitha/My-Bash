#!/bin/bash
THRESHOLD=80
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $6 }' | while read output; do
  usage=$(echo $output | awk '{ print $1}' | sed 's/%//')
  mount=$(echo $output | awk '{ print $2 }')
  if [ $usage -ge $THRESHOLD ]; then
    echo "Disk space critical: $mount at ${usage}%"
    # Optional: send to Slack or email
  fi
