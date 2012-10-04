# SkypeImageInline

Inlines links to images in skype conversations. It includes 2 parts:

[SIMBL plugin]: http://www.culater.net/software/SIMBL/SIMBL.php

## Installation

1. Clone the repo
2. Open in Xcode
3. Build it as Release
4. Symlink or move the built `SkypeImageInline.bundle` into `~/Library/Application\ Support/SIMBL/Plugins`
5. Copy the SkypeImageInline.SkypeChatStyle to `~/Library/Application\ Support/Skype/ChatStyles/`
6. Open Skype
7. Select the ImageInline style in in Skype > Preferences > Messaging
6. Relaunch Skype

### Install script

```bash
git clone git://github.com/cspicker/SkypeImageInline.git
cd SkypeImageInline
xcodebuild -project SkypeImageInline.xcodeproj -target SkypeImageInline -configuration Release build
cp -r build/Release/SkypeImageInline.bundle ~/Library/Application\ Support/SIMBL/Plugins/
cp -r SkypeImageInline.SkypeChatStyle ~/Library/Application\ Support/Skype/ChatStyles/
```

## Usage

After installing, any links containing .jpg, .jpeg, .gif, .png or cl.ly will automatically be inlined as images. You can click on the image to open in a browser.

## Copyright

Copyright &copy; Dominick D'Aniello. See LICENSE for details.