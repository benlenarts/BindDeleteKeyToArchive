# BindDeleteKeyToArchive.mailbundle

This mail bundle binds the delete key to the "archive messages" command in the list of messages. This overrides the default behavior of "delete messages".

If you prefer to put emails in the archive by default, this extension makes it easier to go through your inbox using the keyboard.

## Download build

http://benlenarts.github.com/BindDeleteKeyToArchive.zip

## Build instructions

1. Build with Xcode 4.6.1
2. Place resulting .mailbundle in ~/Library/Mail/Bundles
3. Enable bundle support in Mail:

       `defaults write com.apple.mail EnableBundles -bool true`
       
4. Relaunch Mail 
