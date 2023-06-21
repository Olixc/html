#!/bin/bash

echo "============================"

# Set Git configuration for the committer
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"

# Change directory to the Apache document root
cd /var/www/html/

# Add all files to the Git repository
git add -A

# Commit changes
git commit -m "Update"

# Push changes to the remote repository
git push --set-upstream origin main

echo "============================"

echo "Starting Apache server..."
# Start the Apache server in the foreground
apache2ctl -D FOREGROUND

