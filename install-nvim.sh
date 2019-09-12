echo "installing and configuring nvim for ahir development"
sudo apt-get install ninja-build gettext libtool autoconf automake cmake g++ pkg-config unzip
git clone https://github.com/neovim/neovim.git
sudo apt install python2.7 -y
sudo apt install python-pip -y
sudo apt install python3-pip -y
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
sudo apt-get install python-dev
pip2 install --user neovim
pip3 install --user neovim

echo "open nvim and run :PlugInstall command"
