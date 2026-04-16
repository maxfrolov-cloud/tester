#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget unzip curl gnupg

# Lisa Google key
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Lisa repo
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google.list

sudo apt-get update
sudo apt-get install -y google-chrome-stable

# Chromedriver
CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+')
DRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION")

wget -q "https://chromedriver.storage.googleapis.com/$DRIVER_VERSION/chromedriver_linux64.zip"
unzip chromedriver_linux64.zip

sudo mv chromedriver /usr/local/bin/
sudo chmod +x /usr/local/bin/chromedriver