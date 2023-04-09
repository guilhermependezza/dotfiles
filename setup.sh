#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install prerequisites
sudo apt install -y build-essential curl git bison

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

# Install Zsh
sudo apt install -y zsh

# Set Zsh as the default shell
chsh -s $(which zsh)

# Install Oh My Zsh (Optional, for a more pleasant Zsh experience)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Link .zshrc to home directory
if [ ! -f "$HOME/.zshrc" ]; then
  ln -s "$(pwd)/.zshrc" "$HOME/.zshrc"
else
  echo "Error: .zshrc already exists in the home directory."
fi

source "$HOME/.zshrc"

echo "Setup complete. Please restart your terminal."
# ===============================================
