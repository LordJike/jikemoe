#!/bin/bash
set -e

echo "Pulling latest changes..."
git pull origin main

read -p "Do you wish to rebuild and restart the containers? (y/n) " yn
case $yn in
    [Yy]* ) 
        docker-compose down
        docker-compose build
        docker-compose up -d
        ;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
esac

read -p "Do you wish to set up a ping cronjob to keep the app warm? (y/n) " cron_yn
case $cron_yn in
    [Yy]* )
        # Check if the cronjob already exists to avoid adding duplicates
        if ! crontab -l | grep -q "curl http://jike.moe/healthz"; then
            # Echo the new cron into the cron file
            (crontab -l ; echo "* * * * * /usr/bin/curl http://jike.moe/healthz") | crontab -
            echo "Cronjob set up successfully!"
        else
            echo "Cronjob already exists."
        fi
        ;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
esac

