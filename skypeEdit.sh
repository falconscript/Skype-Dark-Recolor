export LANG=C # Necessary for sed to treat binary data as repleacable strings
BACKUPSPOT="/Applications/Skype.app/Contents/Sk.bak"
SKYPELOCATION="/Applications/Skype.app/Contents/MacOS/Skype"

# If the backup exists, let's overwrite the current one to replace it
if [ -e "$BACKUPSPOT" ]; then
  cp "$BACKUPSPOT" "$SKYPELOCATION"
else
  cp "$SKYPELOCATION" "$BACKUPSPOT"
fi

# Restore option. Just run this program like this ./skypecolor.sh --restore
if [ "$1" = "--restore" ]; then
  if ! [ -e "$BACKUPSPOT" ]; then
    echo "[!] Backup at $BACKUPSPOT not found!! Cannot restore!"
    exit 1
  fi

  echo "[!] Restoring from backup from $BACKUPSPOT..."
  killall Skype
  mv "$BACKUPSPOT" "$SKYPELOCATION"
  echo "[+] Done."
  open /Applications/Skype.app
  exit 0
fi

echo "[+] Changing colors... Will restart skype when completed"
echo "[+] To revert to backup, run $0 --restore"


####### COLOR SWITCHES ########

killall Skype # Necessary for dirty null characters


# Color for the "Today" banner just at the top of a chat window ALSO a 1px border between the leftpane and main chat. Also the "inner" color for the video/voice chat buttons
# For this one you must edit the second color in the .replace("#ffffff\0", "#thisone\0")) section LEAVING the \0 there in both colors!!
cat "$SKYPELOCATION" | python -c 'import sys; sys.stdout.write(sys.stdin.read().replace("#ffffff\0", "#404040\0"))' > /tmp/skypetemp
mv /tmp/skypetemp "$SKYPELOCATION"
chmod 777 "$SKYPELOCATION" # I am aware that this technique is DIRTY OK



# Switch out OWNER's bubble background color
sed -i.donotuse 's/#DBF4FD/#606060/g' "$SKYPELOCATION"

# Switch out PARTNER's bubble background color
sed -i.donotuse 's/#F0F4F8/#404040/g' "$SKYPELOCATION"

# Switch out main TEXT color
sed -i.donotuse 's/#1e1e1e/#ffffff/g' "$SKYPELOCATION"

# Switch out MAIN BACKGROUND color for chat and Contacts panels
# BE VERY WARY OF THIS ONE!!! I BELIEVE YOU CAN ONLY REPLACE "white" with a 5 letter color name!!
# This color must ALSO BE SUPPORTED BY MAC OS X COCOA FRAMEWORK
sed -i.donotuse 's/whiteColor/blackColor/g' "$SKYPELOCATION"


### LESSER IMPORTANT ONES ###

# Left sidebar
sed -i.donotuse 's/#f9fbfd/#303030/g' "$SKYPELOCATION"

# Partner's NAME color
sed -i.donotuse 's/#33353a/#bbbbbb/g' "$SKYPELOCATION"

# Partner's STATUS and "Type a message here" text color
sed -i.donotuse 's/#667486/#909090/g' "$SKYPELOCATION"

# Timestamps on the right of messages
sed -i.donotuse 's/#B8CBDB/#aaaaaa/g' "$SKYPELOCATION"

# Color for the blue background highlighter on the left sidebar when a name is selected
sed -i.donotuse 's/#c7edfc/#757575/g' "$SKYPELOCATION"

# Color for TYPING TEXT before you send it
sed -i.donotuse 's/#2B2B30/#ffffff/g' "$SKYPELOCATION"

# Color for Skype dark Blue (Used on BUTTONS for video/voice call)
sed -i.donotuse 's/#00aff0/#808080/g' "$SKYPELOCATION"

# Color for texts "Today" and "Skype via" by the message text box
sed -i.donotuse 's/#077DB4/#aaaaaa/g' "$SKYPELOCATION"

# Hyperlink in chat colors
sed -i.donotuse 's/#0575B6/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#056da9/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#05527C/#99ff99/g' "$SKYPELOCATION"

# Colors for 1px BORDERS between the left sidebar and the main chat
sed -i.donotuse 's/#e7f1f5/#000000/g' "$SKYPELOCATION"

# For the word "Recent" right above your recent chats
sed -i.donotuse 's/#8ba9b8/#757575/g' "$SKYPELOCATION"

# NOT TRUE IGNORE -> # Color for the words "Send SMS to" when you click the little arrow right above where you type (next to the via Skype)
sed -i.donotuse 's/#a2c5d3/#ff0000/g' "$SKYPELOCATION"
# These do nothing...
sed -i.donotuse 's/#c0dce6/#ff0000/g' "$SKYPELOCATION"
sed -i.donotuse 's/#758d99/#00ff00/g' "$SKYPELOCATION"
sed -i.donotuse 's/#f5fcfe/#0000ff/g' "$SKYPELOCATION"

# Weird light blues apparently... But I don't think they actually correspond to anything
#sed -i.donotuse 's/#66cff6/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#b3e7fb/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#cfeffc/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#d9f3fd/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#e6f7fe/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#effafe/#99ff99/g' "$SKYPELOCATION"

# Dark blues
#sed -i.donotuse 's/#0094cb/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#0078ca/#99ff99/g' "$SKYPELOCATION"
# Darker blues
#sed -i.donotuse 's/#197ead/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#056ba6/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#092e48/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#072237/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#034870/#99ff99/g' "$SKYPELOCATION"


# Greens? I don't think we HAVE any... so this is useless
#sed -i.donotuse 's/#7fba00/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#b9d709/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#639529/#99ff99/g' "$SKYPELOCATION"
#sed -i.donotuse 's/#b9d709/#99ff99/g' "$SKYPELOCATION"


# Fogs / Grays (allegedly... I see them do NOTHING)
sed -i.donotuse 's/#6e6e73/#00ff00/g' "$SKYPELOCATION"
sed -i.donotuse 's/#93999d/#0000ff/g' "$SKYPELOCATION"
sed -i.donotuse 's/#c8cbcd/#00ffff/g' "$SKYPELOCATION"
sed -i.donotuse 's/#f2f2f2/#ff00ff/g' "$SKYPELOCATION"

# Nothing
sed -i.donotuse 's/#e4e5e6/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#007233/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#dd5900/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#2a3281/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#4b68b0/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#67297a/#99ff99/g' "$SKYPELOCATION"

# Most of these are useless
# but ONE of them corresponds to the little number next to a name upon receiving new messages
# ANOTHER is that tiny dot on the smiley to the right of the text input window
sed -i.donotuse 's/#0094cb/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#0078ca/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#7fba00/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#639529/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#b9d709/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#fcd116/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#ff8c00/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#e81123/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#ec008c/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#f3477a/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#68217a/#99ff99/g' "$SKYPELOCATION"
sed -i.donotuse 's/#fff9de/#99ff99/g' "$SKYPELOCATION"


# Nothing
sed -i.donotuse 's/#B2E7FA/#ff0000/g' "$SKYPELOCATION"
sed -i.donotuse 's/#AABECF/#00ff00/g' "$SKYPELOCATION"



# Clean up that stupid one generated by sed
rm "$SKYPELOCATION.donotuse"

echo "[+] DONE!"

# Restart Skype
open /Applications/Skype.app


