#!/bin/bash

# Step 1: Open a folder (Replace with your folder path)
cd ~/Documents/Zalco/chat_backend

# Step 2: Start a new tmux session named "blog"
tmux new-session -d -s backend-zalco

# Step 3: Open nvim in the "blog" session
tmux send-keys -t backend-zalco 'nvim' C-m

# Step 4: Open a new tmux window and run "hugo server"
tmux new-window -t backend-zalco:1
tmux send-keys -t backend-zalco:1 'npm run dev' C-m

# Step 5: Go back to the first window
tmux select-window -t backend-zalco:0

# Step 6: Open a new Safari window and visit localhost:1313
# open -a Safari "http://localhost:1313"
# sleep 1
# osascript -e 'tell application "Google Chrome" to activate' -e 'tell application "Google Chrome" to make new window' -e 'tell application "Google Chrome" to set URL of active tab of front window to "http://localhost:3000/"'

# Optional: Attach to the "blog" tmux session (comment out if not needed)
# tmux attach -t backend-zalco

