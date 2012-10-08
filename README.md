# SkypeImageInline

Inlines links to images in skype conversations. It includes 2 parts:

[SIMBL plugin]: http://www.culater.net/software/SIMBL/SIMBL.php

## Simple install

1. Download and run the [latest Installer package](https://github.com/cspicker/SkypeImageInline/blob/master/Installers/SkypeImageInline-1.0.pkg).
2. In Skype, select the SkypeImageInline style in Skype -> Preferences -> Messaging.
3. Relaunch Skype.

## Build and install from source

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