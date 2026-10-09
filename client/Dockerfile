FROM nginx:alpine

# Copy the pre-compiled static files from the build context directory into Nginx
COPY dist/ /usr/share/nginx/html

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# Start Nginx in the foreground so the container stays active
CMD ["nginx", "-g", "daemon off;"]


