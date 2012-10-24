# SkypeImageInline

Inlines links to images in skype conversations. It includes 2 parts:

1. a [SIMBL](http://www.culater.net/software/SIMBL/SIMBL.php) plugin.
2. a "chat style" for Skype

## Installation

1. Clone the repo
2. Open in Xcode
3. Build it as Release
4. Symlink or move the built `SkypeImageInline.bundle` into `~/Library/Application\ Support/SIMBL/Plugins`
5. Copy the SkypeImageInline.SkypeChatStyle to `~/Library/Application\ Support/Skype/ChatStyles/`
6. Open Skype
7. Select the ImageInline style in in Skype > Prefferences > Messaging
6. Relaunch Skype

## Usage

After installing, any links containg .jpg, .gif, .png or cl.ly will automatically be inlined as images. You can click on the image to open in browser.

## Copyright

Copyright &copy; Dominick D'Aniello. See LICENSE for details.