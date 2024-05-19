# setup github ssh keys manually first
# https://github.com/settings/ssh/new
# ssh-keygen -t rsa
# curl -o one-command-config.bash https://raw.githubusercontent.com/julyfun/personal-cfg/main/one-command-config.bash && yes | bash one-command-config.bash

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
mkdir -p ~/Documents/GitHub
cd ~/Documents/GitHub
git clone git@github.com:julyfun/mfa.fish --depth=10
git clone git@github.com:julyfun/kickstart.fish --depth=10
git clone git@github.com:julyfun/personal-cfg --depth=10
git clone git@github.com:wting/autojump.git --depth=10
cd autojump
./install.py

# will i have to touch config.fish? seems no

fish_source="
source ~/Documents/GitHub/mfa.fish/mfa.fish
source ~/Documents/GitHub/mfa.fish/jst.fish
source ~/Documents/GitHub/kickstart.fish/kickstart.fish
source ~/Documents/GitHub/autojump/bin/autojump.fish
"

echo "$fish_source" >> ~/.config/fish/config.fish

# mkdir -p ~/.mfa/bin
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage
# mv nvim.appimage ~/.mfa/bin/nvim
# echo 'set PATH "$PATH:$HOME/.mfa/bin'

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

mkdir ~/.config/nvim
cd ~/.config/nvim
cp ~/Documents/GitHub/personal-cfg/init.vim .

