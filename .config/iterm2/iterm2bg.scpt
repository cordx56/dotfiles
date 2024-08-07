#!/usr/bin/osascript

on run argv
    if (count of argv) = 1 then
        tell application "iTerm2"
            tell current session of current window
                set background image to (item 1 of argv)
            end tell
        end tell
    end if
end run
