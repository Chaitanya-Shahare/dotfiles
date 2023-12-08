#!/bin/bash

# Frontend
# Step 1: Open a folder (Replace with your folder path)
cd ~/Documents/Zalco/chat_frontend

# Step 2: Start a new tmux session named "blog"
tmux new-session -d -s frontend-zalco

# Step 3: Open nvim in the "blog" session
tmux send-keys -t frontend-zalco 'nvim' C-m

# Step 4: Open a new tmux window and run "hugo server"
tmux new-window -t frontend-zalco:1
tmux send-keys -t frontend-zalco:1 'npm start' C-m

# Step 5: Go back to the first window
tmux select-window -t frontend-zalco:0

# Step 6: Open a new Safari window and visit localhost:1313
# open -a Safari "http://localhost:1313"
# sleep 1
# osascript -e 'tell application "Safari" to activate' -e 'tell application "Safari" to make new document with properties {URL:"https://www.figma.com/file/8LSCgfDcJ58sWqdihM5ROh/Chat?node-id=192%3A717&mode=dev"}'
osascript -e 'tell application "Google Chrome" to activate' -e 'tell application "Google Chrome" to make new window' -e 'tell application "Google Chrome" to set URL of active tab of front window to "http://localhost:3000/"'


# Backend
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


# osascript -e 'tell application "Google Chrome" to activate' -e 'tell application "Google Chrome" to make new window with properties {mode:"normal"}' -e 'tell application "Google Chrome" to tell front window to make new tab with properties {URL:"http://localhost:3000", active:true}' -e 'delay 1' -e 'tell application "System Events" to keystroke "Option+Command+I"'

# Optional: Attach to the "blog" tmux session (comment out if not needed)
tmux attach -t frontend-zalco


