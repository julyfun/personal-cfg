tmux new-session -d -s how-to \; send-keys 'cd; j how-to' C-m 'watch -n 600 fish -c "jp"' C-m \; attach-session -t how-to

