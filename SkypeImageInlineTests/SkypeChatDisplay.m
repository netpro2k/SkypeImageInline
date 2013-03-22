//
//  SkypeChatDisplay.m
//  SkypeImageInline
//
//  Created by Cameron Spickert on 10/4/12.
//  Copyright (c) 2012 Swedishcampground Software. All rights reserved.
//

#import "SkypeChatDisplay.h"

@implementation SkypeChatDisplay

- (NSURLRequest *)webView:(WebView *)sender resource:(id)identifier willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse fromDataSource:(WebDataSource *) dataSource
{
    NSLog(@"Request blocked!");
    return nil;
}

@end
