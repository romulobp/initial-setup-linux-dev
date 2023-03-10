!/bin/bash

#Installing necessary packages
sudo apt update && sudo apt upgrade -y
sudo apt install curl npm git docker.io zsh -y

gsettings set org.gnome.desktop.session idle-delay 0

#Remove keyring

#Starting and enabling Docker
sudo systemctl start docker
sudo systemctl enable docker

#Installing Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Adding user to Docker group
sudo groupadd docker
sudo usermod -aG docker $USER

#Installing Visual Studio Code
wget -O /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i /tmp/vscode.deb
sudo apt install -f
rm /tmp/vscode.deb

wget -qO- https://raw.githubusercontent.com/cra0zy/code-nautilus/master/install.sh | bash

#Installing Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
sudo apt install -f -y

#Installing Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -f -y

#Installing Postman
sudo snap install postman

#Installing Microsoft Teams
sudo snap install teams-for-linux

#Installing DBeaver
sudo snap install dbeaver-ce

#Installing Notepad++
sudo add-apt-repository ppa:notepadqq-team/notepadqq -y
sudo apt update
sudo apt install notepadqq -y

#Installing Remmina
sudo apt install remmina -y

#Installing copyq
sudo apt-get install -y copyq

#Setting Git configuration
read -p "Enter your Git name: " name
read -p "Enter your Git email: " email
git config --global user.name "$name"
git config --global user.email "$email"
git config --global credential.helper cache
git config --global credential.helper store

#Installing yarn
sudo npm install --global yarn

#Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
echo "export NVM_DIR="$HOME/.nvm"" >> ~/.bashrc
echo "[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"" >> ~/.bashrc
echo "[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"" >> ~/.bashrc
source ~/.bashrc

#Installing Oh-My-Zsh and Powerlevel10k theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "export POWERLEVEL9K_MODE='nerdfont-complete'" >> ~/.zshrc
echo "export POWERLEVEL9K_FONT='MesloLGS NF Regular'" >> ~/.zshrc
source ~/.zshrc

#Restarting terminal for changes to take effect
exec zsh
