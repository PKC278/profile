#!/bin/sh

if test -e /home/deck/homebrew/plugins/tomoon; then
    echo "tomoon exists"
    sudo rm -r /home/deck/homebrew/plugins/tomoon
fi

if test -e /tmp/tomoon.zip; then
    sudo rm /tmp/tomoon.zip
fi

echo "Downloading Tomoon..."

# 发送GET请求到GitHub API，获取最新发布版本的JSON响应
response=$(curl -s https://api.github.com/repos/YukiCoco/ToMoon/releases/latest)

# 从JSON响应中提取版本号字段的值
latest_version=$(echo "$response" | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4)

# Construct the zip file URL
zip_url="https://github.com/YukiCoco/ToMoon/releases/download/$latest_version/tomoon-$latest_version.zip"

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
