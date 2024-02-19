# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !
eval "$(/opt/homebrew/bin/brew shellenv)"
eval /Users/florian/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
# 自定义软链接
alias fish.nvim='nvim ~/.config/fish/config.fish'
alias nvim.nvim='nvim /Users/florian/.config/nvim/init.vim'
alias fish.source='source ~/.config/fish/config.fish'
alias fish.test="echo 'fish test succeeded!'"
alias vim.vim='vim ~/.vimrc'
alias go.git="cd ~/Documents/Github"
alias go.fish="cd /Users/florian/.config/fish"
alias go.blog='go.git; cd SJTU-RoboMaster-Team.github.io'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias zed='/Applications/Zed.app/Contents/MacOS/zed'
alias linux='clear && ssh julyfun@mfans'
alias mv='mv -i'
alias dl='cd ~/Downloads'
alias docs='cd ~/Documents'
alias go.rsc='go.git && cd cv.rsc'
alias pop='echo You are so good!'
alias sc.vim='vim ~/function/shortcuts/vim.md'
alias bs="bass source"
function cpwd
    if test -z "$argv"
        set slash ""
    else
        set slash "/"
    end
    set output (string join '' (pwd) $slash "$argv")
    echo $output | pbcopy
    echo $output
end

# [fish shell color]
set fish_color_function purple

# [nvim]
# set -gx PATH /Users/florian/Applications/nvim-macos/bin:$PATH

# [autojump]
source /opt/homebrew/share/autojump/autojump.fish

# [自己的软件.just-jump]
set PATH /Users/florian/Documents/GitHub/julyfun/just-jump/target/release:$PATH
alias jsj.nvim="nvim ~/.config/just-jump/jump.toml"

# [rust]
bs "$HOME/.cargo/env"

# Latex 环境变量
export PATH="/usr/local/texlive/2023/bin/universal-darwin:$PATH"

# Chrome 软链接🔗
alias chrome.sjtu='open -a "Google Chrome" https://www.github.com/sjtu-RoboMaster-Team/'
alias chrome.phy.3='open -a "Google Chrome" "http://moodle.speit.sjtu.edu.cn/course/view.php?id=1170"'
alias go.git.keys='open -a "Google Chrome" "https://github.com/settings/keys"'
alias chrome.rm='open -a "Google Chrome" "https://live.bilibili.com/449541?live_from=84002&spm_id_from=333.337.0.0"'


# Colcon 环境变量
set COLCON_EXTENSION_BLACKLIST colcon_core.event_handler.desktop_notification

# CMake 环境变量
set CMAKE_FIND_USE_CMAKE_SYSTEM_PATH FALSE

set -gx LDFLAGS "-L/opt/homebrew/opt/bison/lib"
export HOMEBREW_NO_AUTO_UPDATE=true

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(brew --prefix bison)/bin:$PATH"
export PATH="/opt/homebrew/Cellar/cmake/3.25.2/bin:$PATH"
# export https_proxy=http://127.0.0.1:33210 http_proxy=http://127.0.0.1:33210 all_proxy=socks5://127.0.0.1:33211

# ROS2 相关设置
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"
# export PATH="$HOME/Library/Python/3.8/bin:$PATH"
# export PYTHON3_8_BIN="/usr/local/opt/python@3.8/bin"
# alias pip3="$PYTHON3_8_BIN/pip3"
# alias pip="$PYTHON3_8_BIN/pip3"
# export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/usr/local/opt/qt@5
export OPENSSL_ROOT_DIR=$(brew --prefix openssl)
export PATH="$PATH:/usr/local/opt/qt@5/bin"
# export PATH="/Users/florian/.pyenv/shims:$PATH"
export PATH="/opt/homebrew/Cellar/python@3.9/3.9.16/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
# export CMAKE_PREFIX_PATH="$CMAKE_PREFIX_PATH:/usr/local/opt/qt@5"
export Qt5_DIR=$(brew --prefix qt@5)/lib/cmake
# alias ros2.pyenv.activate="source ~/.pyenv/versions/ros2-0313/bin/activate.fish"
alias ros2.venv="source /Users/florian/code/ros2-direnv-3.9-framework/.venv/bin/activate.fish"
alias ros2.source="bass source /Users/florian/code/ros2-direnv-3.9-framework/ros2_galactic/install/setup.bash"
# alias ros2.go="cd /Users/florian/code/ros2-build-0310/ros2_galactic"
set MACOSX_DEPLOYMENT_TARGET "12.3"
# bass source /Users/florian/code/ros2-build-0310/ros2_galactic/install/setup.bash
alias go.ros2="cd /Users/florian/Documents/Github/rm.cv.ros2_test"

# rvm 相关设置
# [[ -s"$HOME/.rvm/scripts/rvm"]] && source"$HOME/.rvm/scripts/rvm"# Load RVM into a shell session *as afunction*
# source /Users/florian/.rvm/scripts/extras/rvm.fisho

# @julyfun Mfans 上传下载函数
function mup --description 'upload on mfans' 
    scp -r $argv julyfun@mfans.fans:~/pub/
end

function mdl --description 'download from mfans'
    scp -r julyfun@mfans.fans:~/pub/$argv .
end

source ~/Documents/Github/mfa.fish/mfa.fish
source ~/Documents/Github/mfa.fish/jst.fish

# [alias after source mfa]
alias live='mfa.open-link https://live.bilibili.com/p/html/web-hime/index.html'

# [functions] ...

function jk
    switch $argv[1]
    case fun
        jk git && cd julyfun
    case know
        jk git && cd do-you-know
    case ray
        cd /Users/florian/Documents/GitHub/ray-tracing
    case fish
        cd $HOME/.config/fish
    case git
        cd $HOME/Documents/GitHub
    case ics
        jk git && cd ics2022
    case mfa
        jk git && cd mfa.fish
    case std
        cd $HOME/Documents/GitHub/rm.cv.std
    case stdsc
        jk std && cd scripts
    case rsc
        jk git && cd cv.rsc
    case nvim
        cd $HOME/.config/nvim
    case nvim.start
        cd $HOME/.local/share/nvim/site/pack/packer/start 
    case how
        jk fun && cd how-to
    case pic
        cd $HOME/Pictures
    case dl
        cd $HOME/Downloads
    case doc
        cd $HOME/Documents
    case '*'
        functions jk
    end
end

function init-fmt
    cp /Users/florian/Documents/GitHub/SJTU-RoboMaster-Team/style-team/.clang-format .
    cp /Users/florian/Documents/GitHub/SJTU-RoboMaster-Team/style-team/.clang-tidy .
    cp /Users/florian/Documents/GitHub/SJTU-RoboMaster-Team/style-team/.gitignore .
end

function init-cld
    cp -r /Users/florian/code/cpp/build/ .
end

function init-ignore
    cp /Users/florian/Documents/GitHub/SJTU-RoboMaster-Team/style-team/.gitignore .
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# make a c-lib

