apt install -y vim \ 
    git \
    wget \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    python-pip \
    python-setuptools \
    tmux

# install chrome
echo "installing chrome..."
#touch /etc/apt/sources.list.d/google-chrome.list
#echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
#wget https://dl.google.com/linux/linux_signing_key.pub
#apt-key add linux_signing_key.pub
#apt update
#apt install google-chrome-stable
echo "chrome installed"


# install node
echo "Installing NVM"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
echo "NVM installed"

# installing node into nvm
nvm install node

# allows to exec npm update check
sudo chown -R $USER_TO_USE:$(id -gn $USER_TO_USE) /home/$USER_TO_USE/.config
source ~/.bashrc

echo "last node version instaled"
echo "node stuffs done"

# end installing node

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

# installing slack
echo "installing slack"
sudo apt install gdebi-core
wget -O ~/slack.deb "https://downloads.slack-edge.com/linux_releases/slack-desktop-3.1.0-amd64.deb"
gdebi -q ~/slack.deb
#========================