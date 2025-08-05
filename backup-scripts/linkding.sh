#!/bin/bash

DATE=$(date +%d-%m-%Y)
CONTAINER=linkding
BACKUP_FILE=backup-$DATE.zip
BACKUP_DIR=~/backups/linkding

# create backups directory if it does not exist
mkdir -p $BACKUP_DIR

# create full backup file
docker exec -it $CONTAINER python manage.py full_backup /etc/linkding/data/$BACKUP_FILE

# copy the backup file to the backup directory
docker cp $CONTAINER:/etc/linkding/data/$BACKUP_FILE $BACKUP_DIR/$BACKUP_FILE


# Delete files that are older than 30 days from backup folder
find $BACKUP_DIR/* -mtime +30 -exec rm {} \;

# Delete files older than 30 days from container
docker exec -it linkding find /etc/linkding/data/ -name "backup*" -mtime +30 -exec rm {} \;
