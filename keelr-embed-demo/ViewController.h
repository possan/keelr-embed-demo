//
//  ViewController.h
//  keelr-embed-demo
//
//  Created by Per-Olov Jernberg on 2014-06-09.
//  Copyright (c) 2014 Per-Olov Jernberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, assign) IBOutlet UIWebView *web;

- (void) setAuthAccessToken:(NSString *)accessToken;
- (void) setAuthError:(NSString *)error;

@end

