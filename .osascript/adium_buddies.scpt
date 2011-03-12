property linebreak : "
"
set text item delimiters to linebreak

tell application "System Events" 
set myList to (name of every process)
end tell
if (myList contains "Adium") is true then
	tell application "Adium"
		set c to count contacts
		set c_list to {"------------------------------------------------","Chat","------------------------------------------------"}
		repeat with x from 1 to c
			set display_name to display name of contact x
			set status_type to status type of contact x
			if (status_type is not offline) then
				if (display_name is not in c_list) then
					set end of c_list to display_name
				end if
			end if
		end repeat
		return c_list as text
	end tell
end if