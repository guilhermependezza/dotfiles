# .zshrc

# GVM (Go Version Manager)
if [ -s "$HOME/.gvm/scripts/gvm" ]; then
  source "$HOME/.gvm/scripts/gvm"
fi

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh"
fi
