#!/bin/bash

#Updating system packages
sudo pacman -Syu

#Installing Git, Docker, and Docker Compose
sudo pacman -S git docker
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo gpasswd -a $USER docker

#Installing Visual Studio Code, Discord, Chrome, and Postman
sudo pacman -S code discord google-chrome postman

#Installing Microsoft Teams and DBeaver
sudo pacman -S teams dbeaver

#Installing Notepad++ and LibreOffice
sudo pacman -S notepadqq libreoffice

#Installing Remmina
sudo pacman -S remmina

#Installing copyq
sudo pacman -S copyq

#Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
echo "export NVM_DIR="$HOME/.nvm"" >> ~/.bashrc
echo "[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"" >> ~/.bashrc
echo "[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"" >> ~/.bashrc
source ~/.bashrc

#Installing Oh-My-Zsh and Powerlevel10k theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/g' ~/.zshrc
echo "POWERLEVEL9K_MODE='nerdfont-complete'" >> ~/.zshrc

#Reboot
sudo reboot
