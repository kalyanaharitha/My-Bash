# Linux Automation Scripts

This repository contains a collection of **automation scripts** used for system maintenance and monitoring in Linux environments.

## 🔄 Auto-Restart Crashed Services

These automation scripts are designed to **auto-restart services** if they crash or are not running. This helps ensure high availability and reduces manual intervention.

### 🛠️ Script: Auto-Restart for `nginx`

The script below checks if the `nginx` service is active. If it is not, the script restarts the service and logs the action.

```bash
#!/bin/bash

SERVICE="nginx"
if ! systemctl is-active --quiet $SERVICE; then
  echo "$SERVICE is down. Restarting..."
  systemctl restart $SERVICE
  echo "$SERVICE restarted at $(date)" >> /var/log/service-monitor.log
fi
