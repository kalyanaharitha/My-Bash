#!/bin/bash

SERVICE="nginx"
if ! systemctl is-active --quiet $SERVICE; then
  echo "$SERVICE is down. Restarting..."
  systemctl restart $SERVICE
  echo "$SERVICE restarted at $(date)" >> /var/log/service-monitor.log
fi
