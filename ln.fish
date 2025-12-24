set -l W "$(realpath .)"
mkdir -p ~/.config

function moveit
    if not test -e "$argv[2]"
        echo $argv[2] "->" $argv[1]
        ln -s "$argv[1]" "$argv[2]"
    else
        echo (jst warn)exist and skip $argv[2](jst off)
        if test -z (readlink $argv[2])
            echo (jst err)But it is not a softlink.
            echo
        end
    end
end


moveit "$W/ghostty" "$HOME/.config/ghostty"
moveit "$W/nvim" "$HOME/.config/nvim"
moveit "$W/zed/keymap.json" "$HOME/.config/zed/keymap.json"
moveit "$W/zellij" "$HOME/.config/zellij"
moveit "$W/.tmux.conf" "$HOME/.tmux.conf"


functions -e moveit

