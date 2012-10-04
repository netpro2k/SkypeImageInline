//
//  SkypeAnySize.m
//  SkypeAnySize
//
//  Copyright (c) 2012 Dominick D'Aniello. All rights reserved.
//

#import "SkypeImageInline.h"
#import <objc/runtime.h>
#import <objc/message.h>

@class WebView, WebDataSource;

@interface SkypeImageInline ()

- (NSApplication *)skypeApp;

@end

@implementation SkypeImageInline

+ (void)load
{
    SkypeImageInline *plugin = [SkypeImageInline sharedInstance];
    [plugin rewireWebview];

    NSLog(@"SkypeImageInline successfully installed");
}

+ (SkypeImageInline *)sharedInstance
{
    static SkypeImageInline *plugin = nil;

    if (plugin == nil) {
        plugin = [SkypeImageInline new];
    }

    return plugin;
}

- (NSApplication *)skypeApp
{
    return [NSApplication sharedApplication];
}

- (NSURLRequest *)webView:(WebView *)sender resource:(id)identifier willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse fromDataSource:(WebDataSource *) dataSource
{
    // Override default Skype behavior of blocking HTTP requests
    return request;
}

- (void)rewireWebview
{
    Class cls = NSClassFromString(@"SkypeChatDisplay");
    SEL sel = @selector(webView:resource:willSendRequest:redirectResponse:fromDataSource:);
    Method origMethod = class_getInstanceMethod(cls, sel);
    Method newMethod = class_getInstanceMethod(self.class, sel);
    IMP imp = method_getImplementation(newMethod);
    class_replaceMethod(cls, sel, imp, method_getTypeEncoding(origMethod));
}

@end
