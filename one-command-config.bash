# [前置条件]
# - https://github.com/settings/ssh/new
# - curl -o one-command-config.bash https://raw.githubusercontent.com/julyfun/personal-cfg/main/one-command-config.bash && yes | bash one-command-config.bash
# [备忘录]
# - 设置镜像源
# https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/

if [ "$(id -u)" -ne 0 ]; then
    alias sudo='echo Non-root user, sudo is ignored:'
fi

sc22=\
'deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
'
ver=$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2 | tr -d '"')
if [ "$ver" = "22.04"  ]; then
    sudo echo "$sc22" > /etc/apt/sources.list
    # [TODO] 这个 echo 貌似有时候报错
fi

# 以下安全更新软件源包含了官方源与镜像站配置，如有需要可自行修改注释切换
sudo apt update
sudo apt install git
sudo apt install net-tools
sudo apt install unzip
sudo apt install vim # you can do anything with this editor
sudo apt install curl
# Sometimes failed
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
mkdir -p ~/Documents/GitHub
cd ~/Documents/GitHub
git clone https://github.com/julyfun/jst.fish --depth=10
git clone https://github.com/julyfun/personal-cfg --depth=10
git clone https://github.com/how-to/personal-cfg --depth=10
git clone https://github.com/wting/autojump.git --depth=10
cd autojump
./install.py

# [TODO] this echo sometimes failed i don't know why
mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish
fish_source="
source ~/Documents/GitHub/jst.fish/jst.fish
source ~/Documents/GitHub/jst.fish/kickstart.fish
source ~/Documents/GitHub/autojump/bin/autojump.fish
"
echo "$fish_source" >> ~/.config/fish/config.fish

fish -c "jst get neovim"

exec fish

# [another neovim]
# # Sometimes failed 可能只有配好了 clash 才行
# mkdir -p ~/app
# curl -LO https://mirror.ghproxy.com/https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage
# mv nvim.appimage ~/app/nvim
# echo 'set PATH "$PATH:$HOME/app"' >> ~/.config/fish/config.fish

# [another nvim]
# sudo add-apt-repository ppa:neovim-ppa/stable
# sudo apt-get update
# sudo apt-get install neovim
# 
# mkdir -p ~/.config/nvim
# cd ~/.config/nvim
# cp ~/Documents/GitHub/personal-cfg/init.vim .

# [change shell]
# chsh -s /usr/bin/fish
# this need reboot or gnome-session-quit

