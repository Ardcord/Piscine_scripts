#!/bin/sh

i=0

while [ $i -lt 3 ]; do
	osascript -e 'tell application "iTerm"
    	create window with default profile
    	tell current session of current window
    	    write text "printf \"\\033]0;Il fait chaud!\\007\""
    	end tell
	end tell'
    i=$((i+1))
done