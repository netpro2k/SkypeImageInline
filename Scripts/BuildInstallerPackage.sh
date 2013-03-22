#!/bin/sh

set -e

alias packagemaker=/Applications/PackageMaker.app/Contents/MacOS/PackageMaker

SRCROOT="$(cd "$(dirname $0)/.."; pwd)"
PKGROOT="${SRCROOT}/deploy"
VERSION="$(agvtool what-marketing-version -terse1)"

# Build the SIMBL plugin
xcodebuild DSTROOT="${PKGROOT}" -project SkypeImageInline.xcodeproj -configuration Release -target SkypeImageInline clean build install

mkdir -p "${PKGROOT}/Library/Application Support/Skype/ChatStyles"
cp -r "${SRCROOT}/SkypeImageInline.SkypeChatStyle" "${PKGROOT}/Library/Application Support/Skype/ChatStyles"/

# Build the Installer package
packagemaker \
   --title "SkypeImageInline" \
   --version "${VERSION}" \
   --filter "\.DS_Store" \
   --root-volume-only \
   --domain "user" \
   --verbose \
   --no-relocate \
   --install-to "/" \
   --target "10.5" \
   --id "com.cameronspickert.SkypeImageInline_Installer.pkg" \
   --root "${PKGROOT}" \
   --out "${SRCROOT}/Installers/SkypeImageInline-${VERSION}.pkg"
