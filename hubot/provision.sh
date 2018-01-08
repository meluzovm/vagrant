#!/bin/bash
ln -s /usr/bin/nodejs /usr/bin/node

dpkg -s npm &>/dev/null || {
apt-get -y update
apt-get -y install nodejs npm
}

command hubot -v &>/dev/null || {
npm install -g hubot coffee-script
}
