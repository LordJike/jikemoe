# Use the official Nginx base image
FROM nginx:latest
# Copy custom Nginx configuration files
COPY nginx.ssloff /etc/nginx/nginx.ssloff
COPY nginx.sslon /etc/nginx/nginx.sslon
COPY getngixconf.sh /etc/nginx/getngixconf.sh
# Make script executable
RUN chmod +x /etc/nginx/getngixconf.sh
# Expose ports (optional, ports are mapped in Docker Compose)
EXPOSE 80
EXPOSE 443
# Run Script
ENTRYPOINT ["/etc/nginx/getngixconf.sh"]