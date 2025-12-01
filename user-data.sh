#!/bin/bash
set -e

# ----------------------------------------
# ADD 2GB SWAP (Fixes memory issues for Strapi)
# ----------------------------------------
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# ----------------------------------------
# UPDATE & INSTALL NODE + GIT
# ----------------------------------------
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y nodejs git

# ----------------------------------------
# INSTALL YARN
# ----------------------------------------
sudo npm install -g yarn

# ----------------------------------------
# CREATE NEW FOLDER
# ----------------------------------------
cd /home/ubuntu
mkdir -p strapi-terraform-deployment
cd strapi-terraform-deployment

# ----------------------------------------
# CREATE STRAPI PROJECT (Strapi v5)
# ----------------------------------------
npx --yes create-strapi-app@latest my-strapi --quickstart --no-run
cd my-strapi

# ----------------------------------------
# INSTALL DEPENDENCIES
# ----------------------------------------
yarn install

# ----------------------------------------
# BUILD ADMIN PANEL
# ----------------------------------------
yarn build

# ----------------------------------------
# SETUP LOG DIRECTORY
# ----------------------------------------
mkdir -p logs
touch logs/strapi.log

# ----------------------------------------
# RUN STRAPI IN BACKGROUND
# ----------------------------------------
nohup yarn start > logs/strapi.log 2>&1 &

echo "----------------------------------------"
echo "Strapi is running in the background on port 1337"
echo "Logs available at: $(pwd)/logs/strapi.log"
echo "To follow logs: tail -f logs/strapi.log"
echo "----------------------------------------"