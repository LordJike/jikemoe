# Use the official Nginx base image
FROM nginx:latest
# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf
# Expose ports (optional, ports are mapped in Docker Compose)
EXPOSE 80
EXPOSE 443
# Start Nginx
CMD ["nginx", "-g", "daemon off;"]