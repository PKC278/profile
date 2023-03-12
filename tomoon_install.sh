#!/bin/sh

if test -e /home/deck/homebrew/plugins/tomoon; then
    echo "tomoon exists"
    sudo rm -r /home/deck/homebrew/plugins/tomoon
fi

if test -e /tmp/tomoon.zip; then
    sudo rm /tmp/tomoon.zip
fi

echo "Downloading Tomoon..."

# GitHub repository owner and name
owner=YukiCoco
repo=ToMoon

# Get the latest release tag
tag=$(curl -s "https://api.github.com/repos/$owner/$repo/releases/latest" | grep -oP '"tag_name": "\K(.*)(?=")')

# Construct the zip file URL
zip_url="https://github.com/$owner/$repo/releases/download/$tag/tomoon-$tag.zip"

# Download the zip file
curl -L -o /tmp/tomoon.zip "$zip_url"

if test -e /home/deck/homebrew/plugins; then
    sudo mkdir -p /home/deck/homebrew/plugins
fi
systemctl --user stop plugin_loader 2> /dev/null
sudo systemctl stop plugin_loader 2> /dev/null

sudo unzip -qq /tmp/tomoon.zip -d /home/deck/homebrew/plugins/
sudo rm /tmp/tomoon.zip
sudo chmod -R 777 /home/deck/homebrew/plugins/tomoon

sudo systemctl start plugin_loader
echo "Tomoon is installed."
