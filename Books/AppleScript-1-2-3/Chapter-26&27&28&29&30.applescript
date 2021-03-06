-- Chapter 26

--
--display dialog ("Enter the departure time in London") ¬
--	& (" in the format HH:MM AM or PM:") default answer ""
--set departure_time to date (text returned of result)
--display dialog ("Enter the arrival time where you are") ¬
--	& (" in the format HH:MM AM or PM:") default answer ""
--set arrival_time to (date (text returned of result))
--set travel_duration to ¬
--	arrival_time - departure_time - (time to GMT)
--display dialog ("The flight lasted about ") ¬
--	& travel_duration div hours & ¬
--	" hours." buttons {"OK"} default button "OK"


--
--display dialog ("Enter the departure time in London") ¬
--	& (" in the format HH:MM AM or PM:") default answer ""
--set departure_time to date (text returned of result)
--display dialog ("Enter the arrival time where you are") ¬
--	& (" in the format HH:MM AM or PM:") default answer ""
--set arrival_time to (date (text returned of result)) ¬
--	- (time to GMT)
--if arrival_time comes after departure_time then
--	set travel_duration to arrival_time - departure_time
--	display dialog ("The flight lasted about ") ¬
--		& travel_duration div hours & ¬
--		" hours." buttons {"OK"} default button "OK"
--else
--	display dialog ("You're a time traveler!") ¬
--		buttons {"OK"} default button "OK"
--end if

--
--set now to current date
--set delimiter to "-"
--set year_string to year of now as string
--set month_string to month of now as integer as string
--if length of month_string is 1 then
--	set month_string to "0" & month_string
--end if
--set day_string to day of now as string
--if length of day_string is 1 then
--	set day_string to "0" & day_string
--end if
--return year_string & delimiter ¬
--	& month_string & delimiter ¬
--	& day_string


-- Chapter 27

-- Chapter 28

--
--enableGUIScripting(true)
--beep
---- GUI Scripting statements go here
--to enableGUIScripting(switch)
--	tell application "AppleScript Utility"
--		set GUI Scripting enabled to switch
--	end tell
--end enableGUIScripting

--
--activate application "Preview"
--tell application "System Events"
--	tell process "Preview"
--		--GUI SCRIPTING STATEMENTS
--	end tell
--end tell

--
--activate application "Preview"
--tell application "System Events"
--	tell process "Preview"
--		keystroke "," using {command down}
--		tell tab group 1 of window "Preview Preferences"
--			click radio button "General"
--			get value of text field 1
--		end tell
--	end tell
--end tell

--
--activate application "Preview"
--tell application "System Events"
--	tell process "Preview"
--		keystroke "," using {command down}
--		tell tab group 1 of window "Preview Preferences"
--			click radio button "General"
--			tell text field 1
--				set value to "Sal Soghoian"
--			end tell
--		end tell
--	end tell
--end tell

--
--activate application "Preview"
--tell application "System Events"
--	tell process "Preview"
--		keystroke "," using {command down}
--		tell tab group 1 of window "Preview Preferences"
--			click radio button "General"
--			select text field 1
--		end tell
--		keystroke "Sal Soghoian"
--	end tell
--end tell

--
--activate application "TextEdit"
--tell application "System Events"
--	tell process "TextEdit"
--		keystroke "," using {command down}
--		delay 1
--		click radio button ("New Document") ¬
--			of tab group 1 of window "Preferences"
--		delay 1
--		tell text field 1 of tab group 1 of window "Preferences"
--			set value to "80"
--		end tell
--	end tell
--end tell

--
--activate application "Preview"
--tell application "System Events"
--	tell process "Preview"
--		keystroke "," using {command down}
--		tell tab group 1 of window "Preview Preferences"
--			click radio button "Images"
--			tell checkbox "Respect image and screen DPI for scale"
--				set value to 1 -- nothing happens
--			end tell
--		end tell
--	end tell
--end tell

--
--activate application "Preview"
--tell application "System Events"
--	tell process "Preview"
--		keystroke "," using {command down}
--		tell tab group 1 of window "Preview Preferences"
--			click radio button "Images"
--			tell checkbox "Respect image and screen DPI for scale"
--				if value is not 1 then click -- it works!
--			end tell
--		end tell
--	end tell
--end tell

--
--activate application "Preview"
--tell application "System Events"
--	tell process "Preview"
--		tell menu "View" of menu bar 1
--			click
--			click menu item "Zoom In"
--		end tell
--	end tell
--end tell

--
--activate application "Preview"
--tell application "System Events"
--	tell process "Preview"
--		keystroke "q" using {command down}
--	end tell
--end tell

-- Chapter 29

--
--tell application "Finder" to duplicate ¬
--	(every document file of folder "Documents" of home ¬
--		whose kind is "PDF Document") to folder "Backup"

--
--do shell script "cal"

-- man pages
--set the manual_text to (do shell script "man cal | col -b")
--tell application "TextEdit"
--	activate
--	set this_document to ¬
--		make new document with properties {text:manual_text}
--	set the properties of the text of this_document to ¬
--		{size:12, color:{0, 0, 0}, font:"Courier"}
--	set the bounds of window 1 to {0, 22, 612, 792}
--end tell

--
--set the command_result to (do shell script "cal")
--tell application "TextEdit"
--	activate
--	set this_document to ¬
--		make new document with properties {text:command_result}
--	set properties of text of this_document to ¬
--		{size:50.0, color:{0, 0, 65535}, font:"Courier"}
--	set the bounds of window 1 to {0, 22, 792, 612}
--end tell

--
--set the command_result to (do shell script "cal -y")
--tell application "TextEdit"
--	activate
--	set this_document to ¬
--		make new document with properties {text:command_result}
--	set properties of text of this_document to ¬
--		{size:15.0, color:{0, 0, 65535}, font:"Courier"}
--	set bounds of window 1 to {0, 22, 612, 792}
--end tell

--
--set the temp_date to the current date
--set day of the temp_date to 1
--set month of the temp_date to ¬
--	((month of the temp_date) as integer) + 1
--set the month_value to ¬
--	month of the temp_date as integer as string
--set the year_value to (year of temp_date) as string
--set the manual_text to ¬
--	(do shell script "cal " & month_value & space & year_value)
--tell application "TextEdit"
--	activate
--	set this_document to ¬
--		make new document with properties {text:manual_text}
--	set properties of text of this_document to ¬
--		{size:50.0, color:{0, 0, 65535}, font:"Courier"}
--	set bounds of window 1 to {0, 22, 792, 612}
--end tell

--
--set the temp_date to the current date
--set day of the temp_date to 1
--set H to 0
--set V to 0
--set offset_increment to 22
--repeat 12 times
--	set month of the temp_date to ¬
--		((month of the temp_date) as integer) + 1
--	set the month_value to ¬
--		month of the temp_date as integer as string
--	set the year_value to (year of temp_date) as string
--	set the manual_text to ¬
--		(do shell script "cal " & month_value & space & year_value)
--	tell application "TextEdit"
--		activate
--		set this_document to ¬
--			make new document with properties {text:manual_text}
--		set properties of text of this_document to ¬
--			{size:50.0, color:{0, 0, 65535}, font:"Courier"}
--		set bounds of window 1 to {0 + H, 22 + V, 792 + H, 612 + V}
--	end tell
--	set H to H + offset_increment
--	set V to V + offset_increment
--end repeat

--
--display dialog "Enter the UNIX command:" default answer ""
--set the UNIX_command to the text returned of the result
--set the manual_text to ¬
--	(do shell script "man " & UNIX_command & " | col -b")
--tell application "TextEdit"
--	activate
--	set this_document to ¬
--		make new document with properties {text:manual_text}
--	set properties of text of this_document to ¬
--		{size:12, color:{0, 0, 0}, font:"Courier"}
--	set the bounds of window 1 to {0, 22, 612, 792}
--end tell

--
-- do shell script "date '+DATE: %m-%d-%Y%nTIME: %H:%M:%S'"

--
--do shell script "screencapture ~/Desktop/screen.png"

--
--do shell script "screencapture -c"

--
--do shell script ¬
--	"screencapture ~/Desktop/screen-$(date '+%Y-%m-%d-%H.%M.%S').png"

--
--do shell script "screencapture -ic"

--
--say "Select a window."
--do shell script "screencapture -iWc"

--
--set date_slug to do shell script "date '+%Y-%m-%d-%H.%M.%S'"
--set the file_name to "screen-" & date_slug & ".png"
--say "Select a window."
--try
--	do shell script "screencapture -iW tmp/" & file_name & ¬
--		";open -b com.apple.Preview tmp/" & file_name
--end try

--
--set date_slug to do shell script "date '+%Y-%m-%d-%H.%M.%S'"
--set the file_name to "screen-" & date_slug & ".png"
--say "Select a window."
--try
--	do shell script "screencapture -iW tmp/" & file_name & ¬
--		";open -b com.apple.Mail tmp/" & file_name
--end try

--
--set the default_name to "untitled"
--repeat
--    set the target_file to ¬
--        (choose file name with prompt ¬
--            ("Name & location for the screen capture. " & ¬
--                "Format is determined by the name extension:") ¬
--                default name default_name) as Unicode text
--    try
--        set the name_extension to text -4 thru -1 of the target_file
--        if the name_extension is not in ¬
--            {".tif", ".jpg", ".png", ".pdf", ".bmp", ".pct"} then
--error
--else
--            if the target_file ends with ".pct" then
--                set the file_type to "pict"
--            else
--                set the file_type to ¬
--                    text -3 thru -1 of the target_file
--            end if
--            set the target_path to the quoted form of ¬
--                the POSIX path of the target_file
--            exit repeat
--        end if
--    on error
--        set AppleScript's text item delimiters to ":"
--        set the default_name to the last text item of the target_file
--        set AppleScript's text item delimiters to ""
--        display dialog "The file name " & default_name & ¬
--            "" must end with one of these name extensions:" & ¬
--            return & return & ¬
--            ".tif, .jpg, .png, .pdf, .bmp, or .pct" & ¬
--            return & return & ¬
--            "The format of the image file is determined by ¬
--            the name extension you use." buttons ¬
--{"OK"} default button 1 with icon 2
--    end try
--end repeat
--display dialog "Capture method:" buttons ¬
--    {"Cancel", "Screen", "Selection"} default button 3
--set the capture_method to the button returned of the result
--if the capture_method is "Screen" then
--    do shell script ¬
--        ("screencapture -t" & file_type & space & target_path)
--else
--    say "select a region or window."
--    do shell script ¬
--        ("screencapture -it" & file_type & space & target_path)
--end if
--display dialog "Open file with:" buttons ¬
--    {"None", "Mail", "Preview"} default button 3
--set the target_application to the button returned of the result
--if the target_application is "Mail" then
--    tell application "Mail"
--        activate
--        open target_file
--    end tell
--else if the target_application is "Preview" then
--    tell application "Preview"
--activate
--        open target_file
--    end tell
--end if

--
--on idle
--	try
--		set date_slug to do shell script "date '+%m%d%Y-%H%M%S'"
--		set the file_name to "screen-" & date_slug & ".png"
--		do shell script "screencapture -tpng tmp/" & file_name
--		tell application "Mail"
--			set this_message to ¬
--				make new outgoing message with properties ¬
--					{subject:"Screen Capture"}
--			tell this_message
--				make new to recipient with properties ¬
--					{name:"Animal Friend", address:"seal@zoo.com"}
--			end tell
--			tell contents of this_message
--				make new attachment with properties ¬
--					{file name:("tmp/" & file_name)}
--			end tell
--			set visible of this_message to true
--			send this_message
--		end tell
--	end try
--	return 3600 -- one hour
--end idle

--
--set this_file to choose file of type "public.jpeg" without invisibles
--do shell script ("mdls " & ¬
--	the quoted form of the POSIX path of this_file)

-- Chapter 30

--
--property boy : ""
--property girl : ""
--on run
--	init_talkers()
--	recite_poem()
--end run
--to init_talkers()
--	if class of boy is not script then ¬
--		set boy to make_talker("Junior")
--	if class of girl is not script then ¬
--		set girl to make_talker("Princess")
--end init_talkers
--to recite_poem()
--	tell boy to recite("One two, buckle my shoe.")
--	tell girl to recite("Three four, knock at the door.")
--	tell boy to recite("Five six, pick up sticks.")
--	tell girl to recite("Seven eight, lay them straight.")
--	tell boy to recite("Nine ten, a good fat hen.")
--end recite_poem
--to make_talker(voice_name)
--	script talker
--		property voice : voice_name
--		to recite(stanza)
--			say stanza using voice
--		end recite
--	end script
--	return talker
--end make_talker











