//
//  ViewController.m
//  keelr-embed-demo
//
//  Created by Per-Olov Jernberg on 2014-06-09.
//  Copyright (c) 2014 Per-Olov Jernberg. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *redirect_uri = @"demoapp://";
    NSString *client_id = @"democlientid";
    NSString *sitename = @"demoapp";
    
    [self.web setDelegate:self];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://embed.keelr.com/v2/%@?client_id=%@&response_type=token&redirect_uri=%@", sitename, client_id, redirect_uri]];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.controller = self;

    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.web loadRequest:req];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // NSLog(@"shouldStart: %@", request.URL);
    if ([request.URL.host containsString:@"keelr.com"] ||
        [request.URL.host containsString:@"keelr2.com"]) {
        if (![request.URL.host containsString:@"login."]) {
            return TRUE;
        }
    }
    [[UIApplication sharedApplication] openURL:request.URL];
    return FALSE;
}

- (void) setAuthAccessToken:(NSString *)accessToken {
    [self.web stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"_logincallback('%@');", accessToken]];
}

- (void) setAuthError:(NSString *)error {
    [self.web stringByEvaluatingJavaScriptFromString:@"_logincallback(null);"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
