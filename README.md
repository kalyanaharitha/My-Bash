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


