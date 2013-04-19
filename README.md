# SkypeImageInline

Inlines links to images in skype conversations.

## Simple install

1. Install [SIMBL](http://www.culater.net/software/SIMBL/SIMBL.php) if you do not already have it.
2. Download and run the [latest Installer package](https://github.com/netpro2k/SkypeImageInline/raw/master/Installers/SkypeImageInline-1.1.pkg).
3. In Skype, select the SkypeImageInline style in Skype -> Preferences -> Messaging.
4. Relaunch Skype.

## Build and install from source

```bash
git clone git://github.com/netpro2k/SkypeImageInline.git
cd SkypeImageInline
xcodebuild -project SkypeImageInline.xcodeproj -target SkypeImageInline -configuration Release build
cp -r build/Release/SkypeImageInline.bundle ~/Library/Application\ Support/SIMBL/Plugins/
cp -r SkypeImageInline.SkypeChatStyle ~/Library/Application\ Support/Skype/ChatStyles/
```

## Usage

After installing, any links to images containing .jpg, .jpeg, .gif, .png or cl.ly will automatically be inlined as images. You can click on the image to open in a browser.

## Copyright

Copyright &copy; Dominick D'Aniello. See LICENSE for details.
