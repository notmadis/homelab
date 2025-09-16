#!/bin/bash

cat << 'EOF'
 __                                  ___             __        
/\ \                                /\_ \           /\ \       
\ \ \___     ___     ___ ___      __\//\ \      __  \ \ \____  
 \ \  _ `\  / __`\ /' __` __`\  /'__`\\ \ \   /'__`\ \ \ '__`\ 
  \ \ \ \ \/\ \L\ \/\ \/\ \/\ \/\  __/ \_\ \_/\ \L\.\_\ \ \L\ \
   \ \_\ \_\ \____/\ \_\ \_\ \_\ \____\/\____\ \__/.\_\\ \_,__/
    \/_/\/_/\/___/  \/_/\/_/\/_/\/____/\/____/\/__/\/_/ \/___/ 

EOF

# Create media folder

mkdir $HOME/data
mkdir $HOME/data/movies
mkdir $HOME/data/shows
mkdir $HOME/data/youtube



# Create backup folders
echo "Creating backup folders"
mkdir ~/backups
mkdir ~/backups/linkding

sudo apt update -y

sudo apt install -y cron

# Create backup cronjob
echo "Creating a cronjob"
# Specify the shell to use
SHELL=/bin/bash

# Make scripts executable
chmod +x ~/homelab/backup-scripts/linkding.sh

# Define the cron job
CRON_JOB="0 0 * * 1 $HOME/homelab/backup-scripts/linkding.sh"

# Add the cron job to the crontab
( crontab -l; echo "$CRON_JOB" ) | crontab -
