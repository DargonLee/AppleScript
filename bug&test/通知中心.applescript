tell application "System Events"
	tell process "SystemUIServer"
		if menu bar item "֪ͨ����" is enabled then
			tell menu bar 1
				click menu bar item "֪ͨ����"
			end tell
		else
			return
		end if
	end tell
end tell