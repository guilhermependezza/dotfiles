#!/bin/bash

rm -rf .shell.pre-oh-my-zsh
rm -rf .zsh*
rm -rf .oh-my-zsh/

# Remover GVM (Go Version Manager)
echo "Removendo GVM..."
rm -rf "$HOME/.gvm"

# Remover NVM (Node Version Manager)
echo "Removendo NVM..."
rm -rf "$HOME/.nvm"

# Remover o link simbólico .zshrc
if [ -L "$HOME/.zshrc" ]; then
  echo "Removendo link simbólico .zshrc..."
  rm "$HOME/.zshrc"
else
  echo "O arquivo .zshrc não é um link simbólico ou não existe. Ignorando..."
fi

# Resetar shell padrão para bash (se Zsh estiver como padrão)
current_shell=$(basename "$SHELL")
if [ "$current_shell" == "zsh" ]; then
  echo "Resetando o shell padrão para bash..."
  chsh -s $(which bash)
else
  echo "O shell padrão já é bash. Ignorando..."
fi

echo "Desfazendo alterações completas. Por favor, reinicie o terminal."
