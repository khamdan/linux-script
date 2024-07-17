#!/bin/bash
# This script allows the user to reset their CasaOS username and password.

# Check if the casaos.service is active
if ! systemctl is-active --quiet docker.service; then
    echo "Docker service is not active. Exiting."
    exit 1
fi

echo "Portainer password reset v1.0 by Khamdan"
# Prompt user for confirmation
read -p "Do you want to reset your Portainer? (y/n): " response

#stop portainer first
docker container stop portainer

#run reset password
docker run --rm -v portainer_data:/data portainer/helper-reset-password

#start portainer
docker container start portainer

# Print a success message to the user
echo "Commands executed successfully. Visit Portainer UI again and the welcome screen should present to setup new user."
