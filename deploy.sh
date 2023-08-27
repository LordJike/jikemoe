#!/bin/bash
set -e

echo "Switching to main branch..."
git checkout main

echo "Pulling latest changes..."
git pull origin main

while true; do
    read -p "Do you wish to rebuild and restart the containers? (y/n) " yn
    case $yn in
        [Yy]* ) 
            docker-compose down
            docker-compose build
            while true; do
                read -p "Is this being deployed in the development server? (y/n) " dev_yn
                case $dev_yn in
                    [Yy]* )
                        export NGINX_HTTP=5001
                        export NGINX_HTTPS=5002
                        export NGINX_SSL=false
                        break;;
                    [Nn]* )
                        export NGINX_HTTP=80
                        export NGINX_HTTPS=443
                        export NGINX_SSL=true
                        break;;
                    * ) echo "Please answer y or n.";;
                esac
            done
            read -sp "Enter the MariaDB password: " db_password
            export MARIADB_PASSWORD=$db_password
            echo  # Newline for better formatting
            docker-compose up -d
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y or n.";;
    esac
done

while true; do
    read -p "Do you wish to set up a ping cronjob to keep the app warm? (y/n) " cron_yn
    case $cron_yn in
        [Yy]* )
            if ! (crontab -l 2>/dev/null | grep -q "curl http://jike.moe/healthz"); then
                (crontab -l 2>/dev/null ; echo "* * * * * /usr/bin/curl http://jike.moe/healthz") | crontab -
                echo "Cronjob set up successfully!"
            else
                echo "Cronjob already exists."
            fi
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y or n.";;
    esac
done
