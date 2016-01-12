#!/bin/bash -eu

npm install
npm install -g phantomjs

node ./node_modules/protractor/bin/webdriver-manager update

echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4
sudo apt-get install google-chrome-stable
sudo apt-get install xvfb gtk2-engines-pixbuf
sudo apt-get install xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable
sudo apt-get install imagemagick x11-apps
Xvfb -ac :99 -screen 0 1280x1024x16 &
disown $1
export DISPLAY=:99
