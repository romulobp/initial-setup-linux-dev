!/bin/bash

# Installing necessary packages
sudo apt update && sudo apt upgrade -y
sudo apt install curl npm git docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Installing Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Adding user to Docker group
sudo groupadd docker
sudo usermod -aG docker $USER

# Setting Git configuration
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
sudo snap install teams-for-linux
sudo snap install dbeaver-ce

# Installing Notepad++
sudo add-apt-repository ppa:notepadqq-team/notepadqq -y
sudo apt update
sudo apt install notepadqq

# Installing Remmina
sudo apt install remmina -y

# Installing copyq
sudo apt-get install -y copyq

# Installing yarn
sudo npm install --global yarn

# Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc
echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"" >> ~/.bashrc
echo "[ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\"" >> ~/.bashrc
source ~/.bashrc

# Installing Oh-My-Zsh and Powerlevel10k theme
sudo apt install -y zsh
sudo chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master
