#!/usr/bin/env bash

SESSION_HISTORY_FILE="$HOME/.cache/dirs_history.txt"

if [[ -f "$SESSION_HISTORY_FILE" ]]; then
    selected=$(tac "$SESSION_HISTORY_FILE" | fzf --prompt="📂 Dir history > " --height=40% --reverse)
    if [[ -n "$selected" ]]; then
        tmux new-window -c "$selected"
    fi
else
    echo "No session history file found." >&2
fi
