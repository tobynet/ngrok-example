#!/usr/bin/env bash
set -o xtrace       # for debug output.  ( abbr. set -x )
set -o errexit      # for exit on error. ( abbr. set -e )
set -o pipefail     # errexit for pipe
set -o nounset      # exit when the script to use undeclared variables (abbr. set -u)

sudo apt-get -qyy update > /dev/null
sudo apt-get -y dist-upgrade
sudo apt-get -y install git-core build-essential

# Setup firewall
sudo ufw allow ssh
sudo ufw enable


# Install ngrok
sudo apt-get -y install unzip
hash -r

NGROK_DIR=/opt/ngrok
mkdir -p "$NGROK_DIR"
pushd "$NGROK_DIR"
    curl -o ngrok.zip https://dl.ngrok.com/linux_386/ngrok.zip
    rm ngrok
    unzip ngrok.zip
popd


# Install test server
sudo apt-get -y install nginx
sudo service nginx start

sudo apt-get -y autoremove

echo '[INFO] Run ngrok as `/opt/ngrok/ngrok 80`'

