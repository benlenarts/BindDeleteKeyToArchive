# BindDeleteKeyToArchive.mailbundle

This mail bundle binds the delete key to the "archive messages" command in the list of messages. This overrides the default behavior of "delete messages".

If you prefer to put emails in the archive by default, this extension makes it easier to go through your inbox using the keyboard.

## Add current Mail.app UUID to Info.plist

1. Obtain the latest UUID:

       `defaults read /Applications/Mail.app/Contents/Info PluginCompatibilityUUID | pbcopy`

2. Add that UUID to the 'SupportedPluginCompatibilityUUIDs' key in
   Info.plist

## Build instructions

1. Build with Xcode 4.6.1 (or higher)
2. Place resulting .mailbundle in ~/Library/Mail/Bundles
3. Enable bundle support in Mail:

       `defaults write com.apple.mail EnableBundles -bool true`
       
4. Relaunch Mail 
