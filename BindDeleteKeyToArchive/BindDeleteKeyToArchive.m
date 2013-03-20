//
//  NoFlaggedMailbox.m
//  NoFlaggedMailbox
//
//  Created by Eelco Lempsink on 28-09-12.
//  Copyright (c) 2012 Eelco Lempsink. All rights reserved.
//

#import "BindDeleteKeyToArchive.h"
#import <objc/objc-runtime.h>
#import <AppKit/AppKit.h>

@implementation BindDeleteKeyToArchive

+ (void)load {
    Class c = NSClassFromString(@"MailTableView");
    SEL originalSelector = @selector(keyDown:);
    SEL overrideSelector = @selector(override_keyDown:);
    Method originalMethod = class_getInstanceMethod(c, originalSelector);
    Method overrideMethod = class_getInstanceMethod(self, overrideSelector);

    class_addMethod(c, overrideSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    class_replaceMethod(c, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod));

}

- (void)override_keyDown:(NSEvent*)event {
    unichar key = [[event characters] characterAtIndex:0];
    if (key == NSDeleteCharacter) {
        id messageViewer = [[self performSelector:@selector(delegate)] performSelector:@selector(delegate)];
        [messageViewer performSelector:@selector(archiveMessages:) withObject:nil];
    } else {
        [self override_keyDown:event];
    }

}

@end
