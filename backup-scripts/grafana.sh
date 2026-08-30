#!/bin/bash
set -euo pipefail

DATE=$(date +%d-%m-%Y)
BACKUP_DIR=~/backups/grafana

# create backups directory if it does not exist
mkdir -p $BACKUP_DIR

docker cp grafana:/var/lib/grafana/grafana.db "$BACKUP_DIR/grafana-$DATE.db"

# Delete backups older than 30 days
find "$BACKUP_DIR" -type f -mtime +30 -delete
