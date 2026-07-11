#!/bin/bash
ssh "$1" 'mkdir -p ~/.codex'
scp ~/.codex/{auth.json,config.toml} "$1":~/.codex/

