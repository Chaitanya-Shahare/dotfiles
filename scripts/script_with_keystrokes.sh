#!/bin/bash 
osascript <<EOF 
tell application "System Events" 
  delay 0.5 
  keystroke space using command down 
  
  delay 0.5 
  set textBuffer to "TextEdit" 
  repeat with i from 1 to count characters of textBuffer 
    keystroke (character i of textBuffer) 
    delay 0.05 
  end repeat 
  
  delay 0.5 
  keystroke return 
  
  delay 1 
  set textBuffer to "Hello world!" 
  repeat with i from 1 to count characters of textBuffer 
    keystroke (character i of textBuffer) 
    delay 0.05 
  end repeat 
 	 
end tell 
EOF
