# Use the official Nginx base image
FROM nginx:latest
# Make script executable
RUN chmod +x /etc/nginx/preconfs/getnginxconf.sh
# Expose ports (optional, ports are mapped in Docker Compose)
EXPOSE 80
EXPOSE 443
# Run Script
ENTRYPOINT ["/etc/nginx/preconfs/getnginxconf.sh"]