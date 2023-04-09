#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install prerequisites
sudo apt install -y build-essential curl git

# Install Zsh
sudo apt install -y zsh

# Set Zsh as the default shell
chsh -s $(which zsh)

# Install Oh My Zsh (Optional, for a more pleasant Zsh experience)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install GVM (Go Version Manager)
if [ ! -d "$HOME/.gvm" ]; then
  curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
  source "$HOME/.gvm/scripts/gvm"
  gvm install go1.17 -B
  gvm use go1.17 --default
fi

# Install NVM (Node Version Manager)
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  source "$HOME/.nvm/nvm.sh"
  nvm install node
  nvm alias default node
fi

# Link .zshrc to home directory
if [ ! -f "$HOME/.zshrc" ]; then
  ln -s "$(pwd)/.zshrc" "$HOME/.zshrc"
  source "$HOME/.zshrc"
else
  echo "Error: .zshrc already exists in the home directory."
fi

echo "Setup complete. Please restart your terminal."
# ===============================================







# installing docker
apt remove -y docker docker-engine docker.io docker-ce
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt update
apt install -y docker-ce

echo "docker installed successfully"

echo "docker post install steps"
groupadd docker
usermod -aG docker $USER
#====================================
