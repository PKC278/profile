#!/bin/bash

myproxy="socks5://nas.pkcpersonal.cn:5720"

echo "proxy=\"$myproxy\"" > $HOME/.curlrc
echo "proxy=\"$myproxy\"" > /root/.curlrc

git config --global http.proxy $myproxy
