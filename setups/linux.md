```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/home/linuxbrew/.linuxbrew/bin/brew install fish
fish
```

copy ssh key to github

```fish
# [jst]
set fish_d ~/.config/fish
set j ~/Documents/GitHub/julyfun

mkdir -p $fish_d
mkdir -p $j
cd $j

git clone git@github.com:julyfun/personal-cfg
git clone git@github.com:julyfun/how-to
git clone git@github.com:julyfun/jst.fish

echo "source $j/jst.fish/jst.fish" >> $fish_d/config.fish
echo "source $j/jst.fish/kickstart.fish" 
exec fish

# [personal-cfg]
set j ~/Documents/GitHub/julyfun
cd $j/personal-cfg
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/nvim ~/.config/nvim
ln -s $(pwd)/ghostty/config ~/.config/ghostty/config

jst config "eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
jst config "zoxide init fish | source"
jst config "source $j/personal-cfg/config.fish"
exec fish

brew install tmux
brew install tree
brew install neovim
brew install zoxide
brew install fzf
```

