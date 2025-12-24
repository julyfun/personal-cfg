set -l W "$(status dirname)"
mkdir -p ~/.config

function moveit
    if not test -e "$argv[2]"
        echo $argv
        ln -s "$argv[1]" "$argv[2]"
    else
        echo (jst warn)exist and skip $argv[2](jst off)
    end
end


moveit "$W/ghostty" "$HOME/.config/ghostty"
moveit "$W/nvim" "$HOME/.config/nvim"
moveit "$W/zed/keymap.json" "$HOME/.config/zed/keymap.json"


functions -e moveit

