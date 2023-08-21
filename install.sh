#!/bin/bash

REPO=${HOME}/setup
alias echo='{ set +x; } 2> /dev/null; builtin echo'
PS4='\033[1;34m$(date +%H:%M:%S)\033[0m '; set -x

START_PACKAGES=(git tree make gcc libgtk-4-dev libasound2-dev)

echo setting up environment
sudo mkdir /src
sudo chown -r ${USER}:${USER} /src

echo installing common software
sudo apt install ${START_PACKAGES[@]}

echo downloading and installing alsa-scarlett-gui
pushd /src
git clone git@github.com:geoffreybennett/alsa-scarlett-gui.git
cd alsa-scarlett-gui/src
make -j4
ln -s ${REPO}/etc/modprobe.d/scarlett.conf /etc/modprobe.d/

echo putting config files at home directory
ln -s ${REPO}/${HOME}/conf ${HOME}

echo you should reboot for installation to finish
