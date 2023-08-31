# Update and Upgrade
- sudo apt update
- sudo apt upgrade

# Setup directories
- mkdir ${HOME}/bin

# Uninstall junk
- sudo apt purge gnome-sudoku* gnome-mines* gnome-mahjongg* aisleriot* --auto-remove

# Install packages
- sudo apt install vim curl git ubuntu-restricted-extras xclip

# Install Bitwarden extension for Firefox
https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/

# Generate GitHub Token
- ssh-keygen -t ed25519 -C "patriciavillela@proton.me" -f ${HOME}/.ssh/github_personal -N ""
- cat ${HOME}/.ssh/github_personal.pub | xclip -sel clipboard
- echo Setup on GitHub

# Configure git
- git config --global user.email "patriciavillela@meetsoci.com"
- git config --global user.name "Patrícia Villela Ocaña Bruno"

# Get setup repository
GIT_SSH_COMMAND="ssh -oUserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:patriciavillela/setup.git

# Run install.sh
- ${HOME}/setup/install.sh

# Install VS Code
- wget https://az764295.vo.msecnd.net/stable/6c3e3dba23e8fadc360aed75ce363ba185c49794/code_1.81.1-1691620686_amd64.deb -O code.deb
- sudo apt install ./code.deb
- rm code.deb

# Install Plover (TODO check correct group for tty access)
- wget https://github.com/openstenoproject/plover/releases/download/v4.0.0.dev12/plover-4.0.0.dev12-x86_64.AppImage -O plover.AppImage
- mv plover.AppImage ${HOME}/bin
- chmod +x ${HOME}/bin/plover.AppImage
- sudo usermod -aG dialout ${USER}
- sudo usermod -aG uucp ${HOME}

# System Settings
Show Battery Percentage on top bar
- dconf write /org/gnome/desktop/interface/show-battery-percentage true
- dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
- dconf write /org/gnome/mutter/workspaces-only-on-primary false
- dconf write /org/gnome/settings-daemon/plugins/color/night-light-enabled true
- dconf write /org/gnome/settings-daemon/plugins/color/night-light-temperature "uint32 4700"
Set Power Mode as "Performance"
- powerprofilesctl set performance

# Put Open Sidebar button on Toolbar
Go to the menu -> More Tools -> Customize Toolbar
Drag it there

# Clean-up
- sudo apt autoclean
- sudo apt clean
- sudo apt autoremove

# Reboot
- sudo reboot
