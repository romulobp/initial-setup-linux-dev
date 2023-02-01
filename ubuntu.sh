#!/bin/bash

# Updating system packages
sudo apt update && sudo apt upgrade -y

# Installing Git, Docker, and Docker Compose
sudo apt install git docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
echo "Enter your Git name: "
read name
echo "Enter your Git email: "
read email
git config --global user.name "$name"
git config --global user.email "$email"
git config --global credential.helper cache

# Installing Visual Studio Code, Discord, Chrome, and Postman
sudo snap install code --classic
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
sudo apt install -f -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -f -y
sudo snap install postman

# Installing Microsoft Teams and DBeaver
wget -O teams.deb "https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.16851_amd64.deb"
sudo dpkg -i teams.deb
sudo apt install -f -y
sudo apt install dbeaver-ce -y

# Installing Notepad++ and LibreOffice
sudo add-apt-repository ppa:notepadqq-team/notepadqq -y
sudo apt update
sudo apt install notepadqq libreoffice -y

# Installing Remmina
sudo apt install remmina -y

# Installing copyq
sudo apt-get install -y copyq

# Installing yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

# Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc
echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"" >> ~/.bashrc
echo "[ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\"" >> ~/.bashrc
source ~/.bashrc

# Installing Oh-My-Zsh and Powerlevel10k theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/g' ~/.zshrc
echo "POWERLEVEL9K_MODE='nerdfont-complete'" >> ~/.zshrc

#Reboot
sudo reboot
