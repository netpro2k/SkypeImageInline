//
//  SkypeAnySize.m
//  SkypeAnySize
//
//  Copyright (c) 2012 Dominick D'Aniello. All rights reserved.
//

#import "SkypeImageInline.h"
#import <objc/runtime.h> 
#import <objc/message.h>
#import <WebKit/WebResourceLoadDelegate.h>

@interface SkypeImageInline()

- (NSApplication*) skypeApp;
- (void) resetMinSize;

@end

@implementation SkypeImageInline

+ (void) load
{
  SkypeImageInline *plugin = [SkypeImageInline sharedInstance];
  [plugin rewireWebview];

  NSLog(@"SkypeImageInline successfully installed");
}

+ (SkypeImageInline*) sharedInstance
{
  static SkypeImageInline *plugin = nil;
  
  if (plugin == nil)
    plugin = [SCGSkypeAnySize new];

  return plugin;
}

- (NSApplication*) skypeApp
{
  return [NSApplication sharedApplication];
}

- (NSURLRequest *) webView:(WebView *)sender resource:(id)identifier willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse fromDataSource:(WebDataSource *) dataSource {
    return request;
}

- (void) rewireWebview
{
    Class c = NSClassFromString(@"SkypeChatDisplay");
    SEL s = @selector(webView:resource:willSendRequest:redirectResponse:fromDataSource:);
    Method origMethod = class_getInstanceMethod(c, s);
    Method newMethod = class_getInstanceMethod(self.class, s);
    IMP imp = method_getImplementation(newMethod);
    class_replaceMethod(c, s, imp, method_getTypeEncoding(origMethod));
}

@end
