//
//  SkypeChatDisplay.h
//  SkypeImageInline
//
//  Created by Cameron Spickert on 10/4/12.
//  Copyright (c) 2012 Swedishcampground Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WebView, WebDataSource;

@interface SkypeChatDisplay : NSObject

- (NSURLRequest *)webView:(WebView *)sender resource:(id)identifier willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse fromDataSource:(WebDataSource *) dataSource;

@end
