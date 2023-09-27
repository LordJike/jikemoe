# Use the official Nginx base image
FROM nginx:latest
# Make folder
RUN mkdir /etc/nginx/preconfs
# Copy files
COPY getnginxconf.sh /etc/nginx/preconfs/getnginxconf.sh
COPY nginx.ssloff /etc/nginx/preconfs/nginx.ssloff
COPY nginx.sslon /etc/nginx/preconfs/nginx.sslon
# Make script executable
RUN chmod +x /etc/nginx/preconfs/getnginxconf.sh
# Expose ports (optional, ports are mapped in Docker Compose)
EXPOSE 80
EXPOSE 443
# Run Script
ENTRYPOINT ["/etc/nginx/preconfs/getnginxconf.sh"]