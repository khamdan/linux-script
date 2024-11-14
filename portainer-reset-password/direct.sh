#!/bin/bash
# This script allows the user to reset their CasaOS username and password.

echo "Portainer password reset v1.0 by Khamdan"

#stop portainer first
docker container stop portainer

#run reset password
docker run --rm -v portainer_data:/data portainer/helper-reset-password

#start portainer
docker container start portainer

# Print a success message to the user
echo "Commands executed successfully. Visit Portainer UI again and the welcome screen should present to setup new user."
