#!/bin/sh

# Check if certificate files exist
if [ ! -f "/etc/letsencrypt/live/jikece.moe/fullchain.pem" ]; then
   # Obtain the certificates using Certbot
        certbot certonly --webroot -w /var/www/certbot -d jikece.moe -m lordjike@gmail.com --agree-tos
        fi

        # Start the renewal loop
        trap exit TERM
        while :; do 
            certbot renew
                sleep 12h & wait $!
                done
