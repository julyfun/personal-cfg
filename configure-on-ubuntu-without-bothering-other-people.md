## ctrl shift t < konsole

```
sudo apt install konsole
```

## auto completion, autojump < fish

```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
# in GitHub folder
git clone git@github.com:julyfun/mfa.fish
git clone git@github.com:julyfun/personal-cfg
git clone git@github.com:wting/autojump.git
```

```
vim ~/.config/fish/config.fish
# add this:
source ~/Documents/GitHub/mfa.fish/mfa.fish
source ~/Documents/GitHub/mfa.fish/jst.fish
source ~/Documents/GitHub/autojump/bin/autojump.fish
```

## vscode neovim < neovim < PATH fish

```
mkdir -p ~/.mfa/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage ~/.mfa/bin/nvim
vim ~/.config/fish/config.fish
# add this: 
set PATH "$HOME/.mfa/bin:$PATH"
mkdir ~/.config/nvim
cd ~/.config/nvim
cp ~/Documents/GitHub/personal-cfg/init.vim .
```

