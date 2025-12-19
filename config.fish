set HOW "~/Documents/GitHub/julyfun/how-to"
alias note="nvim $HOW/notes/julyfun/240730-摸鱼日志.md"
alias notes="jd $HOW/notes/julyfun/ $argv"
alias notej="cd $HOW/notes/julyfun/"
alias how="jd ~/Documents/GitHub/julyfun/how-to $argv"
alias key="echo Use '`<leader>sk` instead'"
alias do="nvim ~/Documents/GitHub/julyfun/buffer/doing.md"
alias buf="nvim ~/Documents/GitHub/julyfun/buffer/buffer.md"
alias pe="nvim ~/Documents/GitHub/julyfun/buffer/peoples.md"
alias pa="nvim ~/Documents/GitHub/julyfun/buffer/papers.md"
alias zel='zellij --layout (echo -e "layout {\n    pane\n}\npane_frames false" | psub)'

set -gx HF_ENDPOINT "https://hf-mirror.com"

export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_INSTALL_FROM_API=1

