#!/bin/bash

# Step 1: Open a folder (Replace with your folder path)
cd ~/documents/BLOG/Blog/ChaitanyasBlog/

# Step 2: Start a new tmux session named "blog"
tmux new-session -d -s blog

# Step 3: Open nvim in the "blog" session
tmux send-keys -t blog 'nvim' C-m

# Step 4: Open a new tmux window and run "hugo server"
tmux new-window -t blog:1
tmux send-keys -t blog:1 'hugo server' C-m

# Step 5: Go back to the first window
tmux select-window -t blog:0

# Step 6: Open a new Safari window and visit localhost:1313
# open -a Safari "http://localhost:1313"
sleep 0.5
osascript -e 'tell application "Safari" to activate' -e 'tell application "Safari" to make new document with properties {URL:"http://localhost:1313"}'

# Optional: Attach to the "blog" tmux session (comment out if not needed)
tmux attach -t blog

