//
//  SkypeImageInlineTests.m
//  SkypeImageInlineTests
//
//  Created by Cameron Spickert on 10/4/12.
//  Copyright (c) 2012 Swedishcampground Software. All rights reserved.
//

#import "SkypeImageInlineTests.h"
#import "SkypeChatDisplay.h"

@implementation SkypeImageInlineTests

@synthesize skypeChatDisplay=_skypeChatDisplay;

- (void)setUp
{
    [super setUp];
    [self setSkypeChatDisplay:[[SkypeChatDisplay new] autorelease]];
}

- (void)tearDown
{
    [_skypeChatDisplay release], _skypeChatDisplay = nil;
    [super tearDown];
}

- (void)testLoadPlugin
{
    SkypeChatDisplay *skypeChatDisplay = [self skypeChatDisplay];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com/"]];
    
    NSURLRequest *resultBeforeLoading = [skypeChatDisplay webView:nil resource:nil willSendRequest:request redirectResponse:nil fromDataSource:nil];
    STAssertNil(resultBeforeLoading, @"Skype chat display should not allow requests by default");
    
    NSBundle *testBundle = [NSBundle bundleWithIdentifier:@"com.cameronspickert.SkypeImageInlineTests"];
    NSString *pluginPath = [testBundle pathForResource:@"SkypeImageInline" ofType:@"bundle"];
    NSBundle *pluginBundle = [NSBundle bundleWithPath:pluginPath];
    
    STAssertNotNil(pluginBundle, @"Plugin bundle should be non-nil");
    STAssertTrue([pluginBundle load], @"Plugin bundle should load");
    
    NSURLRequest *resultAfterLoading = [skypeChatDisplay webView:nil resource:nil willSendRequest:request redirectResponse:nil fromDataSource:nil];
    STAssertNotNil(resultAfterLoading, @"Skype chat display should load requests after plugin is loaded");
}

@end
