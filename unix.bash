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

