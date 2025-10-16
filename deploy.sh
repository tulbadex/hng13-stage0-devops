#!/bin/bash

# Simple deployment script for DevOps Stage 0
cd /tmp

# Clone or pull latest changes
if [ -d "hng13-stage0-devops" ]; then
    cd hng13-stage0-devops
    git pull origin main
else
    git clone https://github.com/tulbadex/hng13-stage0-devops.git
    cd hng13-stage0-devops
fi

# Copy HTML file to web root
sudo cp index.html /var/www/html/index.html

# Set proper permissions
sudo chown www-data:www-data /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html

# Reload NGINX
sudo systemctl reload nginx

echo "Deployment completed successfully!"