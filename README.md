# Skype-Dark-Recolor FOR MAC
Change your Skype Installation to a custom black theme through binary color editing. Sick of the white and blue? Darken it!


NOTE: You must open skype at least one time after installing it BEFORE running this script. This is because Mac validates Skype's code signature on the FIRST EVER launch of Skype. After that one first load, you're free to run this.

# Run in Terminal:
```bash
git clone https://github.com/falconscript/Skype-Dark-Recolor.git
cd Skype-Dark-Recolor
./skypeEdit.sh
```

It takes like 10 seconds to complete.

To restore to original:
```bash
./skypeEdit.sh --restore
```

NOTE: Skype might update and cause this recolor to break. This will probably work on the new versions as they come out. If anything goes wrong, just delete /Applications/Skype and redownload from skype.com

NOTE: This script does not modify or change any functionality of the Skype program. Only drawback is that contact names are a little hard to see. Clicking the contact will show the name properly.
