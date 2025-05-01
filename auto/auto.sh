#!/usr/bin/bash
tmux start
tmux new-session -d -s auto
tmux send-keys -t auto:0 "export DISPLAY=:0" C-m
tmux send-keys -t auto:0 "rustdesk" C-m
tmux split-window -v -t auto:0
tmux send-keys -t auto:0.1 "watch -n 600 \"fish -c 'cd; j how-to; jp'\"" C-m

