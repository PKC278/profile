 #!/bin/bash

myproxy="socks5://user:364720@nas.pkcpersonal.cn:5720"

echo -e "curl and git's proxy will set to \033[1m$myproxy\033[0m"

#set proxy for current user's curl
echo "proxy=\"$myproxy\"" > $HOME/.curlrc
#set proxy for root's curl
echo "proxy=\"$myproxy\"" > /root/.curlrc

set proxy for git
git config --global http.proxy $myproxy
