#!/usr/bin/bash
# this script is of no use
tmux start
tmux new-session -d -s trans \
&& tmux send-keys -t trans:0 "trans -s en -t zh-CN -I" C-m \
&& tmux split-window -v -t trans:0 \
&& tmux send-keys -t trans:0.1 "trans -s zh-CN -t en -I" C-m \
&& tmux attach -t trans

