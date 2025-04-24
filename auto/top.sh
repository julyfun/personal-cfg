tmux start
tmux new-session -d -s top
tmux send-keys -t top:0 "btop" C-m
tmux split-window -v -t top:0
tmux send-keys -t top:0.1 "nvtop" C-m
tmux attach -t "top"

