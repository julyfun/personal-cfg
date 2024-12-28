tmux new-session -d -s temp_session \; send-keys 'cd; j how-to' C-m 'watch -n 600 fish -c "jp"' C-m \; rename-session -t temp_session how-to \; attach-session -t how-to

