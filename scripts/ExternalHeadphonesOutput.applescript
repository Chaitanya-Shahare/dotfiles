-- Set the name of the output device you want to switch to
set desiredOutput to "External Headphones"

-- Get the list of available output devices
set outputDevices to paragraphs of (do shell script "system_profiler SPAudioDataType | awk -F\": \" '/Devices:/ {flag=1; next} /Bluetooth/ {flag=0} flag {print $2}'")

-- Check if the desired output device is in the list
if desiredOutput is in outputDevices then
	-- Set the sound output to the desired device
	do shell script "osascript -e 'set volume output volume 0' && osascript -e 'set volume output volume 50' && osascript -e 'set volume output volume 100'"
	
	-- Display a notification with the new output device
	display notification "Sound output set to " & desiredOutput with title "Sound Output Changed"
else
	display dialog "The specified output device is not available." buttons {"OK"} default button "OK"
end if
