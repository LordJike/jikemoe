#!/bin/sh

# Check environment variable to decide which config to use
if [ "$ENABLE_SSL" = "true" ]; then
    cp /etc/nginx/nginx.sslon /etc/nginx/nginx.conf
else
    cp /etc/nginx/nginx.ssloff /etc/nginx/nginx.conf
fi

# Start Nginx
exec nginx -g "daemon off;"
