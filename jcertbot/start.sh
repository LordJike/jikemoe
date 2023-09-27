#!/bin/sh

# Check if certificate files exist
if [ ! -f "/etc/letsencrypt/live/jike.moe/fullchain.pem" ]; then
   echo "Certificate not found. Trying to obtain one..."
   certbot certonly --webroot -w /var/www/certbot -d *.jike.moe -m lordjike@gmail.com --agree-tos
   if [ $? -ne 0 ]; then
       echo "Error obtaining the certificate."
       exit 1
   fi
fi

# Start the renewal loop
trap exit TERM
while :; do 
    echo "Attempting certificate renewal..."
    certbot renew --no-random-sleep-on-renew
    if [ $? -ne 0 ]; then
        echo "Error during certificate renewal."
    else
        echo "Renewal check completed."
    fi
    sleep 12h & wait $!
done
